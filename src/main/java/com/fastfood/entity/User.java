package com.fastfood.entity;

import java.util.Date;

public class User {
	private int user_id;
	private String account;
	private String password;
	private String email;
	private String name;
	private String address;
	private Date birthday_date;
	private String phone;
	private int is_admin;
	
	public User () {
	}
	
	public User(int user_id, String account, String password, String email, String name, String address,
			Date birthday_date, String phone) {
		super();
		this.user_id = user_id;
		this.account = account;
		this.password = password;
		this.email = email;
		this.name = name;
		this.address = address;
		this.birthday_date = birthday_date;
		this.phone = phone;
	}
	
	public User(int user_id) {
		super();
		this.user_id = user_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getAccount() {
		return account;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public Date getBirthday_date() {
		return birthday_date;
	}

	public String getPhone() {
		return phone;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setBirthday_date(Date birthday_date) {
		this.birthday_date = birthday_date;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}
	
}
