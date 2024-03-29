package com.poly.main.Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name="Favorites")
public class Favorite implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String date;
	
	@ManyToOne
	@JoinColumn(name="User_Id")
	User user;
	
	@ManyToOne
	@JoinColumn(name="Product_Id")
	Product product;

	public Favorite(String date, User user, Product product) {
		super();
		this.date = date;
		this.user = user;
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Favorite(int id, String date, User user, Product product) {
		super();
		this.id = id;
		this.date = date;
		this.user = user;
		this.product = product;
	}

	public Favorite() {
		super();
	}
	
	
}
