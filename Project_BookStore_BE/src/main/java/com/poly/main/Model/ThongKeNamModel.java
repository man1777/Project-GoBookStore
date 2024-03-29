package com.poly.main.Model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ThongKeNamModel {
	@Id
 String nam;
	BigDecimal tien;

public String getNam() {
	return nam;
}
public void setNam(String nam) {
	this.nam = nam;
}
public BigDecimal getTien() {
	return tien;
}
public void setTien(BigDecimal tien) {
	this.tien = tien;
}
public ThongKeNamModel( String nam, BigDecimal tien) {
	super();
	this.nam = nam;
	this.tien = tien;
}
public ThongKeNamModel() {
	super();
}
 
}
