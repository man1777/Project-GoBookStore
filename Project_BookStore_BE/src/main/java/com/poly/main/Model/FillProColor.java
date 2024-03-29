package com.poly.main.Model;

import javax.persistence.Entity;
import javax.persistence.Id;

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
public class FillProColor {
	@Id
	private Integer id;
	private String image;
	private String nameProduct;
	private String nameColor;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	public String getNameColor() {
		return nameColor;
	}
	public void setNameColor(String nameColor) {
		this.nameColor = nameColor;
	}
	public FillProColor(Integer id, String image, String nameProduct, String nameColor) {
		super();
		this.id = id;
		this.image = image;
		this.nameProduct = nameProduct;
		this.nameColor = nameColor;
	}
	public FillProColor() {
		super();
	}
	
}
