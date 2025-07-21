package vn.devpro.javawebProject31.model;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_variant") 
public class Variant extends BaseModel{
	 
	@Column(name = "size",  length = 3, nullable = true)
	private String size; 
	
	@Column(name = "sku", length = 50, nullable = true)
	private String sku; 
	
	@Column(name = "quantity" , nullable = true) 
	private BigInteger quantity; 
	
	//mapping money to one 
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id") 
	private Product product;

	public Variant(Integer id, Date createDate, Date updateDate, Boolean status, String size, String sku, BigInteger quantity,
			Product product) {
		super(id, createDate, updateDate);
		this.size = size;
		this.sku = sku;
		this.quantity = quantity;
		this.product = product;
	}

	public Variant() {
		super();
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public BigInteger getQuantity() {
		return quantity;
	}

	public void setQuantity(BigInteger quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
	
	
}
