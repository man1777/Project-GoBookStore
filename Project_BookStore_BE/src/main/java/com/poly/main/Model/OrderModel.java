package com.poly.main.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

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

@Entity
public class OrderModel {
	@Id
	private String name;
	private String date;
	private Long price;
	private boolean status;
	private boolean method_payment;
	private Integer trangthai;
	private String ghichu;
	
	public OrderModel(String name, String date, Long price, boolean status, boolean method_payment, Integer trangthai,
			String ghichu) {
		super();
		this.name = name;
		this.date = date;
		this.price = price;
		this.status = status;
		this.method_payment = method_payment;
		this.trangthai = trangthai;
		this.ghichu = ghichu;
	}

	public String getGhichu() {
		return ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

	public OrderModel(String name, String date, Long price, boolean status, boolean method_payment, Integer trangthai) {
		super();
		this.name = name;
		this.date = date;
		this.price = price;
		this.status = status;
		this.method_payment = method_payment;
		this.trangthai = trangthai;
	}

	public Integer getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(Integer trangthai) {
		this.trangthai = trangthai;
	}

	public OrderModel(String name, String date, Long price, boolean status, boolean method_payment) {
		super();
		this.name = name;
		this.date = date;
		this.price = price;
		this.status = status;
		this.method_payment = method_payment;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isMethod_payment() {
		return method_payment;
	}

	public void setMethod_payment(boolean method_payment) {
		this.method_payment = method_payment;
	}
	public OrderModel() {
		super();
	}
	
}
