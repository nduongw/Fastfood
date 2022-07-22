package com.fastfood.entity;

import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.utils.DBUtils;

public class Admin extends User implements Greeting{
	private int access;

	public int getAccess() {
		return access;
	}

	public void setAccess(int access) {
		this.access = access;
	}

	public Admin() {
		
	}
	
	public Admin(int access) {
		super();
		this.access = access;
	}
	
	@Override
	public String greeting() {
		return (String) "Hello" + this.getName() + "Access level: " + this.getAccess();
	}
	
	public void addDish(Connection connection, String name, String category, String description, int price) {
		try {
			int result = DBUtils.addDish(connection, name, category, description, price);
			if (result == 0) {
				String message = "Cant add";
			} else {
				String message = "Added successfully";

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteDish(Connection connection, int id) {
		try {
			int result = DBUtils.deleteDish(connection, id);
			if (result == 0) {
				System.out.println("Cant delete");
			} else {
				System.out.println("Delete successfully");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void editDish(Connection connection, int id, Dish result) {
		try {
			result = DBUtils.queryDish(connection, id);
			if (result == null) {
				System.out.println("Can't find the dish");
			} else {
                
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
