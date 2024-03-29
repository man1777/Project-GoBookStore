package com.poly.main.Model;

import org.springframework.web.multipart.MultipartFile;

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

public class ManufactureModel {
	private int id;

	private String name;

	private MultipartFile image;

	private String information;

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

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public ManufactureModel(int id, String name, MultipartFile image, String information) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.information = information;
	}

	public ManufactureModel() {
		super();
	}
	
}
