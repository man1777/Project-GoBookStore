package com.poly.main.Model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.poly.main.Entity.Order;
import com.poly.main.Entity.Product;
@Entity
public class OrderDetail {
	@Id
	int id_order;
	String name_buyer;
	String phone_number_buyer;
	String address_buyer;
	String email_buyer;
	String provincial; 
	Product product;
	int quality;
	
//	@OneToMany(mappedBy = "product")
//	List<Product> product;
//	
//	
//
//	public OrderDetail(int id_order, String name_buyer, String phone_number_buyer, String address_buyer,
//			String email_buyer, String provincial, List<Product> product) {
//		super();
//		this.id_order = id_order;
//		this.name_buyer = name_buyer;
//		this.phone_number_buyer = phone_number_buyer;
//		this.address_buyer = address_buyer;
//		this.email_buyer = email_buyer;
//		this.provincial = provincial;
//		this.product = product;
//	}
//
//
//
//	public int getId_order() {
//		return id_order;
//	}
//
//
//
//	public void setId_order(int id_order) {
//		this.id_order = id_order;
//	}
//
//
//
//	public String getName_buyer() {
//		return name_buyer;
//	}
//
//
//
//	public void setName_buyer(String name_buyer) {
//		this.name_buyer = name_buyer;
//	}
//
//
//
//	public String getPhone_number_buyer() {
//		return phone_number_buyer;
//	}
//
//
//
//	public void setPhone_number_buyer(String phone_number_buyer) {
//		this.phone_number_buyer = phone_number_buyer;
//	}
//
//
//
//	public String getAddress_buyer() {
//		return address_buyer;
//	}
//
//
//
//	public void setAddress_buyer(String address_buyer) {
//		this.address_buyer = address_buyer;
//	}
//
//
//
//	public String getEmail_buyer() {
//		return email_buyer;
//	}
//
//
//
//	public void setEmail_buyer(String email_buyer) {
//		this.email_buyer = email_buyer;
//	}
//
//
//
//	public String getProvincial() {
//		return provincial;
//	}
//
//
//
//	public void setProvincial(String provincial) {
//		this.provincial = provincial;
//	}
//
//
//
//	public List<Product> getProduct() {
//		return product;
//	}
//
//
//
//	public void setProduct(List<Product> product) {
//		this.product = product;
//	}



	public OrderDetail(int id_order, String name_buyer, String phone_number_buyer, String address_buyer,
			String email_buyer, String provincial, Product product, int quality) {
		super();
		this.id_order = id_order;
		this.name_buyer = name_buyer;
		this.phone_number_buyer = phone_number_buyer;
		this.address_buyer = address_buyer;
		this.email_buyer = email_buyer;
		this.provincial = provincial;
		this.product = product;
		this.quality = quality;
	}



	public int getQuality() {
		return quality;
	}



	public void setQuality(int quality) {
		this.quality = quality;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	public OrderDetail(int id_order, String name_buyer, String phone_number_buyer, String address_buyer,
			String email_buyer, String provincial, Product product) {
		super();
		this.id_order = id_order;
		this.name_buyer = name_buyer;
		this.phone_number_buyer = phone_number_buyer;
		this.address_buyer = address_buyer;
		this.email_buyer = email_buyer;
		this.provincial = provincial;
		this.product = product;
	}



	public OrderDetail() {
		super();
	}



	public OrderDetail(int id_order, String name_buyer, String phone_number_buyer, String address_buyer,
			String email_buyer, String provincial) {
		super();
		this.id_order = id_order;
		this.name_buyer = name_buyer;
		this.phone_number_buyer = phone_number_buyer;
		this.address_buyer = address_buyer;
		this.email_buyer = email_buyer;
		this.provincial = provincial;
	}



	public int getId_order() {
		return id_order;
	}



	public void setId_order(int id_order) {
		this.id_order = id_order;
	}



	public String getName_buyer() {
		return name_buyer;
	}



	public void setName_buyer(String name_buyer) {
		this.name_buyer = name_buyer;
	}



	public String getPhone_number_buyer() {
		return phone_number_buyer;
	}



	public void setPhone_number_buyer(String phone_number_buyer) {
		this.phone_number_buyer = phone_number_buyer;
	}



	public String getAddress_buyer() {
		return address_buyer;
	}



	public void setAddress_buyer(String address_buyer) {
		this.address_buyer = address_buyer;
	}



	public String getEmail_buyer() {
		return email_buyer;
	}



	public void setEmail_buyer(String email_buyer) {
		this.email_buyer = email_buyer;
	}



	public String getProvincial() {
		return provincial;
	}



	public void setProvincial(String provincial) {
		this.provincial = provincial;
	}
	
	
}
