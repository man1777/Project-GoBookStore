package com.poly.main.Controller.Users;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.main.Config.ConFigVNPAY;
import com.poly.main.Dao.AddressDao;
import com.poly.main.Dao.ColorDao;
import com.poly.main.Dao.OrderDao;
import com.poly.main.Dao.ProductDao;
import com.poly.main.Dao.SizeDao;
import com.poly.main.Entity.Address;
import com.poly.main.Entity.Color;
import com.poly.main.Entity.Order;
import com.poly.main.Entity.Product;
import com.poly.main.Entity.Size;
import com.poly.main.Entity.User;
import com.poly.main.Model.AddressModel;
import com.poly.main.Model.Item;
import com.poly.main.Service.MailerServiceImpl;
import com.poly.main.Service.SessionService;
import com.poly.main.Service.ShoppingCartServiceImpl;
import com.poly.main.Validator.AddressValidator;

@Controller
public class AddressC {

	@Autowired
	AddressDao dao;

	@Autowired
	ColorDao colorDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	SizeDao sizeDao;

	@Autowired
	OrderDao orderDao;

	@Autowired
	AddressValidator addressValidator;

	@Autowired
	SessionService sessionService;
	
	@Autowired
	MailerServiceImpl serviceMail;

	@Autowired
	ShoppingCartServiceImpl cart;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == AddressModel.class) {
			binder.setValidator(addressValidator);
		}
	}
    public User user ;
    public Address address;
   
	@GetMapping("/shop/checkout")
	public String index(Model model)throws UnsupportedEncodingException {
		user = sessionService.get("userLogin");
		
		address = dao.getAddress(user.getId());
		AddressModel entity = new AddressModel();
	
		if (address != null) {
			entity.setFirstname(address.getFirstname());
			entity.setLastname(address.getLastname());
			entity.setAddress(address.getAddress());
			entity.setEmail(address.getEmail());
			entity.setPhone(address.getPhone());
			entity.setProvincial(address.getProvincial());
			
		}
	 
			
			String vnp_Version = "2.1.0";
String vnp_Command = "pay";
	        String orderType = "other";
	        long amount = (tolal()*100)+3000000;
	        System.out.println(tolal());
	        String bankCode = "NCB";
	        
	        String vnp_TxnRef = ConFigVNPAY.getRandomNumber(8);
	        String vnp_IpAddr = "127.0.0.1";

	        String vnp_TmnCode = ConFigVNPAY.vnp_TmnCode;
	        
	        Map<String, String> vnp_Params = new HashMap<>();
	        vnp_Params.put("vnp_Version", vnp_Version);
	        vnp_Params.put("vnp_Command", vnp_Command);
	        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
	        vnp_Params.put("vnp_Amount", String.valueOf(amount));
	        vnp_Params.put("vnp_CurrCode", "VND");
	        
	        vnp_Params.put("vnp_BankCode", bankCode);
	        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
	        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
	        vnp_Params.put("vnp_OrderType", orderType);

	        vnp_Params.put("vnp_Locale", "vn");
	        vnp_Params.put("vnp_ReturnUrl", ConFigVNPAY.vnp_ReturnUrl);
	        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

	        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String vnp_CreateDate = formatter.format(cld.getTime());
	        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
	        
	        cld.add(Calendar.MINUTE, 15);
	        String vnp_ExpireDate = formatter.format(cld.getTime());
	        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
	        
	        List fieldNames = new ArrayList(vnp_Params.keySet());
	        Collections.sort(fieldNames);
	        StringBuilder hashData = new StringBuilder();
	        StringBuilder query = new StringBuilder();
	        Iterator itr = fieldNames.iterator();
	        while (itr.hasNext()) {
	            String fieldName = (String) itr.next();
	            String fieldValue = (String) vnp_Params.get(fieldName);
	            if ((fieldValue != null) && (fieldValue.length() > 0)) {
	                //Build hash data
	                hashData.append(fieldName);
	                hashData.append('=');
	                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
	                //Build query
	query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
	                query.append('=');
	                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
	                if (itr.hasNext()) {
	                    query.append('&');
	                    hashData.append('&');
	                }
	            }
	        }
	        String queryUrl = query.toString();
	        String vnp_SecureHash = ConFigVNPAY.hmacSHA512(ConFigVNPAY.secretKey, hashData.toString());
	        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
	       String paymentUrl = ConFigVNPAY.vnp_PayUrl + "?" + queryUrl;
model.addAttribute("url", paymentUrl);
	    System.out.println(paymentUrl);
		model.addAttribute("cart", cart);
		model.addAttribute("addressForm", entity);
		return "user/checkout";
	}
	
	@GetMapping("/payvn")
	public String save2(Model model, @ModelAttribute("addressForm") @Validated AddressModel entity,
			BindingResult result) {
		System.out.println(user.getFullname());
		    if(address == null) {
		    	address.setAddress("130 Quang Trung ");
				address.setEmail("tsa@gmail.com");
				address.setFirstname("New");
				address.setLastname("");
				address.setPhone("0934564821");
				address.setProvincial("HCM");
		    }
		
			address.setAddress(entity.getAddress());
			address.setEmail(entity.getEmail());
			address.setFirstname(entity.getFirstname());
			address.setLastname(entity.getLastname());
			address.setPhone(entity.getPhone());
			address.setProvincial(entity.getProvincial());
		
		
			
			int code;
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = formatter.format(date);
			while (true) {
				code = (int) Math.floor(((Math.random() * 899999) + 100000));
				List<Order> list = orderDao.getOrderByName(String.valueOf(code));
				if (list.isEmpty()) {
					break;
				}
			}
			List<Item> listItem = new ArrayList<>(cart.getItems());
			for (Item i : listItem) {
				//System.out.println(i.getIdColor());
				Color color;
				Size size;
				if(i.getIdColor() == 0) {
					color = null;
				}
				else {
					color = colorDao.getById(i.getIdColor());
				}
				
				if(i.getIdSize() == 0) {
					size = null;
				}
				else {
					size = sizeDao.getById(i.getIdSize());
				}
				Product product = productDao.getById(i.getId());
				Order order = new Order(String.valueOf(code), false, entity.isPayment(), i.getQuality(), strDate, color,
						size, address, product);
				orderDao.save(order);
			}
			
			//serviceMail.queue(entity.getEmail(), "Xác nhận đơn hàng!", "Code xác nhận của bạn là: " + code);
			cart.clear();
			sessionService.set("countProduct", cart.getCount());
			return "user/thankyou";
		}
	
	

	@PostMapping("/shop/checkout")
	public String save(Model model, @ModelAttribute("addressForm") @Validated AddressModel entity,
			BindingResult result) {
		 
			 user = sessionService.get("userLogin");
		 address = dao.getAddress(user.getId());
			if(result.hasErrors()) {
				return "user/checkout";
			}else {
				if (address == null) {
					address = new Address(entity.getFirstname(), entity.getLastname(), entity.getEmail(), entity.getPhone(),
							entity.getProvincial(), entity.getAddress(), user);
					dao.save(address);
				} else {
					address.setAddress(entity.getAddress());
					address.setEmail(entity.getEmail());
					address.setFirstname(entity.getFirstname());
					address.setLastname(entity.getLastname());
					address.setPhone(entity.getPhone());
					address.setProvincial(entity.getProvincial());
					dao.save(address);
				}
			}
			int code;
Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = formatter.format(date);
			while (true) {
				code = (int) Math.floor(((Math.random() * 899999) + 100000));
				List<Order> list = orderDao.getOrderByName(String.valueOf(code));
				if (list.isEmpty()) {
					break;
				}
			}
			List<Item> listItem = new ArrayList<>(cart.getItems());
			for (Item i : listItem) {
				//System.out.println(i.getIdColor());
				Color color;
				Size size;
				if(i.getIdColor() == 0) {
					color = null;
				}
				else {
					color = colorDao.getById(i.getIdColor());
				}
				
				if(i.getIdSize() == 0) {
					size = null;
				}
				else {
					size = sizeDao.getById(i.getIdSize());
				}
				Product product = productDao.getById(i.getId());
				Order order = new Order(String.valueOf(code), false, entity.isPayment(), i.getQuality(), strDate, color,
						size, address, product);
				orderDao.save(order);
			}
			
			//serviceMail.queue(entity.getEmail(), "Xác nhận đơn hàng!", "Code xác nhận của bạn là: " + code);
			cart.clear();
			sessionService.set("countProduct", cart.getCount());
			return "user/thankyou";
		}
	

	@ModelAttribute("total")
	public int tolal() {
		List<Item> list = new ArrayList<>(cart.getItems());
		int total = 0;
		for (Item i : list) {
			total = total + i.getPrice() * i.getQuality();
		}
		return total ;
	}
	
	
	
	
//	public String content(String s) {
//		String s = "";
//	}
}