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
public class ProductCateModel {
	private String productId;
	private String cateId;
	public ProductCateModel(String productId, String cateId) {
		super();
		this.productId = productId;
		this.cateId = cateId;
	}
	public ProductCateModel() {
		super();
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCateId() {
		return cateId;
	}
	public void setCateId(String cateId) {
		this.cateId = cateId;
	}
	
	
}
