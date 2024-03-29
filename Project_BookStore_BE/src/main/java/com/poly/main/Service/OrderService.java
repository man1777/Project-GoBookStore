package com.poly.main.Service;

import java.util.Date;
import java.util.List;

import com.poly.main.Entity.Order;
import com.poly.main.Model.Get5Orders;
import com.poly.main.Model.Get5Products;
import com.poly.main.Model.OrderDetail;
import com.poly.main.Model.OrderModel;
import com.poly.main.Model.OrdersTodayModel;
import com.poly.main.Model.ThongKeDTTungThang;
import com.poly.main.Model.ThongKeModel;
import com.poly.main.Model.ThongKeNamModel;
import com.poly.main.Model.TraCuuDoanhSoModel;

public interface OrderService {
	List<OrderModel> getOrdersWaiting();
	List<OrderModel> getOrdersShiped();
	List<OrderModel> getOrdersSuccess();
	List<OrderModel> getOrdersBack();
	void changeStatus(String name);
	List<OrderDetail> getOrderDetail(String name);
	Order getOrderDetaill(String name);
	void changeStatusToSuccess(String name);
	void changeStatusToBack(String name,String ghichu);
	
	Double getDoanhThu();
	Integer getDonHang();
	List<Get5Orders> get5Order();
	List<Get5Products> get5Products();
	List<ThongKeModel> getDoanhThuTheoNgay(String day);
	List<ThongKeNamModel> getDoanhThuTheoNam();
	List<TraCuuDoanhSoModel> getDoanhThuTheoTungNgay(String dayBegin, String dayEnd);
	List<ThongKeDTTungThang> getDoanhThuTheoMoiThangTheoNam(String nam);
	Integer getDonHangToday(String date);
	Double getDoanhThuToday(String date);
	Integer getSLSPToday(String date);
	List<OrdersTodayModel> getOrdersToday(String date);
}
