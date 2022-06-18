package com.fastfood.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Dish;
import com.fastfood.entity.Category;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;

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
	
	public static int addUser(Connection connection, String userName, String password, String email, String name, String phone) throws SQLException {
		String sql = "INSERT INTO `users`(account, password, email, point, name, phone, membership) "
				+ "VALUES(?, ?, ?, 0, ?, ?, 0)";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		pstm.setString(1, userName);
		pstm.setString(2, password);
		pstm.setString(3, email);
		pstm.setString(4, name);
		pstm.setString(5, phone);
		
		int result = pstm.executeUpdate();
				
		if (result != 0) {
			System.out.println("Done");
			return 1;
		} else {
			System.out.println("Not done");
		}
		
		return 0;
	}
	
	public static List<Dish> queryallDish(Connection connection) throws SQLException {
		String sql = "SELECT * FROM dishes";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Dish> dishList = new ArrayList<Dish>();
		
		while (rs.next()) {
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
	
	public static List<Category> queryallCategory(Connection connection) throws SQLException {
		String sql = "SELECT * FROM categories";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Category> cateList = new ArrayList<Category>();
		
		while (rs.next()) {
			int id = rs.getInt("category_id");
			String name = rs.getString("category_name");
			
			Category cate = new Category(id, name);
			cateList.add(cate);
		}
		
		return cateList;
	}
	
	public static Dish queryDish(Connection connection, int id) throws SQLException {
		String sql = "SELECT * FROM dishes WHERE dish_id = " + id;
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		Dish dish = null;
		
		while (rs.next()) {
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			
			dish = new Dish(id, name, category_id, description, price);
		}
		
		return dish;
	}
	
	public static int editDish(Connection connection, int id, String name, int category_id, String description, int price) throws SQLException {
		String sql = "UPDATE dishes "
				+ "SET name = '" + name + "', category_id = " + category_id + 
				", description = '" + description + "', price = " + price + 
				" WHERE dish_id = " + id + ";";
		
		try {
			connection.prepareStatement(sql).executeUpdate();
			return 1;
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int deleteDish(Connection connection, int dish_id) throws SQLException {
		String sql = "DELETE FROM dishes WHERE dish_id = " + dish_id;
		
		try {
			connection.prepareStatement(sql).executeUpdate();
			return 1;
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	
//	public static void main(String[] args) {
//		ConnectDatabase con = new ConnectDatabase();
//		Connection dbcon = con.getJDBCConnection();
//		
//		try {
//			List<Dish> list = DBUtils.queryDish(dbcon);
//			for(Dish o: list) {
//				System.out.println(o.getName());
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			System.out.print("failed");
//		}
//	}
}
