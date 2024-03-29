package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.Employee;
import com.poly.main.Model.EmployeeReport;

public interface EmployeeDao extends JpaRepository<Employee, Integer> {
	@Query("SELECT new EmployeeReport(e.user, e.position, e.id, e.startDay) FROM Employee e WHERE e.user.fullname LIKE ?1")
	Page<EmployeeReport> fillToTable(String fullname, Pageable pageable);
	@Query("SELECT e.id,e.position,e.startDay, e.user FROM Employee e")
	List<Employee> getAll();
	@Query("select count(e) from  Employee e")
	Integer getSanPham();
}
