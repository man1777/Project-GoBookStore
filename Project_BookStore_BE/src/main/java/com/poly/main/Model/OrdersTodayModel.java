package com.poly.main.Model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class OrdersTodayModel {
	@Id
	String id;
	String lastname;
	String fisrtname;
	String address;
	String provincal;
	Long money;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFisrtname() {
		return fisrtname;
	}
	public void setFisrtname(String fisrtname) {
		this.fisrtname = fisrtname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProvincal() {
		return provincal;
	}
	public void setProvincal(String provincal) {
		this.provincal = provincal;
	}
	public Long getMoney() {
		return money;
	}
	public void setMoney(Long money) {
		this.money = money;
	}
	public OrdersTodayModel(String id, String lastname, String fisrtname, String address, String provincal,
			Long money) {
		super();
		this.id = id;
		this.lastname = lastname;
		this.fisrtname = fisrtname;
		this.address = address;
		this.provincal = provincal;
		this.money = money;
	}
	public OrdersTodayModel() {
		super();
	}
	
	
	
}
