package com.poly.main.serviceImplements;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.main.Dao.EmployeeDao;
import com.poly.main.Entity.Employee;
import com.poly.main.Service.EmployeeService;
@Service
public class EmployeeServiceImplement implements EmployeeService {
	@Autowired EmployeeDao dao;
@Override
public List<Employee> findAll(){
	return dao.findAll();
};
@Override
public List<Employee> getAll(){
	return dao.getAll();
};
@Override
public void deleteById(int id) {
	dao.deleteById(id);
}
@Override
public Employee insert(Employee empl) {
	return dao.save(empl);
}
@Override
public Employee update(Employee empl, int id) {
	return dao.save(empl);
}
@Override
public Integer getNhanVien() {
	// TODO Auto-generated method stub
	return dao.getSanPham();
}

 }
