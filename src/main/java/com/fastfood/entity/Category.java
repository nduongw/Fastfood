package com.fastfood.entity;

public class Category {
	private int id;
	private String cateString;
	
	public Category() {
		super();
	}

	public Category(int id, String cateString) {
		super();
		this.id = id;
		this.cateString = cateString;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCateString() {
		return cateString;
	}
	
	public void setCateString(String cateString) {
		this.cateString = cateString;
	}
	
	
}
