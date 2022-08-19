package com.fastfood.entity;

public class Drink extends Product{
	private int hotCold;

	public int getHotCold() {
		return hotCold;
	}

	public void setHotCold(int hotCold) {
		this.hotCold = hotCold;
	}

	public Drink(int hotCold) {
		super();
		this.hotCold = hotCold;
	}

	public Drink() {
		super();
	}

	public Drink(int id, String name, String description, int price, String image) {
		super(id, name, description, price, image);
	}
	
	public Drink(int id, String name, String description, int price, String image, int hotCold) {
		super(id, name, description, price, image);
		this.hotCold = hotCold;
	}
}
