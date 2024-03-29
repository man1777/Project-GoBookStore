package com.poly.main.Model;

public class GoogleDetailModel {
	String fullname;
	String email;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public GoogleDetailModel(String fullname, String email) {
		super();
		this.fullname = fullname;
		this.email = email;
	}
	public GoogleDetailModel() {
		super();
	}
	

}
