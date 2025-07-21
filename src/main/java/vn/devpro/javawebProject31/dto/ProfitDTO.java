package vn.devpro.javawebProject31.dto;

import java.math.BigDecimal;
import java.util.Date;

public class ProfitDTO {
	private String code; 
    private Date createDate;
    private Date updateDate;
    private String payment;
    private String status;
    private BigDecimal totalAmount;
    private BigDecimal totalImportCost;
    private BigDecimal totalProfit;
    private int id; 
	public ProfitDTO() {
		super();
	}
	public ProfitDTO(String code, Date createDate, Date updateDate, String payment, String status,
			BigDecimal totalAmount, BigDecimal totalImportCost, BigDecimal totalProfit, int id) {
		super();
		this.code = code;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.payment = payment;
		this.status = status;
		this.totalAmount = totalAmount;
		this.totalImportCost = totalImportCost;
		this.totalProfit = totalProfit;
		this.id = id;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public BigDecimal getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}
	public BigDecimal getTotalImportCost() {
		return totalImportCost;
	}
	public void setTotalImportCost(BigDecimal totalImportCost) {
		this.totalImportCost = totalImportCost;
	}
	public BigDecimal getTotalProfit() {
		return totalProfit;
	}
	public void setTotalProfit(BigDecimal totalProfit) {
		this.totalProfit = totalProfit;
	}
	
    
}
