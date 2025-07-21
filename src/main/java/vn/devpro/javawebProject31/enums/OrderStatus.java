package vn.devpro.javawebProject31.enums;

public enum OrderStatus {
	DANG_TRONG_GIO("Đang trong giỏ hàng"),
    CHO_XAC_NHAN("Chờ xác nhận"),
    XAC_NHAN("Đã xác nhận"),
    DANG_GIAO("Đang giao"),
    DA_GIAO("Đã giao"),  
	DA_HUY("Đã hủy");
    
    private final String label;
    
	OrderStatus(String label){ 
		this.label = label; 
	}
	public String getLabel() { 
		return label; 
	}
	
      
    
}
