package com.poly.main.Controller.Adimn;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.main.Model.Item;
import com.poly.main.Service.SessionService;
import com.poly.main.Service.ShoppingCartServiceImpl;

@Controller
public class CartC {
	@Autowired
	ShoppingCartServiceImpl cart;
	@Autowired
	SessionService sessionService;
	int voucher = 0;
	
	//Sang trang giỏ hàng và lấy danh sách các sách đã thêm vào giỏ hàng
	@GetMapping("/shop/cart")
	public String index(Model model) {
		// cart => danh sách các sách đã thêm vào giỏ hàng
		model.addAttribute("cart", cart);
		// Tạo biến voucher
		sessionService.set("voucher", voucher);
		return "user/cart";
	}
	
	//API để cập nhật số lượng của sách 
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("quality") Integer qty) {
		cart.update(id, qty);
		return "redirect:/shop/cart";
	}
	
	//API để xóa sách khỏi giỏ hàng 
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);	
		sessionService.set("countProduct", cart.getCount());
		return "redirect:/shop/cart";
	}
	
	//API để thêm voucher thanh toán trị giá 20000 
	@RequestMapping("/shop/addvoucher")
	public String voucher(Model model,@ModelAttribute("magiamgia") String magiamgia) {
		if(magiamgia.equals("CAMONBAN")) {
			voucher = 20000;
			sessionService.set("voucher", voucher);
		}else {
			model.addAttribute("thongbao", "Voucher không tồn tại!");
		}
		
		System.out.println(magiamgia);
		
		return "redirect:/shop/cart";
	}
	//Biến voucher
	@ModelAttribute("voucher")
	public int voucher(){
		int voucher = sessionService.get("voucher")==null?0:sessionService.get("voucher");
		return voucher;
	}
	//Biến tổng tiền thanh toán
	@ModelAttribute("total")
	public int tolal(Model model) {
		List<Item> list = new ArrayList<>(cart.getItems());
		int total = 0;
		for(Item i: list) {
			total = total + i.getPrice() * i.getQuality();
		}
		model.addAttribute("totaltemp", total);
		int voucher = sessionService.get("voucher")== null?0:sessionService.get("voucher");
		return total- voucher;
	}
	//Biến tổng tiền thanh toán tạm tính
	@ModelAttribute("totaltemp")
	public int tolaltemp() {
		List<Item> list = new ArrayList<>(cart.getItems());
		int totaltemp = 0;
		for(Item i: list) {
			totaltemp = totaltemp + i.getPrice() * i.getQuality();
		}
		return totaltemp;
	}
	
	
}
