package com.fastfood.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.entity.Admin;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/add"})
public class addDish extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addDish() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/addDish.jsp");

		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		
		System.out.println(name);
		System.out.println(category);
		System.out.println(description);
		System.out.println(price);
		
		
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();

		Admin admin = new Admin();
		
		admin.addDish(dbcon, name, category, description, price);

		response.sendRedirect("displayDish");
	}

}