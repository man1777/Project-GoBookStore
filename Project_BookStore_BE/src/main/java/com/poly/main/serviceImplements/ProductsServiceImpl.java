package com.poly.main.serviceImplements;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.main.Dao.ProductDao;
import com.poly.main.Entity.Product;
import com.poly.main.Service.ProductsService;
@Service
public class ProductsServiceImpl implements ProductsService {
@Autowired ProductDao dao;
	@Override
	public List<Product> getAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Product create(Product pro) {
		// TODO Auto-generated method stub
		return dao.save(pro);
	}

	@Override
	public Product update(Product pro) {
		// TODO Auto-generated method stub
		return dao.save(pro);
	}

	@Override
	public void delete(int id_pro) {
		// TODO Auto-generated method stub
		dao.deleteById(id_pro);
	}

	@Override
	public Integer getSanPham() {
		// TODO Auto-generated method stub
		return dao.getSanPham();
	}
	
}
