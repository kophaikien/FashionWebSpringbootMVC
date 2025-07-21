package vn.devpro.javawebProject31.dto;

import java.util.Date;

public class SaleOrderSearchDTO {
	private Date beginDate;
    private Date endDate;
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public SaleOrderSearchDTO(Date beginDate, Date endDate) {
		super();
		this.beginDate = beginDate;
		this.endDate = endDate;
	}
	public SaleOrderSearchDTO() {
		super();
	}
    
    
    
}
