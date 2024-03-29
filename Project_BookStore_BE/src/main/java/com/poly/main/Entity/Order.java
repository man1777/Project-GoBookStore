package com.poly.main.Entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.poly.main.Model.OrderDetail;

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
@Table(name="Orders")
public class Order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private boolean status;
	private boolean method;
	private int quality;
	private String date;
	@Column(name = "trangthai")
	private Integer trangthai;
	@Column(name = "ghichu")
	private String ghichu;
	
	public Order(int id, String name, boolean status, boolean method, int quality, String date, Integer trangthai,
			String ghichu, Color color, Size size, Address address, Product product, List<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.method = method;
		this.quality = quality;
		this.date = date;
		this.trangthai = trangthai;
		this.ghichu = ghichu;
		this.color = color;
		this.size = size;
		this.address = address;
		this.product = product;
		this.products = products;
	}

	public String getGhichu() {
		return ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

	public Order(int id, String name, boolean status, boolean method, int quality, String date, Integer trangthai,
			Color color, Size size, Address address, Product product, List<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.method = method;
		this.quality = quality;
		this.date = date;
		this.trangthai = trangthai;
		this.color = color;
		this.size = size;
		this.address = address;
		this.product = product;
		this.products = products;
	}

	public Integer getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(Integer trangthai) {
		this.trangthai = trangthai;
	}
	@ManyToOne
	@JoinColumn(name="Color_Id", nullable = true)
	Color color;
	
	@ManyToOne
	@JoinColumn(name="Size_Id", nullable = true)
	Size size;
	
	@ManyToOne
	@JoinColumn(name="Address_Id")
	Address address;
	
	@ManyToOne
	@JoinColumn(name="Product_Id")
	Product product;
	
	@OneToMany(mappedBy = "order")
	List<Product> products;
	

	public Order(int id, String name, boolean status, boolean method, int quality, String date, Address address,
			List<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.method = method;
		this.quality = quality;
		this.date = date;
		this.address = address;
		this.products = products;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isMethod() {
		return method;
	}

	public void setMethod(boolean method) {
		this.method = method;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Product getProduct() {
		return product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order(int id, String name, boolean status, boolean method, int quality, String date, Color color, Size size,
			Address address, Product product) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.method = method;
		this.quality = quality;
		this.date = date;
		this.color = color;
		this.size = size;
		this.address = address;
		this.product = product;
	}
	public Order(String name, boolean status, boolean method, int quality, String date, Color color, Size size,
			Address address, Product product) {
		super();
		this.name = name;
		this.status = status;
		this.method = method;
		this.quality = quality;
		this.date = date;
		this.color = color;
		this.size = size;
		this.address = address;
		this.product = product;
	}
	public Order() {
		super();
	}

	
	
	
}
