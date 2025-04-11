package vn.devpro.javawebProject31.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_contact")
public class Contact extends BaseModel{
	@Column(name = "firstname", length = 120, nullable = false)
	private String firstname; 
	
	@Column(name = "lastname", length = 120, nullable = false)
	private String lastname; 
	
	@Column(name = "mobile", length = 60, nullable = false)
	private String mobile; 
	
	@Column(name = "email", length = 200, nullable = false)
	private String email; 
	
	@Column(name = "address", length = 300, nullable = false)
	private String address; 
	
	@Column(name = "message", length = 1200, nullable = false)
	private String message; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateContact; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateContact;

	public Contact() {
		super();
	}

	public Contact(Integer id, Date createDate, Date updateDate, Boolean status, String firstname, String lastname,
			String mobile, String email, String address, String message, User userCreateContact,
			User userUpdateContact) {
		super(id, createDate, updateDate, status);
		this.firstname = firstname;
		this.lastname = lastname;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.message = message;
		this.userCreateContact = userCreateContact;
		this.userUpdateContact = userUpdateContact;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getUserCreateContact() {
		return userCreateContact;
	}

	public void setUserCreateContact(User userCreateContact) {
		this.userCreateContact = userCreateContact;
	}

	public User getUserUpdateContact() {
		return userUpdateContact;
	}

	public void setUserUpdateContact(User userUpdateContact) {
		this.userUpdateContact = userUpdateContact;
	} 
	
	
	
} 