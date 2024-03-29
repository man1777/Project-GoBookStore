package com.poly.main.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
public class LoadInfo {
	@Id
	Serializable group;
	//private String image;

	public Serializable getGroup() {
		return group;
	}

	public void setGroup(Serializable group) {
		this.group = group;
	}

	public LoadInfo(Serializable group) {
		super();
		this.group = group;
	}

	public LoadInfo() {
		super();
	}
	
}
