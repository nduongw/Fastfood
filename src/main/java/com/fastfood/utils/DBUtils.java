package com.fastfood.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.fastfood.entity.Cart;
import com.fastfood.entity.Category;
import com.fastfood.entity.Customer;
import com.fastfood.entity.Dish;
import com.fastfood.entity.Favourite;
import com.fastfood.entity.Receipt;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.mysql.cj.jdbc.ConnectionImpl;

public class DBUtils {
	public static Customer findUser(Connection connection, String userName, String password) throws SQLException {
		String sql = "SELECT * FROM `users`"
				+ "WHERE account = ? AND password = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			Customer accUser = new Customer();
			accUser.setAccount(userName);
			accUser.setPassword(password);
			accUser.setName(rs.getString("name"));
			accUser.setAddress(rs.getString("address"));
			accUser.setEmail(rs.getString("email"));
			accUser.setPhone(rs.getString("phone"));
			accUser.setUser_id(rs.getInt("user_id"));
			accUser.setPoint(0);
			accUser.setMembership(0);
			return accUser;
		}
		
		return null;
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
	
	public static List<Dish> queryDish(Connection connection) throws SQLException {
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
			String image = rs.getString("image");
			
			Dish nDish = new Dish(dish_id, name, category_id, description, price, image);
			dishList.add(nDish);
		}
		
		return dishList;
	}
	
	public static List<Dish> queryDishLow2High(Connection connection) throws SQLException {
		String sql = "SELECT * FROM dishes "
					+ "ORDER BY price";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Dish> dishList = new ArrayList<Dish>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			Dish nDish = new Dish(dish_id, name, category_id, description, price, image);
			dishList.add(nDish);
		}
		
		return dishList;
	}
	
	public static List<Dish> queryDishHigh2Low(Connection connection) throws SQLException {
		String sql = "SELECT * FROM dishes "
				+ "ORDER BY price DESC";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Dish> dishList = new ArrayList<Dish>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			Dish nDish = new Dish(dish_id, name, category_id, description, price, image);
			dishList.add(nDish);
		}
		
		return dishList;
	}
	
	public static List<Dish> queryDish(Connection connection, String id) throws SQLException {
		String sql = "SELECT * FROM dishes "
				+ "WHERE category_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, id);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Dish> dishList = new ArrayList<Dish>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			Dish nDish = new Dish(dish_id, name, category_id, description, price, image);
			dishList.add(nDish);
		}
		
		return dishList;
	}
	
	public static Dish queryDish(Connection connection, int pid) throws SQLException {
		String sql = "SELECT * FROM dishes "
				+ "WHERE dish_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setInt(1, pid);
		
		ResultSet rs = pstm.executeQuery();
		
		Dish dish = null;
		
		while (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			dish = new Dish(dish_id, name, category_id, description, price, image);
		}
		
		return dish;
	}
	
	public static List<Category> getAllCategories(Connection connection) throws SQLException {
		String sql = "SELECT * FROM categories";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Category> categoryList = new ArrayList<Category>();
		
		while(rs.next()) {
			int category_id = rs.getInt("category_id");
			String category_name = rs.getString("category_name");
			
			Category category = new Category(category_id, category_name);
			
			categoryList.add(category);
		}
		
		return categoryList;
	}
	
	public static List<Dish> searchByName(Connection connection, String searchName) throws SQLException {
		String sql = "SELECT * FROM dishes "
				+ "WHERE name like ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1,"%" + searchName + "%");
		
		ResultSet rs = pstm.executeQuery();
		
		List<Dish> dishList = new ArrayList<Dish>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			Dish nDish = new Dish(dish_id, name, category_id, description, price, image);
			dishList.add(nDish);
		}
		
		return dishList;
	}
	
	public static List<Cart> getAllCart(Connection connection, ArrayList<Cart> cartList) throws SQLException {
		List<Cart> products = new ArrayList<Cart>();
		
		if (cartList.size() > 0) {
			for (Cart item: cartList) {
				String queryString = "SELECT * FROM dishes WHERE dish_id = ?";
									
				PreparedStatement pstm = connection.prepareStatement(queryString);
				pstm.setInt(1, item.getDish_id());
				
				ResultSet rs = pstm.executeQuery();
				
				while(rs.next()) {
					Cart cart = new Cart();
					
					cart.setImage(rs.getString("image"));
					cart.setName(rs.getString("name"));
					cart.setCategory_id(rs.getInt("category_id"));
					cart.setDescription(rs.getString("description"));
					cart.setQuantity(item.getQuantity());
					cart.setPrice(rs.getInt("price") * cart.getQuantity());
					cart.setDish_id(item.getDish_id());
					
					products.add(cart);
				}
			}
		}
		
		return products;
	}
	
	public static void addFavourite(Connection connection, int userId, int dishId) throws SQLException {
		String query = "INSERT INTO `favorites`(user_id, dish_id) VALUES(?, ?)";
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		pstm.setInt(2, dishId);
		
		pstm.executeUpdate();
					
	}
	
	public static List<Favourite> getFavourites(Connection connection, int userId) throws SQLException {
		String query = "SELECT dish_id FROM favorites WHERE user_id = ?";
		List<Favourite> myFavourites = new ArrayList<Favourite>();
		
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		ResultSet rs = pstm.executeQuery();
		
		while(rs.next()) {
			Favourite favourite = new Favourite();
			favourite.setDishIdList(rs.getInt("dish_id"));
			favourite.setUser_id(userId);
			
			myFavourites.add(favourite);
		}
		
		return myFavourites;
	}
	
	public static void removeFavourite(Connection connection, int userId, int dishId) throws SQLException{
		String query = "DELETE FROM favorites WHERE user_id = ? AND dish_id = ?";
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		pstm.setInt(2, dishId);
		
		pstm.executeUpdate();
	}
	
	public static void addReceipt(Connection connection, Receipt receipt, int user_id) throws SQLException {
		String query1 = "INSERT INTO `receipts`(receipt_id, user_id, status, time, payment, total_payment) "
				+ "VALUES(?, ?, 0, ?, 1, ?)";
		
		String query2 = "INSERT INTO `receipts_dishes`(receipt_id, dish_id) "
				+ "VALUES(?, ?)";
		
		PreparedStatement pstm = connection.prepareStatement(query1);
		
		int MAX = 9999999;
		int MIN = 1;
		int randomId = (int)Math.floor(Math.random()*(MAX-MIN+1)+MIN);
		
		pstm.setInt(1, randomId);
		pstm.setInt(2, user_id);
		pstm.setTimestamp(3, java.sql.Timestamp.valueOf(java.time.LocalDateTime.now()));
		pstm.setInt(4, receipt.getTotal());
		
		pstm.executeUpdate();
		
		pstm = connection.prepareStatement(query2);
		pstm.setInt(1, randomId);
		
		for (Cart cart: receipt.getCartList()) {
			System.out.println(cart.getDish_id());
			pstm.setInt(2, cart.getDish_id());
			pstm.executeUpdate();
		}
	}
	

	
	public static void main(String args[]) throws SQLException {
		DBUtils dbUtils = new DBUtils();
		Connection conn = ConnectDatabase.getJDBCConnection();
//		Cart test1 = new Cart();
//		test1.setDish_id(351);
//		Cart test2 = new Cart();
//		test2.setDish_id(352);
//		
//		ArrayList<Cart> cartList = new ArrayList<Cart>();
//		cartList.add(test1);
//		cartList.add(test2);
//		
//		List<Cart> products = dbUtils.getAllCart(conn, cartList);
//		
//		for (Cart cart: products) {
//			System.out.println(cart.getName());
//		}
		
//		dbUtils.addFavourite(conn, 3, 352);
		
//		List<Favourite> myFavourites = dbUtils.getFavourites(conn, 6);
//		
//		for (Favourite favourite : myFavourites) {
//			System.out.println(favourite.getDishIdList());
//		}
		
		Dish dish = dbUtils.queryDish(conn, 351);
		System.out.println(dish.getName());
	}
	
}
