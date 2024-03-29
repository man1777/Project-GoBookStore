package com.poly.main.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poly.main.Entity.Employee;
import com.poly.main.Entity.User;


public interface UserService {
	List<User> findAll();
	User insert(User user);
	 void delete(Integer id_User);
	//List<User> findByEmpl();
	List<User> selectMaNV();
	Integer getUserToday(String date);
	
}
