package vn.devpro.javawebProject31.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import vn.devpro.javawebProject31.dto.ProfitDTO;


@Service
public class ProfitService {
	@PersistenceContext
	private EntityManager entityManager; 
	public List<ProfitDTO> getProfitStatsByDateRange(LocalDate begin, LocalDate end) {
	    String jpql = "SELECT so.id, so.code, so.createDate, so.updateDate, so.payment, so.status, " +
	                  "SUM(sop.quantity * COALESCE(NULLIF(sop.salePrice, 0), sop.price)), " +
	                  "SUM(sop.quantity * p.originalPrice) " +
	                  "FROM SaleOrder so " +
	                  "LEFT JOIN so.saleOrderProducts sop " +
	                  "LEFT JOIN sop.product p " +
	                  "WHERE (:begin IS NULL OR so.createDate >= :begin) " +
	                  "AND (:end IS NULL OR so.createDate <= :end) " +
	                  "AND so.status = 'DA_GIAO' " +
	                  "GROUP BY so.id, so.code, so.createDate, so.updateDate, so.payment, so.status " +
	                  "ORDER BY so.createDate DESC";

	    List<Object[]> results = entityManager.createQuery(jpql)
	        .setParameter("begin", begin != null ? Timestamp.valueOf(begin.atStartOfDay()) : null)
	        .setParameter("end", end != null ? Timestamp.valueOf(end.atTime(23, 59, 59)) : null)
	        .getResultList();

	    List<ProfitDTO> list = new ArrayList<>();
	    for (Object[] row : results) {
	        ProfitDTO dto = new ProfitDTO();
	        dto.setId((int) row[0]);
	        dto.setCode((String) row[1]);
	        dto.setCreateDate((Date) row[2]);
	        dto.setUpdateDate((Date) row[3]);
	        dto.setPayment((String) row[4]);
	        dto.setStatus(row[5].toString());
	        dto.setTotalAmount((BigDecimal) row[6]);
	        dto.setTotalImportCost((BigDecimal) row[7]);
	        dto.setTotalProfit(dto.getTotalAmount().subtract(dto.getTotalImportCost()));
	        list.add(dto);
	    }

	    return list;
	}





}
