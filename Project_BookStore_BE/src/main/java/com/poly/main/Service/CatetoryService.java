package com.poly.main.Service;

import java.util.List;

import com.poly.main.Entity.Category;
import com.poly.main.Entity.ProductCate;

public interface CatetoryService {
	List<Category> getCate();
	List<ProductCate> getProducts(int id);
	List<ProductCate> getAllProducts();

}