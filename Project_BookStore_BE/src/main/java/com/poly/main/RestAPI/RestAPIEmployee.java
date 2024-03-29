package com.poly.main.RestAPI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.main.Entity.Employee;
import com.poly.main.Service.EmployeeService;
@CrossOrigin("*")
@RestController
public class RestAPIEmployee {
	
@Autowired	EmployeeService dao;
@RequestMapping("/rest/getEmployees")
public List<Employee> getAll(){
	return dao.findAll();
};
@DeleteMapping("/rest/deleteEmployee/{id}")
public void deleteById(@PathVariable("id") int id){
	dao.deleteById(id);
};
@PostMapping("/rest/insertEmployee")
public Employee insert(@RequestBody Employee empl) {
	return dao.insert(empl);
}
@RequestMapping("/rest/getNhanVien")
public Integer getNhanVien() {
	return dao.getNhanVien();
}
}
