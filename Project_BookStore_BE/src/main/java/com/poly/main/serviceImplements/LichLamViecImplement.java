package com.poly.main.serviceImplements;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Service;

import com.poly.main.Entity.LichLamViec;
import com.poly.main.Model.ThongKeNamModel;
import com.poly.main.Service.LichLamViecService;
@Service
public class LichLamViecImplement implements LichLamViecService{
	@PersistenceContext
    private EntityManager entityManager;
	@Override
	public List<LichLamViec> getAll() {
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("getdaywork",LichLamViec.class);
	 return query.getResultList();
		
	}

}
