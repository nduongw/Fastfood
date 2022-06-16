package com.fastfood.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.entity.User;
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
		
		DBUtils utils = new DBUtils();
		
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		
		try {
			int result = DBUtils.addDish(dbcon, name, category, description, price);
			if (result == 0) {
				String message = "Cant add";
                request.setAttribute("message", message);
			} else {
				String message = "Added successfully";
                request.setAttribute("message", message);
                String destPage = "WEB-INF/views/index.jsp";
                
                RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
                dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
