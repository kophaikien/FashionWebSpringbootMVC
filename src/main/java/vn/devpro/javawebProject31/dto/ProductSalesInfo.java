package vn.devpro.javawebProject31.dto;

import java.math.BigDecimal;

public class ProductSalesInfo {
	 private String productName;
	    private int totalOrders;
	    private BigDecimal totalAmount;
	    private int totalQuantity;
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public int getTotalOrders() {
			return totalOrders;
		}
		public void setTotalOrders(int totalOrders) {
			this.totalOrders = totalOrders;
		}
		public BigDecimal getTotalAmount() {
			return totalAmount;
		}
		public void setTotalAmount(BigDecimal totalAmount) {
			this.totalAmount = totalAmount;
		}
		public int getTotalQuantity() {
			return totalQuantity;
		}
		public void setTotalQuantity(int totalQuantity) {
			this.totalQuantity = totalQuantity;
		}
		public ProductSalesInfo(String productName, int totalOrders, BigDecimal totalAmount, int totalQuantity) {
			super();
			this.productName = productName;
			this.totalOrders = totalOrders;
			this.totalAmount = totalAmount;
			this.totalQuantity = totalQuantity;
		}
		public ProductSalesInfo() {
			super();
		}
	    
	    
}
