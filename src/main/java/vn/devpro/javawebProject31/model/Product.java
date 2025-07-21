package vn.devpro.javawebProject31.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.core.Base64Variants;

/**
 * @author kinn1
 *
 */
@Entity
@Table(name = "tbl_product")
public class Product  extends BaseModel{
	
	@Column(name = "name" , length = 300, nullable = false)
	private String name; 
	
	@Column(name = "avatar", length = 300, nullable = false)
	private String avatar; 
	
	@Column(name = "price", nullable = true)
	private BigDecimal price = BigDecimal.ZERO; 
	
	@Column(name = "ori_price", nullable = true)
	private BigDecimal originalPrice = BigDecimal.ZERO; 
	
	
	@Column(name = "sale_price", nullable = true)
	private BigDecimal salePrice = BigDecimal.ZERO; 
	
	@Column(name = "short_description", length = 500, nullable = true) 
	private String shortDescription;  
	
	@Column(name = "additional_info",length = 500, nullable = true)
	private String additionalInfo; 
	
	@Column(name= "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE; 
	
	public BigDecimal getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(BigDecimal originalPrice) {
		this.originalPrice = originalPrice;
	}

	@Column(name = "is_new", nullable = true)
	private Boolean IsNew = Boolean.FALSE; 
	public String getAdditionalInfo() {
		return additionalInfo;
	}
	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}
	
	public Product(Integer id, Date createDate, Date updateDate, String name, String avatar, BigDecimal price,
			BigDecimal originalPrice, BigDecimal salePrice, String shortDescription, String additionalInfo,
			Boolean isHot, Boolean isNew, Category category, SaleValue saleValue, List<ProductImage> productImages,
			List<Variant> variants, List<SaleOrderProduct> saleOrderProducts) {
		super(id, createDate, updateDate);
		this.name = name;
		this.avatar = avatar;
		this.price = price;
		this.originalPrice = originalPrice;
		this.salePrice = salePrice;
		this.shortDescription = shortDescription;
		this.additionalInfo = additionalInfo;
		this.isHot = isHot;
		IsNew = isNew;
		this.category = category;
		this.saleValue = saleValue;
		this.productImages = productImages;
		this.variants = variants;
		this.saleOrderProducts = saleOrderProducts;
	}
	
	public Boolean getIsNew() {
		return IsNew;
	}
	public void setIsNew(Boolean isNew) {
		IsNew = isNew;
	}

	// mapping many to one: product to category
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;
//
	// mapping many to one: product to sale_value
		@ManyToOne(fetch = FetchType.EAGER)
		@JoinColumn(name = "sale_value_id")
		private SaleValue saleValue;
//	public Product(Integer id, Date createDate, Date updateDate, Boolean status, String name, String avatar,
//		BigDecimal price, BigDecimal salePrice, String shortDescription, Boolean isHot, Category category,
//		SaleValue saleValue, List<ProductImage> productImages, List<Variant> variants,
//		List<SaleOrderProduct> saleOrderProducts) {
//	super(id, createDate, updateDate, status);
//	this.name = name;
//	this.avatar = avatar;
//	this.price = price;
//	this.salePrice = salePrice;
//	this.shortDescription = shortDescription;
//	this.isHot = isHot;
//	this.category = category;
//	this.saleValue = saleValue;
//	this.productImages = productImages;
//	this.variants = variants;
////	this.userUpdateProduct = userUpdateProduct;
////	this.userCreateProduct = userCreateProduct;
//	this.saleOrderProducts = saleOrderProducts;
//}
	public SaleValue getSaleValue() {
			return saleValue;
		}
		public void setSaleValue(SaleValue saleValue) {
			this.saleValue = saleValue;
		}

	//
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private List<ProductImage> productImages= new ArrayList<ProductImage>();
	// methods add and remove elements in relational product list
	public void addRelationalProductImage(ProductImage productImage) {
			productImages.add(productImage); 
			productImage.setProduct(this);
		}
	public void removeRelationalProductImage(ProductImage productImage) {
			productImages.remove(productImage); 
			productImage.setProduct(null);
		}
	
	// mappign one to many: product-to-variant 
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product", orphanRemoval = true)
	private List<Variant> variants = new ArrayList<Variant>(); 
	//
	public void addRelationalVariant(Variant variant) {
		variants.add(variant); 
		variant.setProduct(this);
	}
	public void removeRelationalVariant(Variant variant) {
		variants.remove(variant); 
		variant.setProduct(null);
	}
//	//mapping many-to-one: product-to-user-create
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "update_by", referencedColumnName = "id")
//	private User userUpdateProduct; 
//	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "create_by", referencedColumnName = "id")
//	private User userCreateProduct; 
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product" )
	private List<SaleOrderProduct> saleOrderProducts= new ArrayList<SaleOrderProduct>();
	
	// methods add and remove elements in relational product list
	public void addRelationalProduct(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.add(saleOrderProduct);  
		saleOrderProduct.setProduct(this);
	}
	public void remove(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.remove(saleOrderProduct); 
		saleOrderProduct.setProduct(null);
	}
	
	
	
	
	
	public List<Variant> getVariants() {
		return variants;
	}
	public void setVariants(List<Variant> variants) {
		this.variants = variants;
	}
	public List<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}
	public void setSaleOrderProducts(List<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public List<ProductImage> getProductImages() {
		return productImages;
	}
	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}
//	public User getUserUpdateProduct() {
//		return userUpdateProduct;
//	}
//	public void setUserUpdateProduct(User userUpdateProduct) {
//		this.userUpdateProduct = userUpdateProduct;
//	}
//	public User getUserCreateProduct() {
//		return userCreateProduct;
//	}
//	public void setUserCreateProduct(User userCreateProduct) {
//		this.userCreateProduct = userCreateProduct;
//	}
//	
	// mapping many to many 
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAvartar() {
		return avatar;
	}

	public void setAvartar(String avartar) {
		this.avatar = avartar;
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

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}



	

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Product() {
		super();
	}
	


	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product" )
//	private List<SaleOrderProduct> saleOrderProducts= new ArrayList<SaleOrderProduct>();
//	
//	// methods add and remove elements in relational product list
//	public void addRelationalProduct(SaleOrderProduct saleOrderProduct) {
//		saleOrderProducts.add(saleOrderProduct);  
//		saleOrderProduct.setProduct(this);
//	}
//	public void remove(SaleOrderProduct saleOrderProduct) {
//		saleOrderProducts.remove(saleOrderProduct); 
//		saleOrderProduct.setProduct(null);
//	}
//	
	
	
}
