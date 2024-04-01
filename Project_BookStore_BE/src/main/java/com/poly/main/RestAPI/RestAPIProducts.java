package com.poly.main.RestAPI;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.poly.main.Dao.ManufactureDao;
import com.poly.main.Dao.ProductDao;
import com.poly.main.Entity.Manufacture;
import com.poly.main.Entity.Product;
import com.poly.main.Model.ModelProduct;
import com.poly.main.Model.ProductModel;
import com.poly.main.Service.ParamService;
import com.poly.main.Service.ProductsService;

@CrossOrigin("*")
@RestController
public class RestAPIProducts {
	@Autowired ProductsService dao;
	@Autowired ManufactureDao manudao;
	@Autowired ParamService param;
	@Autowired
	ProductDao daoo;
	@RequestMapping("/rest/getAllProducts")
	public List<Product> getAll(){
		return dao.getAll();
	}
	@PostMapping("/rest/insertProduct")
	public Product save( @RequestParam(name="image",required=false) MultipartFile image,
			@RequestParam(name="status") boolean status,
			@RequestParam(name="name") String name,
			@RequestParam(name="price") int price,
			@RequestParam(name="origin") String origin,
			@RequestParam(name="material") String material,
			@RequestParam(name="manuday") String manuday,
			@RequestParam(name="describe") String describe,
			@RequestParam(name="review") String review) {
		String dateStr = manuday;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        sdf = new SimpleDateFormat("yyyy-MM-dd");
        dateStr = sdf.format(date);
		Product product = new Product(name, price, param.save(image),
				origin, material, status, describe, review,dateStr);
				return daoo.save(product);
	}
	@RequestMapping("/rest/updateProduct")
	public void update(
			@RequestParam(name="name") String name,
			@RequestParam(name="price") int price,
			@RequestParam(name="image",required=false ) MultipartFile image,
			@RequestParam(name="origin") String origin,
			@RequestParam(name="material") String material,
			@RequestParam(name="manuday") String manuday,
			@RequestParam(name="describe") String describe,
			@RequestParam(name="review") String review,
			@RequestParam(name="status") boolean status,
			@RequestParam(name="id") int id) throws Exception {
		System.out.println("img"+image);
		String dateStr = manuday;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        sdf = new SimpleDateFormat("yyyy-MM-dd");
        dateStr = sdf.format(date);
		Product product = daoo.getById(id);
		product.setName(name);
		product.setPrice(price);
		product.setOrigin(origin);
		product.setMaterial(material);
		product.setDescribe(describe);
		product.setReview(review);
		product.setStatus(status);
		product.setManuDay(dateStr);
		if(!(image==null)) {
			String img=param.save(image);
			product.setImage(img);
		}
		daoo.save(product);
	}
	@DeleteMapping("/rest/deleteProduct/{id}")
	public void deleteById(@PathVariable("id") int id){
		dao.delete(id);
	};
	@RequestMapping("/rest/getSanPham")
	public Integer getSanPham() {
		return dao.getSanPham();
	}
	@RequestMapping("/rest/getImage")
	public void getImage(@RequestParam(name="image") MultipartFile image,
			
			@RequestParam(name="name") String name,
			@RequestParam(name="price") int price,
			@RequestParam(name="origin") String origin,
			@RequestParam(name="material") String material,
			@RequestParam(name="manuday") String manuday,
			@RequestParam(name="describe") String describe,
			@RequestParam(name="review") String review) {
		System.out.println("image "+image.getOriginalFilename());
		
		System.out.println("name "+name);
		System.out.println("price "+price);
		System.out.println("origin "+origin);
		System.out.println("material "+material);
		System.out.println("manuday "+manuday);
		System.out.println("describe "+describe);
		System.out.println("review "+review);
		
	}
}
