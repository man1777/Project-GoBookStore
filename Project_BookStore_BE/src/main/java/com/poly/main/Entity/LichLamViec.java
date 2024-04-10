package com.poly.main.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class LichLamViec {
	@Id
	int id;
	int manhanvien;
	String fullname;
	String position;
	String tenthu;
	String tenca;
	public LichLamViec(int id, int manhanvien, String fullname, String position, String tenthu, String tenca) {
		super();
		this.id = id;
		this.manhanvien = manhanvien;
		this.fullname = fullname;
		this.position = position;
		this.tenthu = tenthu;
		this.tenca = tenca;
	}
	public LichLamViec() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getManhanvien() {
		return manhanvien;
	}
	public void setManhanvien(int manhanvien) {
		this.manhanvien = manhanvien;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getTenthu() {
		return tenthu;
	}
	public void setTenthu(String tenthu) {
		this.tenthu = tenthu;
	}
	public String getTenca() {
		return tenca;
	}
	public void setTenca(String tenca) {
		this.tenca = tenca;
	}

}
