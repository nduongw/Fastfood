package com.fastfood.entity;

import java.util.List;

public class Favourite extends User{
	private int id;
	
	public Favourite() {
		super();
	}

	public Favourite(int user_id, int dishIdList) {
		super(user_id);
		this.id = dishIdList;
	}
	
	public int getDishIdList() {
		return this.id;
	}
	
	public void setDishIdList(int dishIdList) {
		this.id = dishIdList;
	}
	
}
