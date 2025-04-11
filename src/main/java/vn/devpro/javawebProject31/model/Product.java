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

@Entity
@Table(name = "tbl_product")
public class Product  extends BaseModel{
	
	@Column(name = "name" , length = 300, nullable = false)
	private String name; 
	
	@Column(name = "avatar", length = 300, nullable = false)
	private String avatar; 
	
	@Column(name = "price", nullable = true)
	private BigDecimal price = BigDecimal.ZERO; 
	
	@Column(name = "sale_price", nullable = true)
	private BigDecimal salePrice = BigDecimal.ZERO; 
	
	@Column(name = "short_description", nullable = true) 
	private String shortDescription; 
	
	@Column(name = "detail_description", nullable = true)
	private String detailDescription; 
	
	@Column(name= "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE; 
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo; 

	// mapping many to one: product to category
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;
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

	//mapping many-to-one: product-to-user-create
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by", referencedColumnName = "id")
	private User userUpdateProduct; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by", referencedColumnName = "id")
	private User userCreateProduct; 
	
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
	
	
	
	
	public String getDetailDescription() {
		return detailDescription;
	}
	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
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
	public User getUserUpdateProduct() {
		return userUpdateProduct;
	}
	public void setUserUpdateProduct(User userUpdateProduct) {
		this.userUpdateProduct = userUpdateProduct;
	}
	public User getUserCreateProduct() {
		return userCreateProduct;
	}
	public void setUserCreateProduct(User userCreateProduct) {
		this.userCreateProduct = userCreateProduct;
	}
	public Product(Integer id, Date createDate, Date updateDate, Boolean status, String name, String avatar,
			BigDecimal price, BigDecimal salePrice, String shortDescription, String detailDescription, Boolean isHot,
			String seo, Category category, List<ProductImage> productImages, User userUpdateProduct,
			User userCreateProduct) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.avatar = avatar;
		this.price = price;
		this.salePrice = salePrice;
		this.shortDescription = shortDescription;
		this.detailDescription = detailDescription;
		this.isHot = isHot;
		this.seo = seo;
		this.category = category;
		this.productImages = productImages;
		this.userUpdateProduct = userUpdateProduct;
		this.userCreateProduct = userCreateProduct;
	}
		
	
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

	public String getDetailDesciption() {
		return detailDescription;
	}

	public void setDetailDesciption(String detailDesciption) {
		this.detailDescription = detailDesciption;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
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
