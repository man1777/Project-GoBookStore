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
	@GetMapping("/shop/cart")
	public String index(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("voucher", voucher);
		return "user/cart";
	}
	
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("quality") Integer qty) {
		cart.update(id, qty);
		return "redirect:/shop/cart";
	}
	
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);	
		sessionService.set("countProduct", cart.getCount());
		return "redirect:/shop/cart";
	}
	@RequestMapping("/shop/addvoucher")
	public String voucher(Model model,@RequestParam("magiamgia") String test) {
		voucher = 20000;
	model.addAttribute("voucher", voucher);
	sessionService.set("voucher", voucher);
		return "redirect:/shop/cart";
	}
//	@ModelAttribute("voucher")
//	public int voucher(){
//		int voucher = 0;
//		return voucher;
//	}
	@ModelAttribute("total")
	public int tolal(Model model) {
		List<Item> list = new ArrayList<>(cart.getItems());
		int total = 0;
		for(Item i: list) {
			total = total + i.getPrice() * i.getQuality();
		}
		model.addAttribute("totaltemp", total);
		return total;
	}
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
