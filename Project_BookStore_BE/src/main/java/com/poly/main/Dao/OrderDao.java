package com.poly.main.Dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.poly.main.Entity.Order;
import com.poly.main.Model.Get5Orders;
import com.poly.main.Model.Get5Products;
import com.poly.main.Model.OrderDetail;
import com.poly.main.Model.OrderModel;
import com.poly.main.Model.OrdersTodayModel;
import com.poly.main.Model.StatisOrder;
import com.poly.main.Model.ThongKeModel;
import com.poly.main.Model.ThongKeNamModel;

public interface OrderDao extends JpaRepository<Order, Integer>{
	@Query("SELECT o FROM Order o WHERE o.name LIKE ?1")
	List<Order> getOrderByName(String name);
	
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.product.price * o.quality), o.status,o.method) FROM Order o WHERE o.address.user.id = ?1 GROUP BY o.name, o.date, o.status,o.method")
	List<OrderModel> getOrderModel(int id);
	
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.product.price * o.quality), o.status,o.method) FROM Order o WHERE o.status = 0 AND o.name LIKE ?1 GROUP BY o.name, o.date, o.status,o.method ORDER BY o.date ASC")
	Page<OrderModel> fillTableWOrder(String name, Pageable pageable);
	
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.product.price * o.quality), o.status,o.method) FROM Order o WHERE o.status = 1 AND o.name LIKE ?1 GROUP BY o.name, o.date, o.status,o.method ORDER BY o.date ASC")
	Page<OrderModel> fillTableWOrder2(String name, Pageable pageable);
	

	@Query("SELECT new StatisOrder(o.product, count(o)) FROM Order o WHERE o.product.name Like ?1 GROUP BY o.product ")
	Page<StatisOrder> fillToTable(String name, Pageable pageable);
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.quality * o.product.price), o.status,o.method) FROM Order o WHERE o.trangthai = null GROUP BY o.name, o.date, o.status,o.method,o.trangthai")
	List<OrderModel> getOrdersWaiting();

	@Query("SELECT new OrderModel(o.name, o.date, sum(o.quality * o.product.price), o.status,o.method,o.trangthai) FROM Order o WHERE o.trangthai = 1 GROUP BY o.name, o.date, o.status,o.method,o.trangthai")
	List<OrderModel> getOrdersShiped();
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.quality * o.product.price), o.status,o.method,o.trangthai) FROM Order o WHERE o.trangthai = 2 GROUP BY o.name, o.date, o.status,o.method,o.trangthai")
	List<OrderModel> getOrdersSuccess();
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.quality * o.product.price), o.status,o.method,o.trangthai,o.ghichu) FROM Order o WHERE o.trangthai = 3 GROUP BY o.name, o.date, o.status,o.method,o.trangthai,o.ghichu")
	List<OrderModel> getOrdersBack();
	@Query("UPDATE Order o SET o.trangthai = :trangthai WHERE o.name = :name")
	void changeStatus(@Param("name") String name, @Param("trangthai") Integer trangthai);
	@Query("SELECT new OrderDetail(o.id,o.address.lastname,o.address.phone,o.address.address,o.address.email,o.address.provincial,o.product,o.quality)  FROM Order o  WHERE o.name = :name  ")
	List<OrderDetail> getOrderDetail(@Param("name") String name);
	@Query("SELECT o FROM Order o JOIN FETCH o.products p where o.name= :nameorder" )
	Order getOrderDetaill(@Param("nameorder") String name);
	@Query("Select sum(o.quality*o.product.price) from Order o")
	Double getDoanhThu();
	@Query("Select count(o) from Order o")
	Integer getDonHang();
	@Query("Select new Get5Orders(o.name, o.address.firstname, o.address.lastname, o.date, sum(o.quality * o.product.price)) from Order o group by  o.name, o.address.firstname, o.address.lastname, o.date order by sum(o.quality * o.product.price) desc  ")
	List<Get5Orders> get5Orders();
	@Query("Select new Get5Products(o.product.name,o.product.price,count(o.id)) from Order o group by o.product.name,o.product.price order by count(o.id) desc")
	List<Get5Products> get5Products();
	@Query(value = "execute DoanhThuNgayProc :ngay", nativeQuery = true)
	List<ThongKeModel> getDoanhThuTheoNgay(@Param("ngay") String ngay);
	@Procedure(name="DoanhThuThangProc")
	List<ThongKeNamModel> getDoanhThuTungNgay( String dayBegin, String dayEnd);
	@Query("Select count(DISTINCT o.name) from Order o where o.date= :date")
	Integer getDonHangToDay(@Param("date") String date);
	@Query("Select sum(o.quality*o.product.price) from Order o where o.date= :date ")
	Double getDoanhThuToDay(@Param("date") String date);
	@Query("Select sum( o.quality) from Order o where o.date= :date")
	Integer getSLSPToDay(@Param("date") String date);
	@Query("Select new OrdersTodayModel(o.name,o.address.lastname,o.address.firstname,o.address.address,o.address.provincial , sum(o.product.price*o.quality)) from Order o where o.date= :date group by o.name,o.address.lastname,o.address.firstname,o.address.address,o.address.provincial order by sum(o.product.price*o.quality)  ")
	List<OrdersTodayModel> getOrdersToday(@Param("date") String date);
	
}
