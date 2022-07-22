package com.fastfood.entity;

import java.sql.Date;
import java.util.List;

public class Receipt {
	private int id;
	private int user_id;
	private int status;
	private Date time;
	private int payment;
	private int total;
	private List<Cart> cartList;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}
	
	public Date getTime() {
		return time;
	}
	
	public void setTime(Date time) {
		this.time = time;
	}
	
	public int getPayment() {
		return payment;
	}
	
	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<Cart> getCartList() {
		return this.cartList;
	}
	
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	
	public Receipt() {
		super();
	}
	
	
}
