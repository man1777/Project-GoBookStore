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
public class ShowSelect {
	@Id
	Serializable group;
	Long count;
	//Long sum;
	public Serializable getGroup() {
		return group;
	}
	public void setGroup(Serializable group) {
		this.group = group;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public ShowSelect(Serializable group, Long count) {
		super();
		this.group = group;
		this.count = count;
	}
	public ShowSelect() {
		super();
	}
	
}
