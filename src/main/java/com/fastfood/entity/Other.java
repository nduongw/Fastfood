package com.fastfood.entity;

public class Other extends Product{
	private String color;
	private String ingradient;
	
	public Other() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Other(int id, String name, String description, int price, String image) {
		super(id, name, description, price, image);
		// TODO Auto-generated constructor stub
	}
	
	public Other(String color, String ingradient) {
		super();
		this.color = color;
		this.ingradient = ingradient;
	}
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getIngradient() {
		return ingradient;
	}
	
	public void setIngradient(String ingradient) {
		this.ingradient = ingradient;
	}
	
	
}
