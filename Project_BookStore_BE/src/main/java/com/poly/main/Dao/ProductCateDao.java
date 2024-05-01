package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.main.Entity.ProductCate;
import com.poly.main.Model.ShowCategory;

public interface ProductCateDao extends JpaRepository<ProductCate, Integer>{
	@Query("SELECT new ShowCategory(p.category, count(p.product)) FROM ProductCate p GROUP BY p.category")
	List<ShowCategory> getSelectCategory();
	@Query("SELECT c from  ProductCate c where category.id= :id")
	List<ProductCate> getProductByCateID(@Param("id") int id);
	@Query("Delete from ProductCate c where id= :id")
	void delbyidcate(@Param("id") int id);
	
}
