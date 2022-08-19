package com.fastfood.utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.IDebugRequestor;
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
			accUser.setIs_admin(rs.getInt("is_admin"));

			return accUser;
		}
		
		return null;
	}
	
	public static Customer findUser(Connection connection, int userId) throws SQLException {
		String sql = "SELECT * FROM `users`"
				+ "WHERE user_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setInt(1, userId);
		
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			Customer accUser = new Customer();
			accUser.setAccount(rs.getString("username"));
			accUser.setPassword(rs.getString("password"));
			accUser.setName(rs.getString("name"));
			accUser.setAddress(rs.getString("address"));
			accUser.setEmail(rs.getString("email"));
			accUser.setPhone(rs.getString("phone"));
			accUser.setUser_id(rs.getInt("user_id"));
//			accUser.setPoint(rs.getIn);
//			accUser.setMembership(0);
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
	
	public static void changePasswordUser(Connection connection, String password, int userId) throws SQLException {
		String sql = "UPDATE users\n"
				+ "SET password = ?\n"
				+ "WHERE user_id = ?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		
		pstm.setString(1, password);
		pstm.setInt(2, userId);
		
		pstm.executeUpdate();
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
	
	public static List<Dish> getFavourites(Connection connection, int userId) throws SQLException {
		String query = "SELECT * FROM dishes \n"
				+ "INNER JOIN favorites \n"
				+ "WHERE dishes.dish_id = favorites.dish_id\n"
				+ "AND user_id = ?";
		
		List<Dish> myFavourites = new ArrayList<Dish>();
		
		PreparedStatement pstm = connection.prepareStatement(query);
		pstm.setInt(1, userId);
		ResultSet rs = pstm.executeQuery();
		
		while(rs.next()) {
			Dish favourite = new Dish();
			favourite.setDish_id(rs.getInt("dish_id"));
			favourite.setName(rs.getString("name"));
			favourite.setImage(rs.getString("image"));
			
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
	
	public static List<Dish> queryallDish(Connection connection) throws SQLException {
		String sql = "SELECT * FROM dishes";
		PreparedStatement pstm = connection.prepareStatement(sql);
		List<Dish> dishList = new ArrayList<Dish>();
		
		ResultSet rs = pstm.executeQuery();
		
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
		String sql = "DELETE FROM dishes WHERE dish_id = ?";
		String sql2 = "DELETE FROM favorites WHERE dish_id = ?";
		String sql3 = "DELETE FROM receipts_dishes WHERE dish_id = ?";
		
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
	
	public static List<User> getAllUsers(Connection connection) throws SQLException {
		String sql = "SELECT * FROM users";
		
		PreparedStatement pstm = connection.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<User> userList = new ArrayList<User>();

		while (rs.next()) {
			int id = rs.getInt("user_id");
			String account = rs.getString("account");
			String email = rs.getString("email");
			int point = rs.getInt("point");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			int membership = rs.getInt("membership");
			int admin = rs.getInt("is_admin");

			User user = new User(id, account, email, name, address, phone, admin, point);
			userList.add(user);
		}

		return userList;
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
			int total_payment = rs.getInt("total_payment");

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
		String sql = "DELETE FROM receipts_dishes WHERE receipt_id = ?";
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
//		System.out.println(conn);
//		List<Dish> dishs = dbUtils.queryDish(conn);
//		for (Dish dish: dishs) {
//			System.out.println(dish.getName());
//		}
		
		System.out.println(conn);
		List<User> users = dbUtils.getAllUsers(conn);
		for (User user: users) {
			System.out.println(user.getName());
		}
	}
	
}
