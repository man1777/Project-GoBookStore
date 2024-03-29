package com.poly.main.Service;

import java.util.List;


import com.poly.main.Entity.Employee;

public interface EmployeeService {
	List<Employee> findAll();
	List<Employee> getAll();
	void deleteById(int id);
	Employee insert(Employee empl);
	Employee update(Employee empl, int id);
	Integer getNhanVien();
}
