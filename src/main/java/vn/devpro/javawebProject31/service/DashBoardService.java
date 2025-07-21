package vn.devpro.javawebProject31.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import vn.devpro.javawebProject31.dto.ProductSalesInfo;
import vn.devpro.javawebProject31.enums.OrderStatus;

@Service
public class DashBoardService {
	@PersistenceContext 
	private EntityManager entityManager ;
	 public long getTotalUsers() {
	        String jpql = "SELECT COUNT(u) FROM User u";
	        Object result = entityManager.createQuery(jpql).getSingleResult();
	        return ((Number) result).longValue();
	    }

	    public long getTotalOrders() {
	        String jpql = "SELECT COUNT(o) FROM SaleOrder o";
	        Object result = entityManager.createQuery(jpql).getSingleResult();
	        return ((Number) result).longValue();
	    }

	    public BigDecimal getTotalRevenue() {
	        String jpql = "SELECT COALESCE(SUM(o.total), 0) FROM SaleOrder o WHERE o.status = :status";
	        Object result = entityManager.createQuery(jpql)
	            .setParameter("status", OrderStatus.DA_GIAO)
	            .getSingleResult();
	        return (BigDecimal) result;
	    }
	    public List<ProductSalesInfo> getRecentProductSales() {
	        String jpql = "SELECT p.name, COUNT(DISTINCT so.id), " +
	                      "SUM(sop.quantity * CASE WHEN p.salePrice > 0 THEN p.salePrice ELSE p.price END), " +
	                      "SUM(sop.quantity) " +
	                      "FROM SaleOrderProduct sop " +
	                      "JOIN sop.product p " +
	                      "JOIN sop.saleOrder so " +
	                      "WHERE so.status = :status " +
	                      "GROUP BY p.id, p.name " +
	                      "ORDER BY MAX(so.createDate) DESC";

	        List<Object[]> results = entityManager.createQuery(jpql)
	            .setParameter("status", OrderStatus.DA_GIAO)
	            .getResultList();

	        List<ProductSalesInfo> list = new ArrayList<>();
	        for (Object[] row : results) {
	            ProductSalesInfo info = new ProductSalesInfo();
	            info.setProductName((String) row[0]);
	            info.setTotalOrders(((Number) row[1]).intValue());
	            info.setTotalAmount((BigDecimal) row[2]);
	            info.setTotalQuantity(((Number) row[3]).intValue());
	            list.add(info);
	        }

	        return list;
	    }

}
