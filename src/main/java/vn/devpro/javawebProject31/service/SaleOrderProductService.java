package vn.devpro.javawebProject31.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.devpro.javawebProject31.model.SaleOrder;
import vn.devpro.javawebProject31.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> {
		@Override
		public Class<SaleOrderProduct> clazz() {
			// TODO Auto-generated method stub
			return SaleOrderProduct.class;
		}
		public int getSaleOrderProductByProductId(SaleOrder saleOrder, int productId, String size) {
			
			for (int i = 0; i < saleOrder.getSaleOrderProducts().size(); i ++) { 
				if (saleOrder.getSaleOrderProducts().get(i).getProduct().getId() == productId && 
						saleOrder.getSaleOrderProducts().get(i).getSize().equals(size)) { 
					return i; 
				}
			}
			 return -1; 
		}
		public BigDecimal totalPrice(SaleOrderProduct orderProduct) {
		    BigDecimal price = orderProduct.getPrice();
		    BigDecimal salePrice = orderProduct.getSalePrice();
		    int quantity = orderProduct.getQuantity();

		    if (salePrice == null || salePrice.compareTo(BigDecimal.ZERO) <= 0 || salePrice.compareTo(price) >= 0) {
		        return price.multiply(BigDecimal.valueOf(quantity));
		    }
		    return salePrice.multiply(BigDecimal.valueOf(quantity));
		}

		@Transactional
		public void removeSaleOrderProductByIdAndSize(int productId, String size, int saleOrderId) { 
			String sql = "DELETE FROM tbl_sale_order_product where product_id = :productId and size = :size and sale_order_id = :saleOrderId"; 
			 Map<String, Object> params = new HashMap();
			    params.put("productId", productId);
			    params.put("size", size);
			    params.put("saleOrderId", saleOrderId);
			super.executeNativeSql(sql,params); 
		}
}
