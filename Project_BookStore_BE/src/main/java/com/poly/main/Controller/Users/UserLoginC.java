package com.poly.main.Controller.Users;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Model.GoogleDetailModel;
import com.poly.main.Model.UserLogin;
import com.poly.main.Service.SessionService;
import com.poly.main.Validator.UserLoginValidator;

@Controller
public class UserLoginC {
	@Autowired
	UserDao dao;
	
	@Autowired
	UserLoginValidator userLoginValidator;
	
	@Autowired
	private SessionService sessionService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if(target == null) {
			return;
		}
		if(target.getClass()==UserLogin.class) {
			binder.setValidator(userLoginValidator);
		}
	}
	
	@GetMapping("/login")
	public String index(Model model) {
		sessionService.set("code", "Asdsfdsf2=-##2");
		UserLogin entity = new UserLogin();
		model.addAttribute("userLogin", entity);
		return "user/login";
	}
	@RequestMapping("/oauth2/success")
	public String success(OAuth2AuthenticationToken oauth2,Model model) {
		String email = oauth2.getPrincipal().getAttribute("email");
		String fullname = oauth2.getPrincipal().getAttribute("name");
		User user = dao.findByEmail(email);
		if(user!=null) {
			sessionService.set("userLogin", user);
		}else {
			User entity= new User();
			entity.setEmail(email);
			entity.setFullname(fullname);
			entity.setPassword("");
			entity.setDate(null);
			sessionService.set("userLogin", entity);
			dao.save(entity);
			
		}
		return "redirect:/index";
	}
	
	@PostMapping("/login")
	public String login(Model model, @ModelAttribute("userLogin") @Validated UserLogin entity, BindingResult result,@ModelAttribute String userName) {
		if(result.hasErrors()) {
			return "user/login";
		}
		
		System.out.println("đã đăng nhập");
		//System.out.println(entity.getUsername());
		User user = dao.findByEmail(entity.getUsername());
		userName = entity.getUsername();
		System.out.println("data"+user.getUserRole());
		System.out.println("userName"+userName);
		model.addAttribute("username", userName);
		sessionService.set("userLogin", user);
		return "user/index";
	}
	
}
