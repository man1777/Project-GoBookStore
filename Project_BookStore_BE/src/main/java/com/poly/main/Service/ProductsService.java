package com.poly.main.Service;

import java.util.List;

import com.poly.main.Entity.Product;
import com.poly.main.Model.ProductModel;

public interface ProductsService {
	List<Product> getAll();
	Product create(Product pro);
	Product update(Product pro);
	void delete(int id_pro);
	Integer getSanPham();
}
