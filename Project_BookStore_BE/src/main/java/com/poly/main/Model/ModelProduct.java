package com.poly.main.Model;

import org.springframework.web.multipart.MultipartFile;

public class ModelProduct {
	Integer id;
	String name;
	int price;
	MultipartFile image;
	String origin;
	String material;
	String manuday;
	String review;
	String describe;
	
	public ModelProduct(Integer id, String name, int price, MultipartFile image, String origin, String material,
			String manuday, String review, String describe) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.manuday = manuday;
		this.review = review;
		this.describe = describe;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
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

	public String getManuday() {
		return manuday;
	}

	public void setManuday(String manuday) {
		this.manuday = manuday;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public ModelProduct() {
		super();
	}
	
}
