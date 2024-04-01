package com.poly.main.Entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name="Products")
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private int price;
	private String image;
	private String origin;
	private String material;
	private boolean status;
	private String describe;
	private String review;
	private int views = 0;
	@Column(name="Manuday")
	private String manuDay;
	@ManyToOne
	@JoinColumn(name = "Manu_Id")
	Manufacture manufacture;
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<ProductCate> productManu;
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<ProductColor> productColor;
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<ProductSize> productSize;
	
	@ManyToOne
	@JoinColumn (name = "id_order")
	Order order;
	public Product() {
		super();
	}

	public Product(String name, int price, String origin, String material, boolean status, String describe,
			String review, String manuDay) {
		super();
		this.name = name;
		this.price = price;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.manuDay = manuDay;
	}

	public Product(String name, int price, String image, String origin, String material, boolean status,
			String describe, String review, String manuDay) {
		super();
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.manuDay = manuDay;
	}

	public Product(String name, int price, String image, String origin, String material, boolean status,
			String describe, String review, String manuDay, Order order) {
		super();
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.manuDay = manuDay;
		this.order = order;
	}

	public Product(int id, String name, int price, String image, String origin, String material, boolean status,
			String describe, String review, String manuDay) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.manuDay = manuDay;
	}

	public Product(int id, String name, int price, String image, String origin, String material, boolean status,
			String describe, String review, int views, String manuDay) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.views = views;
		this.manuDay = manuDay;
	}

	public Product(String name, int price, String image, String origin, String material, boolean status,
			String describe, String review, Manufacture manufacture, String manuDay) {
		super();
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.manufacture = manufacture;
		this.manuDay = manuDay;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getManuDay() {
		return manuDay;
	}

	public void setManuDay(String manuDay) {
		this.manuDay = manuDay;
	}

	public Manufacture getManufacture() {
		return manufacture;
	}

	public void setManufacture(Manufacture manufacture) {
		this.manufacture = manufacture;
	}

	public List<ProductCate> getProductManu() {
		return productManu;
	}

	public void setProductManu(List<ProductCate> productManu) {
		this.productManu = productManu;
	}

	public List<ProductColor> getProductColor() {
		return productColor;
	}

	public void setProductColor(List<ProductColor> productColor) {
		this.productColor = productColor;
	}

	public List<ProductSize> getProductSize() {
		return productSize;
	}

	public void setProductSize(List<ProductSize> productSize) {
		this.productSize = productSize;
	}
	
	
	
}
