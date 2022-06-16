package com.fastfood.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Dish;
import com.fastfood.entity.User;

public class DBUtils {
	public static User findUser(Connection connection, String userName, String password) throws SQLException {
		String sql = "SELECT account, password FROM `users`"
				+ "WHERE account = ? AND password = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			User accUser = new User();
			accUser.setAccount(userName);
			accUser.setPassword(password);
			
			return accUser;
		}
		
		return null;
	}
	
	public static int addDish(Connection connection, String name, String category, String description, int price) throws SQLException {
		String sql = "SELECT * FROM categories WHERE category_name = '" + category + "'";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		if (rs.next()) {
			int category_id = rs.getInt("category_id");
			sql = "INSERT INTO dishes (name, category_id, description, price) VALUES ('"
					+ name + "', " + category_id + ", '" + description + "', " + price + ");";
			connection.prepareStatement(sql).executeUpdate();
			System.out.println("Added successfully");
			return 1;
		}
		
		return 0;
	}
	
	public static List<Dish> queryDish(Connection connection) throws SQLException {
		String sql = "SELECT * FROM dishes";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Dish> dishList = new ArrayList<Dish>();
		
		if (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			
			Dish nDish = new Dish(dish_id, name, category_id, description, price);
			dishList.add(nDish);
		}
		
		return dishList;
	}
}
