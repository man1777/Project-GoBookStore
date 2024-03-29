package com.poly.main.RestAPI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.main.Entity.Category;
import com.poly.main.Entity.ProductCate;
import com.poly.main.Service.CatetoryService;

@RestController
public class RestAPICatetory {
@Autowired CatetoryService dao;
@RequestMapping("/manager/catetoryproduct")
public List<Category> getCatetory(){
	return dao.getCate();
}
@RequestMapping("/manager/getproduct")
public List<ProductCate> getProduct(@RequestParam int id){
	System.out.println("id" + id);
	return dao.getProducts(id);
}
}
