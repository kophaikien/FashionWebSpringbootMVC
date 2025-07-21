package vn.devpro.javawebProject31.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sale_value")
public class SaleValue extends BaseModel{
	
	@Column(name ="name", length = 120, nullable = true)
	private String name; 
	
	@Column(name ="percent", nullable = true)
	private Integer percent; 

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();
	
	// methods add and remove elements in relational product list
	public void addRelationalProduct(Product product) {
		products.add(product); 
		product.setSaleValue(this);
	}
	public void remove(Product product) {
		products.remove(product); 
		product.setSaleValue(null);
	}
//	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "create_by")
//	private User userCreateSaleValue;
//	
//	// mapping many to one: product to category
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "update_by")
//	private User userUpdateSaleValue;
//	
//	
	public SaleValue(Integer id, Date createDate, Date updateDate, Boolean status, String name, Integer percent,
			List<Product> products) {
		super(id, createDate, updateDate);
		this.name = name;
		this.percent = percent;
		this.products = products;
//		this.userCreateSaleValue = userCreateSaleValue;
//		this.userUpdateSaleValue = userUpdateSaleValue;
	}
	public SaleValue() {
		super();
	}
//	public User getUserCreateSaleValue() {
//		return userCreateSaleValue;
//	}
//	public void setUserCreateSaleValue(User userCreateSaleValue) {
//		this.userCreateSaleValue = userCreateSaleValue;
//	}
//	public User getUserUpdateSaleValue() {
//		return userUpdateSaleValue;
//	}
//	public void setUserUpdateSaleValue(User userUpdateSaleValue) {
//		this.userUpdateSaleValue = userUpdateSaleValue;
//	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPercent() {
		return percent;
	}
	public void setPercent(Integer percent) {
		this.percent = percent;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}	
