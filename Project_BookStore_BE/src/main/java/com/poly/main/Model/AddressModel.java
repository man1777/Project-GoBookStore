package com.poly.main.Model;

import com.poly.main.Entity.Category;
import com.poly.main.Entity.Product;
import com.poly.main.Entity.ProductCate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class AddressModel {
	private String firstname;
	private String lastname;
	private String email;
	private String phone;
	private String provincial;
	private String address;
	private boolean payment=true;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProvincial() {
		return provincial;
	}
	public void setProvincial(String provincial) {
		this.provincial = provincial;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isPayment() {
		return payment;
	}
	public void setPayment(boolean payment) {
		this.payment = payment;
	}
	public AddressModel(String firstname, String lastname, String email, String phone, String provincial,
			String address, boolean payment) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.phone = phone;
		this.provincial = provincial;
		this.address = address;
		this.payment = payment;
	}
	public AddressModel() {
		super();
	}
	
	
	//user
	
//	public String email2;
//	public String fullname;
//	private String oldPassword;
//	private String newPassword;
//	private String confirm;
	
}
