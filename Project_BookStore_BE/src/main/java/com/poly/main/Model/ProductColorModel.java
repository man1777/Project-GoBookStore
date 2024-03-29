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
public class ProductColorModel {
	private String productId;
	private MultipartFile image;
	private String colorId;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getColorId() {
		return colorId;
	}
	public void setColorId(String colorId) {
		this.colorId = colorId;
	}
	public ProductColorModel(String productId, MultipartFile image, String colorId) {
		super();
		this.productId = productId;
		this.image = image;
		this.colorId = colorId;
	}
	public ProductColorModel() {
		super();
	}
	
	
}
