package vn.devpro.javawebProject31.dto;

public class ContactDTO {
private String name;
private String email;
private String mobile; 
private String address; 
private String message;
private String avatar; 

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAvatar() {
	return avatar;
}
public void setAvatar(String avatar) {
	this.avatar = avatar;
}
public ContactDTO(String name, String email, String mobile, String address, String message, String avatar) {
	super();
	this.name = name;
	this.email = email;
	this.mobile = mobile;
	this.address = address;
	this.message = message;
	this.avatar = avatar;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
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

public ContactDTO() {
	super();
}
public String getfirstname() { 
	String[] names = this.getName().trim().split(" ");
	return names[names.length -1]; 
	
}
public String getLastname() { 
	String[] names = this.getName().trim().split(" ");
	String result ="";
	int index = 0; 
	for (int i =0 ; i < names.length -1; i++) { 
		result += names[i]; 
	}
	return result.trim(); 
}
}
