package vn.devpro.javawebProject31.model;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name = "tbl_review")
public class Review extends BaseModel{
	
	
	@Column(name = "rating", nullable=true)
	private BigInteger rating; 
	
	@Column(name = "comment", nullable = true, length = 300)
	private String comment; 
	@ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
    
    @Column(name = "review_date")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp // Tự động gán thời gian hiện tại khi tạo mới
    private Date reviewDate;
	public Review(Integer id, Date createDate, Date updateDate, BigInteger rating, String comment, User user,
			Product product, Date reviewDate) {
		super(id, createDate, updateDate);
		this.rating = rating;
		this.comment = comment;
		this.user = user;
		this.product = product;
		this.reviewDate = reviewDate;
	}
	
	public Review() {
		super();
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public BigInteger getRating() {
		return rating;
	}

	public void setRating(BigInteger rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
