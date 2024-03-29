package com.poly.main.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.poly.main.Dao.ManufactureDao;
import com.poly.main.Entity.Manufacture;

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

public class ProductModel {
	
	@Autowired
	ManufactureDao dao;
	
	private int id;
	private String name;
	private int price = 0;
	private MultipartFile image;
	private String origin;
	private String material;
	private String describe;
	private String review;
	private String manufacture;
	private String manuDay;
	//private List<Manufacture> manufacture = dao.findAll();
	//private Map<Integer,String> manufacture;
	public ManufactureDao getDao() {
		return dao;
	}
	public void setDao(ManufactureDao dao) {
		this.dao = dao;
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
	public String getManufacture() {
		return manufacture;
	}
	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}
	public String getManuDay() {
		return manuDay;
	}
	public void setManuDay(String manuDay) {
		this.manuDay = manuDay;
	}
	public ProductModel(ManufactureDao dao, int id, String name, int price, MultipartFile image, String origin,
			String material, String describe, String review, String manufacture, String manuDay) {
		super();
		this.dao = dao;
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.describe = describe;
		this.review = review;
		this.manufacture = manufacture;
		this.manuDay = manuDay;
	}
	public ProductModel() {
		super();
	}
	public ProductModel(String name, int price, MultipartFile image, String origin, String material, String describe,
			String review, String manufacture, String manuDay) {
		super();
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.describe = describe;
		this.review = review;
		this.manufacture = manufacture;
		this.manuDay = manuDay;
	}
	
	
	
}
