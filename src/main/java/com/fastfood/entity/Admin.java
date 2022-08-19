package com.fastfood.entity;

import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.controller.admin.removeReceipt;
import com.fastfood.utils.DBUtils;
import com.mysql.cj.xdevapi.DatabaseObject.DbObjectType;

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
	
	public void removeAccount(Connection connection, int id) throws SQLException {
		int result = DBUtils.removeAccount(connection, id);
		
		if (result == 0) {
			System.out.println("Cant delete");
		} else {
			System.out.println("Delete successfully");
		}
	}
	
	public void removeReceipt(Connection connection, int id) throws SQLException {
		int result = DBUtils.removeReceipt(connection, id);
		
		if (result == 0) {
			System.out.println("Cant delete");
		} else {
			System.out.println("Delete successfully");
		}
	}
	
	public void editAccount(Connection connection, int id, Customer customer) throws SQLException {
		customer = DBUtils.findUser(connection, id);
		
		if (customer == null) {
			System.out.println("Cant found this customer");
		} else {
			System.out.println("Found!");
		}
	}
	
	public void changeStatus(Connection connection, int id) throws SQLException {
		DBUtils.changeStatus(connection, id);
	}
}
