package com.fastfood.entity;

import java.util.List;

import com.fastfood.utils.DBUtils;

public class Burger extends Product implements canAddSideDish{

	public Burger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Burger(int id, String name, String description, int price, String image) {
		super(id, name, description, price, image);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public static List<Product> AddedSideDish() {
		List<Product> products = null;
		
		products = DBUtils.queryDish(null);
	}
	

}
