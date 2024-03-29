package com.poly.main.Model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Get5Products {
@Id
String name;
int price;
long countOrder;
public Get5Products() {
	super();
}
public Get5Products(String name, int price, long countOrder) {
	super();
	this.name = name;
	this.price = price;
	this.countOrder = countOrder;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public long getCountOrder() {
	return countOrder;
}
public void setCountOrder(long countOrder) {
	this.countOrder = countOrder;
}
}
