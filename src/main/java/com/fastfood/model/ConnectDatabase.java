package com.fastfood.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
	public static Connection getJDBCConnection() {

		String urlString = "jdbc:mysql://localhost:3306/fastfood";
		String userName = "root";
		String password = "hs123478";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			return DriverManager.getConnection(urlString, userName, password);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public static void main(String args[]) {
		ConnectDatabase connection = new ConnectDatabase();
		Connection conn = connection.getJDBCConnection();
		System.out.println(conn);
		if (connection == null) {
			System.out.println("Cant connect to db");
		} else {
			System.out.println("Connected");
			System.out.println(connection);
		}
	}
}
