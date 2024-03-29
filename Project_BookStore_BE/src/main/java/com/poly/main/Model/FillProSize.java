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
public class FillProSize {
	@Id
	private Integer id;
	private String nameProduct;
	private String nameSize;
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
	public String getNameSize() {
		return nameSize;
	}
	public void setNameSize(String nameSize) {
		this.nameSize = nameSize;
	}
	public FillProSize(Integer id, String nameProduct, String nameSize) {
		super();
		this.id = id;
		this.nameProduct = nameProduct;
		this.nameSize = nameSize;
	}
	public FillProSize() {
		super();
	}
	
}
