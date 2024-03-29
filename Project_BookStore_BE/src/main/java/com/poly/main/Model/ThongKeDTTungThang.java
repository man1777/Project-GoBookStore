package com.poly.main.Model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ThongKeDTTungThang {
	@Id 
	Integer month;
	BigDecimal revenue;
	public ThongKeDTTungThang(Integer month, BigDecimal revenue) {
		super();
		this.month = month;
		this.revenue = revenue;
	}
	public ThongKeDTTungThang() {
		super();
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public BigDecimal getRevenue() {
		return revenue;
	}
	public void setRevenue(BigDecimal revenue) {
		this.revenue = revenue;
	}
	
}
