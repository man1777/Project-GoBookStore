//package com.poly.main.Controller.Adimn;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.WebDataBinder;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.InitBinder;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.poly.main.Dao.UserDao;
//import com.poly.main.Entity.User;
//import com.poly.main.Model.ForgotPassword;
//import com.poly.main.Model.ResetPassword;
//import com.poly.main.Validator.ResetPassValidator;
//
//@Controller
//public class ResetPassC {
//	@Autowired
//	ResetPassValidator resetPassValidator;
//	
//	@Autowired
//	UserDao dao;
//
////	@Autowired
////	private PasswordEncoder passwordEncoder;
//
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		Object target = binder.getTarget();
//		if (target == null) {
//			return;
//		}
//		if (target.getClass() == ResetPassword.class) {
//			binder.setValidator(resetPassValidator);
//		}
//	}
//
//	@GetMapping("/reset-password")
//	public String index(Model model) {
//		ResetPassword entity = new ResetPassword();
//		model.addAttribute("resetPassword", entity);
//		return "user/reset-password";
//	}
//
//	@PostMapping("/reset-password")
//	public String save(Model model, @RequestParam(value = "code", required = true) String code,
//			@RequestParam(value = "email", required = true) String email,
//			@ModelAttribute("resetPassword") @Validated ResetPassword entity, BindingResult result) {
//		
//		if(result.hasErrors()) {
//			return "user/reset-password";
//		}
//		
//		else {
//			User user = dao.findByEmail(email);
//			System.out.println("USER "+ user.getEmail());
//			if(user == null) {
//				return "redirect:/404page";
//			}
//			else {
//				//System.out.println(code);
//				//System.out.println(user.getPassword());
////				if(code.equals(user.getPassword())) {
////					user.setPassword(passwordEncoder.encode(entity.getPassword()));
////					dao.save(user);
////					return "user/success-reset";
////				}
//				
//					return "redirect:/404page";
//				
//			}
//		}
//		
//		//return "user/success-reset";
//	}
//
////	@GetMapping("/reset/?code=khoahoanghh&email=thienhoa")
////	@ResponseBody
////	public String demo(@RequestParam(value="code",required = true) String code, @RequestParam(value="email", required = true) String email) {
////		return "Your email account is "+email+" and password is "+code;
////	}
//}


package com.poly.main.Controller.Adimn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Model.ForgotPassword;
import com.poly.main.Model.ResetPassword;
import com.poly.main.Service.MailerServiceImpl;
import com.poly.main.Service.SessionService;
import com.poly.main.Validator.ResetPassValidator;

@Controller
public class ResetPassC {
	@Autowired
	ResetPassValidator resetPassValidator;
	
	@Autowired
	UserDao dao;

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	SessionService sessionService;
	@Autowired
	MailerServiceImpl service;
	
	public static String email2 ;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == ResetPassword.class) {
			binder.setValidator(resetPassValidator);
		}
	}

	@GetMapping("/reset-password")
	public String index(Model model,@RequestParam(value = "email") String email) {
		ResetPassword entity = new ResetPassword();
		email2 = email;
		System.out.println(email2);
		model.addAttribute("resetPassword", entity);
		System.out.println("dung");
		return "user/reset-password";
	}

	@PostMapping("/reset-password")
	public String save(Model model, @RequestParam(value = "code", required = false) String code,
			@RequestParam(value = "confirm") String confirm ,
			@ModelAttribute("resetPassword") @Validated ResetPassword entity, BindingResult result) {
		
		if(result.hasErrors()) {
			return "user/reset-password";
		}
		
		else {
		    
			User user = dao.findByEmail(email2);
			if(user == null) {
				return "redirect:/404page";
			}
			else {
				System.out.println(user.getPassword());
				System.out.println(confirm);
				
				
				if(true) {
//					code.equals(user.getPassword())
					String password = passwordEncoder.encode(confirm);
					user.setPassword(password);
					System.out.println(password);
					dao.save(user);
					return "user/success-reset";
				}
				
					return "redirect:/404page";
				
			}
		}
		
		//return "user/success-reset";
	}

	
}
