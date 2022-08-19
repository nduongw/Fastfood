package com.fastfood.entity;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.fastfood.utils.DBUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	private int total_spent;
	
	
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
	
	
	public User(int user_id, String account, String email, String name, String address,
			String phone, int is_admin, int total_spent) {
		super();
		this.user_id = user_id;
		this.account = account;
		this.email = email;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.is_admin = is_admin;
		this.total_spent = total_spent;
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
	
	public int getTotal_spent() {
		return total_spent;
	}

	public void setTotal_spent(int total_spent) {
		this.total_spent = total_spent;
	}

	public int login(Connection dbcon, String userName, String passwordString, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Customer cUser = DBUtils.findUser(dbcon, userName, passwordString);
			
			
			if (cUser == null) {
				return 0;
//                request.setAttribute("image", image);               
                
			} else {
                request.getSession().setAttribute("userAcc", cUser);
                System.out.println("Login: " + userName);
        		System.out.println("Login: " +passwordString);
        		System.out.println(cUser.getName());
        		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	public int logout(HttpSession session) {
		if (session != null) {
			session.removeAttribute("userAcc");
			return 1;
			
		}
		
		return 0;
	}
	
	public void register(Connection dbcon, String username, String password, String email, String name, String phone) {
		try {
			int check = DBUtils.addUser(dbcon, username, password, email, name, phone);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
}
