package com.fastfood.entity;

public class Dish {
	private int dish_id;
	private String name;
	private int category_id;
	private String description;
	private String image;
	private int price;
	private String category;
	
	public Dish(int dish_id, String name, int category_id, String description, int price, String image) {
		super();
		this.dish_id = dish_id;
		this.name = name;
		this.category_id = category_id;
		this.description = description;
		this.price = price;
		this.image = image;
	}
	
	public Dish(int dish_id, String name, int category_id, String description, int price) {
		super();
		this.dish_id = dish_id;
		this.name = name;
		this.category_id = category_id;
		this.description = description;
		this.price = price;
	}
	
	public Dish() {
		
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getDish_id() {
		return dish_id;
	}
	
	public void setDish_id(int dish_id) {
		this.dish_id = dish_id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCategory_id() {
		return category_id;
	}
	
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
