package com.poly.main.Model;

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
public class ProductSizeModel {
	private String productId;
	private String sizeId;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getSizeId() {
		return sizeId;
	}
	public void setSizeId(String sizeId) {
		this.sizeId = sizeId;
	}
	public ProductSizeModel(String productId, String sizeId) {
		super();
		this.productId = productId;
		this.sizeId = sizeId;
	}
	public ProductSizeModel() {
		super();
	}
	
}
