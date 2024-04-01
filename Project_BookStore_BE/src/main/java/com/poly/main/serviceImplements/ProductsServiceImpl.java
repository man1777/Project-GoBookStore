package com.poly.main.serviceImplements;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.main.Dao.ProductDao;
import com.poly.main.Entity.Product;
import com.poly.main.Service.ProductsService;
@Service
public class ProductsServiceImpl implements ProductsService {
@Autowired ProductDao dao;
@PersistenceContext
private EntityManager entityManager;
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
	public Product update(Product product) {
//		Query query = entityManager.createNativeQuery("UPDATE Product o SET o.name = :name,"
//				+ "o.price=:price"
//				+ ",o.origin=:origin,"
//				+ "o.material =:material,"
//				+ "o.status =:status,"
//				+ "describe=:describe,"
//				+ "review=:review,"
//				+ "dateStr=:dateStr "
//				+ "WHERE o.id = :id")
//        .setParameter("name", name)
//        .setParameter("id", id)
//        .setParameter("price", price)
//        .setParameter("origin", origin)
//        .setParameter("material", material)
//        .setParameter("status", status)
//        .setParameter("describe", describe)
//        .setParameter("review", review)
//        .setParameter("dateStr", dateStr)
//        .executeUpdate();
		return dao.save(product);
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
