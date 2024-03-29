package com.poly.main.Model;

import java.io.Serializable;

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
public class FillProCate {
	@Id
	private Integer id;
	private String nameProduct;
	private String nameCate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	public String getNameCate() {
		return nameCate;
	}
	public void setNameCate(String nameCate) {
		this.nameCate = nameCate;
	}
	public FillProCate(Integer id, String nameProduct, String nameCate) {
		super();
		this.id = id;
		this.nameProduct = nameProduct;
		this.nameCate = nameCate;
	}
	public FillProCate() {
		super();
	}
	
}
