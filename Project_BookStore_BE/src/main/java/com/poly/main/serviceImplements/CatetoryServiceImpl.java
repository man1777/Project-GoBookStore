package com.poly.main.serviceImplements;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.main.Dao.CategoryDao;
import com.poly.main.Dao.ProductCateDao;
import com.poly.main.Entity.Category;
import com.poly.main.Entity.ProductCate;
import com.poly.main.Service.CatetoryService;
@Service
public class CatetoryServiceImpl implements CatetoryService {
@Autowired CategoryDao dao;
@Autowired ProductCateDao daoCate;
	@Override
	public List<Category> getCate() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<ProductCate> getProducts(int id) {
		// TODO Auto-generated method stub
		return daoCate.getProductByCateID(id);
	}
	@Override
	public List<ProductCate> getAllProducts() {
		// TODO Auto-generated method stub
		return daoCate.findAll();
	}

}
