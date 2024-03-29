package com.poly.main.Entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name="Categories")
public class Category implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String image;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<ProductCate> productManu;
	
	public Category(String name, String image) {
		this.name = name;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<ProductCate> getProductManu() {
		return productManu;
	}

	public void setProductManu(List<ProductCate> productManu) {
		this.productManu = productManu;
	}

	public Category(int id, String name, String image, List<ProductCate> productManu) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.productManu = productManu;
	}

	public Category() {
		super();
	}
	
}
