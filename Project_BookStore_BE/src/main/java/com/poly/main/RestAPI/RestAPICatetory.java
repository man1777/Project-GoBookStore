package com.poly.main.RestAPI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.main.Dao.CategoryDao;
import com.poly.main.Dao.ProductCateDao;
import com.poly.main.Dao.ProductDao;
import com.poly.main.Entity.Category;
import com.poly.main.Entity.Product;
import com.poly.main.Entity.ProductCate;
import com.poly.main.Service.CatetoryService;

@RestController
@CrossOrigin("*")
public class RestAPICatetory {
@Autowired CatetoryService dao;
@Autowired
CategoryDao categoryDao;
@Autowired
ProductCateDao productCateDao;
@Autowired
ProductDao productDao;
@RequestMapping("/manager/catetoryproduct")
public List<Category> getCatetory(){
	return dao.getCate();
}
@RequestMapping("/manager/getproduct")
public List<ProductCate> getProduct(@RequestParam(required = false) int id){
	if(id != 0 ) {
		System.out.println("id" + id);
		return dao.getProducts(id);
	}
	System.out.println("id null " + id);
	List<ProductCate> allItems= dao.getAllProducts();
//	for(ProductCate item : allItems) {
//		System.out.println("Tên sản phẩm: " +item.getProduct().getName()+" Tên DM: "+item.getCategory().getName());
//	}
	return allItems;
}
@RequestMapping("/manager/addproduct")
public void AddProductCate(@RequestBody JsonNode requestBody){
	Integer IdPro = requestBody.get("productid").asInt();
	Integer idCate = requestBody.get("cateid").asInt();
	System.out.println("data: "+IdPro+" cate"+idCate);
	Product product = productDao.getById(IdPro);
	Category cate = categoryDao.getById(idCate);
	
	System.out.println("product"+product.getName());
	System.out.println("cate"+cate.getName());
	ProductCate entity = new ProductCate(product,cate);
	productCateDao.save(entity);
}
@RequestMapping("/manager/delproduct")
public void DelProductCate(@RequestBody JsonNode requestBody){
	Integer id = requestBody.get("id").asInt();
	productCateDao.deleteById(id);
}
}
