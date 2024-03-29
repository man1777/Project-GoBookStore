package com.poly.main.Model;

import lombok.Data;

@Data
public class ChangePassword {
	public String email;
	public String fullname;
	private String oldPassword;
	private String newPassword;
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
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public ChangePassword(String email, String fullname, String oldPassword, String newPassword, String confirm) {
		super();
		this.email = email;
		this.fullname = fullname;
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
		this.confirm = confirm;
	}
	public ChangePassword() {
		super();
	}
	
}
