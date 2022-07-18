package com.fastfood.entity;

public class Cart extends Dish{
	private int quantity;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

//	public Cart(int dish_id, String name, int category_id, String description, int price, int quantity, String image) {
//		super(dish_id, name, category_id, description, price, image);
//		this.quantity = quantity;
//	}
	
	public Cart() {
		
	};
}
