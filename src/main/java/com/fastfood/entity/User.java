package com.fastfood.entity;

import java.util.Date;

public class User {
	private int user_id;
	private String account;
	private String password;
	private String email;
	private int point;
	private String name;
	private String address;
	private Date birthday_date;
	private String phone;
	private int membership;
	private boolean admin;
	
	public User () {
		
	}
	
	public User(int user_id, String account, String password, String email, int point, String name, String address,
			Date birthday_date, String phone, int membership, boolean admin) {
		super();
		this.user_id = user_id;
		this.account = account;
		this.password = password;
		this.email = email;
		this.point = point;
		this.name = name;
		this.address = address;
		this.birthday_date = birthday_date;
		this.phone = phone;
		this.membership = membership;
		this.admin = admin;
	}
	
	public User(int user_id) {
		super();
		this.user_id = user_id;
	}

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getBirthday_date() {
		return birthday_date;
	}
	public void setBirthday_date(Date birthday_date) {
		this.birthday_date = birthday_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int isMembership() {
		return membership;
	}
	public void setMembership(int i) {
		this.membership = i;
	}
	
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	
	
}
