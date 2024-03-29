package com.poly.main.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class EmployeeReport {
	@Id
	Serializable group;
	
	private String position;
	
	private int id;
	
	private String startDay;

	public Serializable getGroup() {
		return group;
	}

	public void setGroup(Serializable group) {
		this.group = group;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public EmployeeReport(Serializable group, String position, int id, String startDay) {
		super();
		this.group = group;
		this.position = position;
		this.id = id;
		this.startDay = startDay;
	}

	public EmployeeReport() {
		super();
	}
	
	
}
