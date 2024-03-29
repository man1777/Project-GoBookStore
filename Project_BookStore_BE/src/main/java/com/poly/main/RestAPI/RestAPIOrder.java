package com.poly.main.RestAPI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
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
import com.poly.main.Service.OrderService;

@RestController
@CrossOrigin("*")
public class RestAPIOrder {
@Autowired OrderService dao;
@RequestMapping("/rest/orderswaiting")
public List<OrderModel> getOrderWaiting(){
	return dao.getOrdersWaiting();
}
@RequestMapping("/rest/ordersshiped")
public List<OrderModel> getOrderShiped(){
	return dao.getOrdersShiped();
}
@RequestMapping("/rest/changestatus")
public void changeStatus(@RequestBody JsonNode requestBody) {
	String name = requestBody.get("name").asText();
	dao.changeStatus(name);
}
@RequestMapping("/rest/changestatustosuccess")
public void changeStatusToSuccess(@RequestBody JsonNode requestBody) {
	String name = requestBody.get("name").asText();
	dao.changeStatusToSuccess(name);
}
@RequestMapping("/rest/changestatustoback")
public void changeStatusToBack(@RequestBody JsonNode requestBody) {
	String name = requestBody.get("name").asText();
	String note = requestBody.get("note").asText();
	dao.changeStatusToBack(name,note);
}
@RequestMapping("/rest/orderdetail")
public List<OrderDetail> getOrderDetail( @RequestBody JsonNode requestBody ) {
	String name = requestBody.get("name").asText();
	return dao.getOrderDetail(name);
}


@RequestMapping("/rest/orderdetaill")
public Order getOrderDetaill( @RequestBody JsonNode requestBody ) {
	String name = requestBody.get("nameorder").asText();
	return dao.getOrderDetaill(name);
}
@RequestMapping("/rest/orderssuccess")
public List<OrderModel> getOrderSuccess(){
	return dao.getOrdersSuccess();
}
@RequestMapping("/rest/ordersback")
public List<OrderModel> getOrderBack(){
	return dao.getOrdersBack();
}
@RequestMapping("/rest/getDoanhThu")
public Double getDoanhThu() {
	return dao.getDoanhThu();
}
@RequestMapping("/rest/getDonHang")
public Integer getDonHang() {
	return dao.getDonHang();
}
@RequestMapping("/rest/get5DonHang")
public List<Get5Orders> get5DonHang() {
	return dao.get5Order();
}
@RequestMapping("/rest/get5SanPham")
public List<Get5Products> get5SanPham() {
	return dao.get5Products();
}
@RequestMapping("/rest/getDoanhThuTheoNgay")
public List<ThongKeModel> getDoanhThuTheoNgay(@RequestBody JsonNode requestBody) {
	String day = requestBody.get("day").asText();
	System.out.println("day:" +day);
	return dao.getDoanhThuTheoNgay(day);
}
@RequestMapping("/rest/getDoanhThuTheoNam")
public List<ThongKeNamModel> getDoanhThuTheoNam() {
	return dao.getDoanhThuTheoNam();
}
@RequestMapping("/rest/getDoanhThuTheoTungNgay")
public List<TraCuuDoanhSoModel> getDoanhThuTheoTungThang(@RequestBody JsonNode requestBody) {
	String dayBegin= requestBody.get("dayBegin").asText();
	String dayEnd= requestBody.get("dayEnd").asText();
	System.out.println(dayBegin +" "+ dayEnd);
	return dao.getDoanhThuTheoTungNgay(dayBegin,dayEnd);
}

@RequestMapping("/rest/getDoanhThuTungThangTheoNam")
public List<ThongKeDTTungThang> getDoanhThuTungThangTheoNam(@RequestBody JsonNode requestBody) {
	String year=requestBody.get("Nam").asText();
	System.out.println(year);
	return dao.getDoanhThuTheoMoiThangTheoNam(year);
}
@RequestMapping("/rest/getDonHangToDay")
public Integer getDonHangToDay(@RequestBody JsonNode requestBody) {
	String date=requestBody.get("date").asText();
	return dao.getDonHangToday(date);
}
@RequestMapping("/rest/getDoanhThuToday")
public Double getDoanhThuToday(@RequestBody JsonNode requestBody) {
	String date=requestBody.get("date").asText();
	return dao.getDoanhThuToday(date);
}

@RequestMapping("/rest/getSLSPToday")
public Integer getSLSPToday(@RequestBody JsonNode requestBody) {
	String date=requestBody.get("date").asText();
	return dao.getSLSPToday(date);
}
@RequestMapping("/rest/getOrdersToday")
public List<OrdersTodayModel> getOrdersToday(@RequestBody JsonNode requestBody) {
	String date=requestBody.get("date").asText();
	return dao.getOrdersToday(date);
}
}
