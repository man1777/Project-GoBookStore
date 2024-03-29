package com.poly.main.Model;

import org.springframework.web.multipart.MultipartFile;

import com.poly.main.Entity.Category;

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
public class Categories {
	private int id;
	
	private String name;

	private MultipartFile image;

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

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public Categories(int id, String name, MultipartFile image) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
	}

	public Categories() {
		super();
	}
	
}
