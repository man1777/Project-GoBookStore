package com.poly.main.RestAPI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.main.Entity.User;
import com.poly.main.Service.UserService;

@CrossOrigin("*")
@RestController
public class RestUser {
@Autowired
UserService dao;
@RequestMapping("/rest/getEmployeeAll")
public List<User> getAll() {
	return dao.findAll();
};
@RequestMapping("/rest/getEmployeeId")
public List<User> getEmployeeId() {
	return dao.findAll();
};
@DeleteMapping("/rest/delEmployeeById/{id}")
public void delEmplById(@PathVariable("id") Integer id_user) {
	dao.delete(id_user);
}
@RequestMapping("/rest/getUserToday")
public Integer getUserToday(@RequestBody JsonNode requestBody) {
	String date = requestBody.get("date").asText();
	return dao.getUserToday(date);
};
}
