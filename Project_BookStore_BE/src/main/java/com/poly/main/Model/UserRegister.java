package com.poly.main.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class UserRegister {
	private String email;
	private String fullname;
	private String code;
	private String password;
	private String confirm;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public UserRegister(String email, String fullname, String code, String password, String confirm) {
		super();
		this.email = email;
		this.fullname = fullname;
		this.code = code;
		this.password = password;
		this.confirm = confirm;
	}
	public UserRegister() {
		super();
	}
	
}
