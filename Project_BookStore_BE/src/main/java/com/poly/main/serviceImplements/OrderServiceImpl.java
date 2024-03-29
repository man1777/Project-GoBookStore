package com.poly.main.serviceImplements;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.main.Dao.OrderDao;
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
@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	@Autowired OrderDao dao;
	@PersistenceContext
    private EntityManager entityManager;
	@Override
	public List<OrderModel> getOrdersWaiting() {
		// TODO Auto-generated method stub
		return dao.getOrdersWaiting();
	}

	@Override
	public List<OrderModel> getOrdersShiped() {
		// TODO Auto-generated method stub
		return dao.getOrdersShiped();
	}

	@Override
	public void changeStatus(String name) {
        entityManager.createQuery("UPDATE Order o SET o.trangthai = 1 WHERE o.name = :name")
                     .setParameter("name", name)
                     .executeUpdate();
    }

	@Override
	public void changeStatusToSuccess(String name) {
        entityManager.createQuery("UPDATE Order o SET o.trangthai = 2,o.status=1 WHERE o.name = :name")
                     .setParameter("name", name)
                     .executeUpdate();
    }
	@Override
	public void changeStatusToBack(String name,String note) {
        entityManager.createQuery("UPDATE Order o SET o.trangthai = 3,o.ghichu=:note WHERE o.name = :name")
                     .setParameter("name", name)
                     .setParameter("note", note)
                     .executeUpdate();
    }
	@Override
	public List<OrderDetail> getOrderDetail(String name) {
		// TODO Auto-generated method stub
		return dao.getOrderDetail(name);
	}

	@Override
	public Order getOrderDetaill(String name) {
		// TODO Auto-generated method stub
		return dao.getOrderDetaill(name);
	}

	@Override
	public List<OrderModel> getOrdersSuccess() {
		// TODO Auto-generated method stub
		return dao.getOrdersSuccess();
	}

	@Override
	public List<OrderModel> getOrdersBack() {
		// TODO Auto-generated method stub
		return dao.getOrdersBack();
	}

	@Override
	public Double getDoanhThu() {
		// TODO Auto-generated method stub
		return dao.getDoanhThu();
	}

	@Override
	public Integer getDonHang() {
		// TODO Auto-generated method stub
		return dao.getDonHang();
	}

	@Override
	public List<Get5Orders> get5Order() {
		// TODO Auto-generated method stub
		return dao.get5Orders();
	}

	@Override
	public List<Get5Products> get5Products() {
		// TODO Auto-generated method stub
		return dao.get5Products();
	}

	@Override
	public List<ThongKeModel> getDoanhThuTheoNgay(String day) {
//		 entityManager.createQuery("CALL DoanhThuNgayProc(:ngay)")
//         .setParameter("ngay", day)
//         .executeUpdate();
		return dao.getDoanhThuTheoNgay(day);
	}

	@Override
	public List<ThongKeNamModel> getDoanhThuTheoNam() {
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("DoanhThuNamProc", ThongKeNamModel.class);
        
        return query.getResultList();
		
	}

	@Override
	public List<TraCuuDoanhSoModel> getDoanhThuTheoTungNgay(String dayBegin, String dayEnd) {
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("sp_DoanhThuTuNgayDenNgay", TraCuuDoanhSoModel.class);
		query.registerStoredProcedureParameter("NgayBatDau", String.class, ParameterMode.IN);
	    query.registerStoredProcedureParameter("NgayKetThuc", String.class, ParameterMode.IN);
	    // Đặt giá trị cho các tham số
	    query.setParameter("NgayBatDau", dayBegin);
	    query.setParameter("NgayKetThuc", dayEnd);
        return query.getResultList();
	}

	@Override
	public List<ThongKeDTTungThang> getDoanhThuTheoMoiThangTheoNam(String nam) {
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("DoanhThuThangProc",ThongKeDTTungThang.class);
		query.registerStoredProcedureParameter("Nam", String.class, ParameterMode.IN);
	    // Đặt giá trị cho các tham số
	    query.setParameter("Nam", nam);
	    query.execute();
        return query.getResultList();
	}

	@Override
	public Integer getDonHangToday(String date) {
		// TODO Auto-generated method stub
		return dao.getDonHangToDay(date);
	}

	@Override
	public Double getDoanhThuToday(String date) {
		// TODO Auto-generated method stub
		return dao.getDoanhThuToDay(date);
	}

	@Override
	public Integer getSLSPToday(String date) {
		// TODO Auto-generated method stub
		return dao.getSLSPToDay(date);
	}

	@Override
	public List<OrdersTodayModel> getOrdersToday(String date) {
		// TODO Auto-generated method stub
		return dao.getOrdersToday(date);
	}

	
	
	
	
}
