package vn.devpro.javawebProject31.dto;

import java.math.BigDecimal;

public class SearchCategoryDTO {
	private int id;
    private String name;
    private String avatar;
    private BigDecimal price;
    private BigDecimal salePrice;
    private String categoryName;
    private int salePercent;
	public SearchCategoryDTO(int id, String name, String avatar, BigDecimal price, BigDecimal salePrice,
			String categoryName, int salePercent) {
		super();
		this.id = id;
		this.name = name;
		this.avatar = avatar;
		this.price = price;
		this.salePrice = salePrice;
		this.categoryName = categoryName;
		this.salePercent = salePercent;
	}
	public SearchCategoryDTO() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public BigDecimal getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getSalePercent() {
		return salePercent;
	}
	public void setSalePercent(int salePercent) {
		this.salePercent = salePercent;
	}
    
    
    
}
