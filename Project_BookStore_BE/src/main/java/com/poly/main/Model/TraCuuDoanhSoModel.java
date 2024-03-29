package com.poly.main.Model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TraCuuDoanhSoModel {
	@Id
	String date;
	Double tien;
	Integer donhang;
	Integer sosanpham;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Double getTien() {
		return tien;
	}
	public void setTien(Double tien) {
		this.tien = tien;
	}
	
	public TraCuuDoanhSoModel(String date, Double tien, Integer donhang, Integer sosanpham) {
		super();
		this.date = date;
		this.tien = tien;
		this.donhang = donhang;
		this.sosanpham = sosanpham;
	}
	public Integer getDonhang() {
		return donhang;
	}
	public void setDonhang(Integer donhang) {
		this.donhang = donhang;
	}
	public Integer getSosanpham() {
		return sosanpham;
	}
	public void setSosanpham(Integer sosanpham) {
		this.sosanpham = sosanpham;
	}
	public TraCuuDoanhSoModel() {
		super();
	}
	

}
