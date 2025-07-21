package vn.devpro.javawebProject31.dto;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

public class ProductDTO {
	private Integer id;
	
	private String name; 
	
	private String avatar; 
	
	private BigDecimal price;
	
	private BigDecimal salePrice; 

	private String shortDescription; 
	
	private String categoryName; 
	
	private Date updateDate; 
	
	private Date createDate; 
	
	private boolean status;
	
	private boolean isHot;
	private BigInteger totalQuantity; 

	private String additionalInfo; 
	
	private BigDecimal originalPrice; 
	
	public ProductDTO(Integer id, String name, String avatar, BigDecimal price, BigDecimal salePrice,
			String shortDescription, String categoryName, Date updateDate, Date createDate, boolean status,
			boolean isHot, String additionalInfo, BigDecimal originalPrice, BigInteger totalQuantity) {
		super();
		this.id = id;
		this.name = name;
		this.avatar = avatar;
		this.price = price;
		this.salePrice = salePrice;
		this.shortDescription = shortDescription;
		this.categoryName = categoryName;
		this.updateDate = updateDate;
		this.createDate = createDate;
		this.status = status;
		this.isHot = isHot;
		this.additionalInfo = additionalInfo;
		this.originalPrice = originalPrice;
		this.totalQuantity = totalQuantity;
	}

	public BigDecimal getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(BigDecimal originalPrice) {
		this.originalPrice = originalPrice;
	}

	public String getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	



	public BigInteger getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(BigInteger totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}


	public ProductDTO() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean getIsHot() {
		return isHot;
	}

	public void setHot(boolean isHot) {
		this.isHot = isHot;
	}

	
	
}
