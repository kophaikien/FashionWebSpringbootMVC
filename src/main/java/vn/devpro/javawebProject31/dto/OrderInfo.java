package vn.devpro.javawebProject31.dto;

import java.math.BigDecimal;

public class OrderInfo {
		private String name; 
		
		private String email; 
		 
		private String mobile; 
		
		private String paymentMethod; 
	
		private BigDecimal amount;
		
		private String address; 
		
		private String mobileSub; 
		
		public String getPaymentMethod() {
			return paymentMethod;
		}

		public void setPaymentMethod(String paymentMethod) {
			this.paymentMethod = paymentMethod;
		}
		
		public String getMobileSub() {
			return mobileSub;
		}

		public void setMobileSub(String mobileSub) {
			this.mobileSub = mobileSub;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getName() {
			return name;
		}

		

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		

		
		public OrderInfo(String name, String email, String mobile, String paymentMethod, BigDecimal amount,
				String address, String mobileSub) {
			super();
			this.name = name;
			this.email = email;
			this.mobile = mobile;
			this.paymentMethod = paymentMethod;
			this.amount = amount;
			this.address = address;
			this.mobileSub = mobileSub;
		}

		public BigDecimal getAmount() {
			return amount;
		}

		public void setAmount(BigDecimal amount) {
			this.amount = amount;
		}

		
}
