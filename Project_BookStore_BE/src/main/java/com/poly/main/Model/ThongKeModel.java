package com.poly.main.Model;






import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

@Entity

public class ThongKeModel {
	@Id
	Integer doanhthu;
	
	public ThongKeModel(Integer doanhthu) {
		super();
		this.doanhthu = doanhthu;
	}

	public Integer getDoanhthu() {
		return doanhthu;
	}

	public void setDoanhthu(Integer doanhthu) {
		this.doanhthu = doanhthu;
	}

	public ThongKeModel() {
		super();
	}

	
}
