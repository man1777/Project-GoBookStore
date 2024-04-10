package com.poly.main.RestAPI;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.main.Entity.LichLamViec;
import com.poly.main.Service.LichLamViecService;

@RestController
@CrossOrigin("*")
public class RestLichLamViec {
	@Autowired LichLamViecService dao;
@RequestMapping("/rest/getlichlamviec")
public List<LichLamViec> getlich(){
	return dao.getAll();
}
}
