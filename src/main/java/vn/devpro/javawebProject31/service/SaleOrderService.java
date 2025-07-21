package vn.devpro.javawebProject31.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.devpro.javawebProject31.enums.OrderStatus;
import vn.devpro.javawebProject31.model.SaleOrder;
import vn.devpro.javawebProject31.model.SaleOrderProduct;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	
	@Autowired 
	private SaleOrderProductService saleOrderProductService; 
	
	@Override
	public Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	
	@Transactional
	public SaleOrder saveOrder(SaleOrder saleOrder) {
		return saveOrUpdate(saleOrder);
	}
	
	public List<SaleOrder> findAllActive() {
		String sql = "SELECT * FROM tbl_sale_order ";
		return super.executeNativeSql(sql);
	}
	public SaleOrder findCartByUser(int UserId){ 
		String sql = "SELECT * FROM tbl_sale_order WHERE status = 'DANG_TRONG_GIO' AND user_id = " + UserId; 
		return super.getEntityByNativeSQL(sql);
	}
	
	public List<SaleOrder> findAllCartByUser(int UserId){ 
		String sql = "SELECT * FROM tbl_sale_order WHERE user_id = " + UserId; 
		return super.executeNativeSql(sql);
	}
	public BigDecimal totalSaleOrderPrice(SaleOrder order) { 
		BigDecimal total = BigDecimal.ZERO; 
		for(SaleOrderProduct orderProduct : order.getSaleOrderProducts()) { 
			total = total.add(saleOrderProductService.totalPrice(orderProduct));
			
		}
		return total; 
	}
	
	public List<SaleOrder> findOrdersByDateRangeAndStatus(Date begin, Date end, OrderStatus status) {
	    String jpql = "FROM SaleOrder so WHERE so.status = :status " +
	                  "AND so.createDate >= :begin AND so.createDate <= :end";

	    return entityManager.createQuery(jpql, SaleOrder.class)
	            .setParameter("status", status)
	            .setParameter("begin", begin)
	            .setParameter("end", end)
	            .getResultList();
	}
	public BigDecimal calculateRevenueByDateRangeAndStatus(Date begin, Date end, OrderStatus status) {
	    String jpql = "SELECT SUM(sop.quantity * COALESCE(NULLIF(sop.salePrice, 0), sop.price)) " +
	                  "FROM SaleOrderProduct sop " +
	                  "JOIN sop.saleOrder so " +
	                  "WHERE so.status = :status AND so.createDate >= :begin AND so.createDate <= :end";

	    BigDecimal result = (BigDecimal) entityManager.createQuery(jpql)
	            .setParameter("status", status)
	            .setParameter("begin", begin)
	            .setParameter("end", end)
	            .getSingleResult();

	    return result != null ? result : BigDecimal.ZERO;
	}
	// .. 
//	public SaleOrder getSaleOrderWithVariantsById(int id) {
//	    String jpql = "SELECT DISTINCT so FROM SaleOrder so " +
//	                  "JOIN FETCH so.saleOrderProducts sop " +
//	                  "JOIN FETCH sop.product p " +
//	                  "LEFT JOIN FETCH p.variants " +
//	                  "WHERE so.id = :id";
//	    return entityManager.createQuery(jpql, SaleOrder.class)
//	                        .setParameter("id", id)
//	                        .getSingleResult();
//	}
	
	public SaleOrder fetchOrderWithVariants(int saleOrderId) {
	    // Bước 1: chỉ fetch 1 collection để tránh lỗi "multiple bags"
	    SaleOrder order = entityManager.createQuery(
	        "SELECT DISTINCT so FROM SaleOrder so " +
	        "JOIN FETCH so.saleOrderProducts sop " +
	        "JOIN FETCH sop.product p " +
	        "WHERE so.id = :id", SaleOrder.class)
	        .setParameter("id", saleOrderId)
	        .getSingleResult();

	    // Bước 2: gọi variants của từng product để Hibernate tự fetch (lazy)
	    for (SaleOrderProduct sop : order.getSaleOrderProducts()) {
	        sop.getProduct().getVariants().size();  // lazy load an toàn
	    }

	    return order;
	}

}
