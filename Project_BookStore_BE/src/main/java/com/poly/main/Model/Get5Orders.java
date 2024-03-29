package com.poly.main.Model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Get5Orders {
	@Id
	String name;
	String firstname;
	String lastname;
	String date;
	Long tien;
	public Get5Orders(String name, String firstname, String lastname, String date, Long tien) {
		super();
		this.name = name;
		this.firstname = firstname;
		this.lastname = lastname;
		this.date = date;
		this.tien = tien;
	}
	public Get5Orders() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Long getTien() {
		return tien;
	}
	public void setTien(Long tien) {
		this.tien = tien;
	}
	
}
