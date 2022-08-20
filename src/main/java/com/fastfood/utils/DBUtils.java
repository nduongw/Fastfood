package com.fastfood.utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Admin;
import com.fastfood.entity.Burger;
import com.fastfood.entity.Cart;
import com.fastfood.entity.Category;
import com.fastfood.entity.Chicken;
import com.fastfood.entity.Customer;
import com.fastfood.entity.Drink;
import com.fastfood.entity.Other;
import com.fastfood.entity.Product;
import com.fastfood.entity.Receipt;
import com.fastfood.entity.Rice;
import com.fastfood.entity.SideDish;
import com.fastfood.entity.Spaghetti;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;

public class DBUtils {
	public static User findUser(Connection connection, String userName, String password) throws SQLException {
		String sql = "SELECT * FROM `users`"
				+ "WHERE account = ? AND password = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		
		ResultSet rs = pstm.executeQuery();
		
		int is_admin = 0;
		
		if (rs.next()) {
			is_admin = rs.getInt("is_admin");
			int id = rs.getInt("user_id");
			String account = rs.getString("account");
			String userPassword = rs.getString("password");
			String email = rs.getString("email");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String phone = rs.getString("phone");
			
			if (is_admin != 0) {
				Admin admin = new Admin(id, account, userPassword, email, name, address, phone, is_admin);
				
				return admin;
				
			} else {
				int point = rs.getInt("point");
				int membership = rs.getInt("membership");
				Customer customer = new Customer(id, account, userPassword, email, name, address, phone, is_admin, point, membership);
				
				return customer;
			}
		}
		
		return null;
	}
	
	public static int checkAdmin(Connection connection, String userName, String password) throws SQLException {
		String sql = "SELECT * FROM `users`"
				+ "WHERE account = ? AND password = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		
		ResultSet rs = pstm.executeQuery();
		int result = 0;
		
		if (rs.next()) {
			result = rs.getInt("is_admin");
		}
		
		return result;
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
	
	public static void changePasswordUser(Connection connection, String password, int userId) throws SQLException {
		String sql = "UPDATE users\n"
				+ "SET password = ?\n"
				+ "WHERE user_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		pstm.setString(1, password);
		pstm.setInt(2, userId);
		
		pstm.executeUpdate();
	}
	
	public static List<Product> queryDish(Connection connection) throws SQLException {
		String sql = "SELECT * FROM products";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Product> productList = new ArrayList<Product>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("product_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			switch (category_id){
			case 1: {
				Chicken chicken = new Chicken(dish_id, name, description, price, image);
				productList.add(chicken);
				break;
			} case 2: {
				Rice rice = new Rice(dish_id, name, description, price, image);
				productList.add(rice);
				break;
			} case 3: {
				Burger burger = new Burger(dish_id, name, description, price, image);
				productList.add(burger);
				break;
			} case 4: {
				Spaghetti spaghetti = new Spaghetti(dish_id, name, description, price, image);
				productList.add(spaghetti);
				break;
			} case 6: {
				SideDish sideDish = new SideDish(dish_id, name, description, price, image);
				productList.add(sideDish);
				break;
			} case 7: {
				Drink drink = new Drink(dish_id, name, description, price, image);
				productList.add(drink);
				break;
			} case 9: {
				Other other = new Other(dish_id, name, description, price, image);
				productList.add(other);
				break;
			}
			default:
				break;
			}
		}
		
		return productList;
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
	
	public static List<Product> queryDish(Connection connection, String id) throws SQLException {
		String sql = "SELECT * FROM products "
				+ "WHERE category_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, id);
		
		ResultSet rs = pstm.executeQuery();
		
		List<Product> productList = new ArrayList<Product>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("product_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			switch (category_id){
			case 1: {
				Chicken chicken = new Chicken(dish_id, name, description, price, image);
				productList.add(chicken);
				break;
			} case 2: {
				Rice rice = new Rice(dish_id, name, description, price, image);
				productList.add(rice);
				break;
			} case 3: {
				Burger burger = new Burger(dish_id, name, description, price, image);
				productList.add(burger);
				break;
			} case 4: {
				Spaghetti spaghetti = new Spaghetti(dish_id, name, description, price, image);
				productList.add(spaghetti);
				break;
			} case 6: {
				SideDish sideDish = new SideDish(dish_id, name, description, price, image);
				productList.add(sideDish);
				break;
			} case 7: {
				Drink drink = new Drink(dish_id, name, description, price, image);
				productList.add(drink);
				break;
			} case 9: {
				Other other = new Other(dish_id, name, description, price, image);
				productList.add(other);
				break;
			}
			default:
				break;
			}
		}
		
		return productList;
	}
	
	public static Product queryDish(Connection connection, int pid) throws SQLException {
		String sql = "SELECT * FROM products "
				+ "WHERE product_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setInt(1, pid);
		
		ResultSet rs = pstm.executeQuery();
		
		Product dish = null;
		
		while (rs.next()) {
			int dish_id = rs.getInt("product_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			switch (category_id){
			case 1: {
				Chicken chicken = new Chicken(dish_id, name, description, price, image);
				return chicken;
			} case 2: {
				Rice rice = new Rice(dish_id, name, description, price, image);
				return rice;
			} case 3: {
				Burger burger = new Burger(dish_id, name, description, price, image);
				return burger;
			} case 4: {
				Spaghetti spaghetti = new Spaghetti(dish_id, name, description, price, image);
				return spaghetti;
			} case 6: {
				SideDish sideDish = new SideDish(dish_id, name, description, price, image);
				return sideDish;
			} case 7: {
				Drink drink = new Drink(dish_id, name, description, price, image);
				return drink;
			} case 9: {
				Other other = new Other(dish_id, name, description, price, image);
				return other;
			}
			default:
				break;
			}
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
	
	public static List<Product> searchByName(Connection connection, String searchName) throws SQLException {
		String sql = "SELECT * FROM products "
				+ "WHERE name like ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1,"%" + searchName + "%");
		
		ResultSet rs = pstm.executeQuery();
		
		List<Product> productList = new ArrayList<Product>();
		
		while (rs.next()) {
			int dish_id = rs.getInt("product_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			
			switch (category_id){
			case 1: {
				Chicken chicken = new Chicken(dish_id, name, description, price, image);
				productList.add(chicken);
				break;
			} case 2: {
				Rice rice = new Rice(dish_id, name, description, price, image);
				productList.add(rice);
				break;
			} case 3: {
				Burger burger = new Burger(dish_id, name, description, price, image);
				productList.add(burger);
				break;
			} case 4: {
				Spaghetti spaghetti = new Spaghetti(dish_id, name, description, price, image);
				productList.add(spaghetti);
				break;
			} case 6: {
				SideDish sideDish = new SideDish(dish_id, name, description, price, image);
				productList.add(sideDish);
				break;
			} case 7: {
				Drink drink = new Drink(dish_id, name, description, price, image);
				productList.add(drink);
				break;
			} case 9: {
				Other other = new Other(dish_id, name, description, price, image);
				productList.add(other);
				break;
			}
			default:
				break;
			}
		}
		
		return productList;
	}
	
	public static List<Cart> getAllCart(Connection connection, ArrayList<Cart> cartList) throws SQLException {
		List<Cart> products = new ArrayList<Cart>();
		
		if (cartList.size() > 0) {
			for (Cart item: cartList) {
				String queryString = "SELECT * FROM products WHERE product_id = ?";
									
				PreparedStatement pstm = connection.prepareStatement(queryString);
				pstm.setInt(1, item.getId());
				
				ResultSet rs = pstm.executeQuery();
				
				while(rs.next()) {
					Cart cart = new Cart();
					
					cart.setImage(rs.getString("image"));
					cart.setName(rs.getString("name"));
					cart.setDescription(rs.getString("description"));
					cart.setQuantity(item.getQuantity());
					cart.setPrice(rs.getInt("price") * cart.getQuantity());
					cart.setId(item.getId());
					
					products.add(cart);
				}
			}
		}
		
		return products;
	}
	
	public static void addFavourite(Connection connection, int userId, int dishId) throws SQLException {
		String query = "INSERT INTO `favorites`(user_id, product_id) VALUES(?, ?)";
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		pstm.setInt(2, dishId);
		
		pstm.executeUpdate();
					
	}
	
	public static List<Product> getFavourites(Connection connection, int userId) throws SQLException {
		String query = "SELECT * FROM products \n"
				+ "INNER JOIN favorites \n"
				+ "WHERE products.product_id = favorites.product_id\n"
				+ "AND user_id = ?";
		
		List<Product> myFavourites = new ArrayList<Product>();
		
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		ResultSet rs = pstm.executeQuery();
		
		while(rs.next()) {
			Product favourite = new Product();
			favourite.setId(rs.getInt("product_id"));
			favourite.setName(rs.getString("name"));
			favourite.setImage(rs.getString("image"));
			
			myFavourites.add(favourite);
		}
		
		return myFavourites;
	}
	
	public static void removeFavourite(Connection connection, int userId, int dishId) throws SQLException{
		String query = "DELETE FROM favorites WHERE user_id = ? AND product_id = ?";
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		pstm.setInt(2, dishId);
		
		pstm.executeUpdate();
	}
	
	public static void addReceipt(Connection connection, Receipt receipt, int user_id) throws SQLException {
		String query1 = "INSERT INTO `receipts`(receipt_id, user_id, status, time, payment, total_payment) "
				+ "VALUES(?, ?, 0, ?, 1, ?)";
		
		String query2 = "INSERT INTO `receipts_dishes`(receipt_id, product_id) "
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
		
		for (Cart cart: receipt.getProducts()) {
			System.out.println(cart.getId());
			pstm.setInt(2, cart.getId());
			pstm.executeUpdate();
		}
	}
	
	public static void changeCustomerInfo(Connection connection, String username, String email, String name, String address, String phone, int userId) throws SQLException {
		String sql = "UPDATE users\n"
				+ "SET account = ?,\n"
				+ "	email = ?,\n"
				+ "    name = ?,\n"
				+ "    address = ?,\n"
				+ "    phone = ?\n"
				+ "WHERE user_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		pstm.setString(1, username);
		pstm.setString(2, email);
		pstm.setString(3, name);
		pstm.setString(4, address);
		pstm.setString(5, phone);
		pstm.setInt(6, userId);
		
		pstm.executeUpdate();
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
	
	public static List<Product> queryallDish(Connection connection) throws SQLException {
		String sql = "SELECT * FROM products";
		PreparedStatement pstm = connection.prepareStatement(sql);
		List<Product> dishList = new ArrayList<Product>();
		
		ResultSet rs = pstm.executeQuery();
		
		while (rs.next()) {
			int dish_id = rs.getInt("dish_id");
			String name = rs.getString("name");
			int category_id = rs.getInt("category_id");
			String description = rs.getString("description");
			int price = rs.getInt("price");
			
			Product nDish = new Product(dish_id, name, description, price);
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
		String sql = "DELETE FROM products WHERE product_id = ?";
		String sql2 = "DELETE FROM favorites WHERE product_id = ?";
		String sql3 = "DELETE FROM receipts_products WHERE product_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql2);
		pstm.setInt(1, dish_id);
		pstm.executeUpdate();
		
		pstm = connection.prepareStatement(sql3);
		pstm.setInt(1, dish_id);
		pstm.executeUpdate();
		
		pstm = connection.prepareStatement(sql);
		pstm.setInt(1, dish_id);
		pstm.executeUpdate();
		
		return 1;
	}
	
	public static int removeAccount(Connection connection, int id) throws SQLException {
		String sql = "DELETE FROM users WHERE user_id = ?";
		String sql2 = "DELETE FROM favorites WHERE user_id = ?";
		String sql3 = "SELECT receipts_dishes.receipt_id \n"
				+ "FROM receipts_dishes INNER JOIN receipts \n"
				+ "ON receipts.receipt_id = receipts_dishes.receipt_id\n"
				+ "WHERE receipts.user_id = 6 ";
		
		PreparedStatement pstm = connection.prepareStatement(sql3);
		pstm.setInt(1, id);
		pstm.executeUpdate();
//		
		pstm = connection.prepareStatement(sql2);
		pstm.setInt(1, id);
		pstm.executeUpdate();
		
		pstm = connection.prepareStatement(sql);
		pstm.setInt(1, id);
		pstm.executeUpdate();
		
		return 1;
	}
	
	public static List<Receipt> getAllReceipts(Connection connection) throws SQLException {
		String sql = "SELECT * FROM receipts";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		
		List<Receipt> receipts = new ArrayList<Receipt>();
		
		while(rs.next()) {
			int receipt_id = rs.getInt("receipt_id");
			int user_id = rs.getInt("user_id");
			int status = rs.getInt("status");
			Date time = rs.getDate(4);
			int payment = rs.getInt("payment");
			int total_payment = rs.getInt("total");

			Receipt receipt = new Receipt(receipt_id, user_id, status, time, payment, total_payment);
			receipts.add(receipt);
		}
		
		return receipts;
	}
	
	public static void changeStatus(Connection connection, int id) throws SQLException {
		String sql = "UPDATE receipts\n"
				+ "SET status = 1\n"
				+ "WHERE receipt_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		pstm.setInt(1, id);
		
		pstm.executeUpdate();
	}
	
	public static int removeReceipt(Connection connection, int id) throws SQLException {
		String sql = "DELETE FROM receipts_products WHERE receipt_id = ?";
		String sql2 = "DELETE FROM receipts WHERE receipt_id = ?";
		
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setInt(1, id);
		pstm.executeUpdate();
//		
		pstm = connection.prepareStatement(sql2);
		pstm.setInt(1, id);
		pstm.executeUpdate();
		return 1;
	}
	
	public static List<User> getAllUsers(Connection connection) throws SQLException {
		String sql = "SELECT * FROM users";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		int is_admin = 0;
		List<User> users = new ArrayList<User>();
		
		while (rs.next()) {
			is_admin = rs.getInt("is_admin");
			int id = rs.getInt("user_id");
			String account = rs.getString("account");
			String userPassword = rs.getString("password");
			String email = rs.getString("email");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String phone = rs.getString("phone");
			
			if (is_admin != 0) {
				Admin admin = new Admin(id, account, userPassword, email, name, address, phone, is_admin);
				users.add(admin);
				
			} else {
				int point = rs.getInt("point");
				int membership = rs.getInt("membership");
				Customer customer = new Customer(id, account, userPassword, email, name, address, phone, is_admin, point, membership);
				users.add(customer);
			}
		}
		
		return users;
	}
	
	public static void main(String args[]) throws SQLException {
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
//		System.out.println(conn);
//		List<Dish> dishs = dbUtils.queryDish(conn);
//		for (Dish dish: dishs) {
//			System.out.println(dish.getName());
//		}
		
		List<User> products = DBUtils.getAllUsers(conn);
		
		for (User product: products) {
			System.out.println(product.getName());
		}
		
//		Product product = dbUtils.queryDish(conn, 351);
//		System.out.println(product.getName());
	}
	
}
