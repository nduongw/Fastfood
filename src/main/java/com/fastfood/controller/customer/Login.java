package com.fastfood.controller.customer;

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
import com.fastfood.entity.Customer;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String image = "WEB-INF/views/img/meals/meal-8.jpg";
		request.setAttribute("image", image);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("email");
		String passwordString = request.getParameter("password");		
		
		String destPage = "WEB-INF/views/login.jsp";
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		
		int checkAdmin = 0;
		try {
			checkAdmin = DBUtils.checkAdmin(dbcon, userName, passwordString);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (checkAdmin == 1) {
			Admin admin = new Admin();
			
			int check = admin.login(dbcon, userName, passwordString, request, response);
			
			if (check == 0) {
				request.getRequestDispatcher(destPage).forward(request, response);
			} else {
				request.getRequestDispatcher("/displayDish").forward(request, response);			
			}
		} else {
			Customer customer = new Customer();
			
			int check = customer.login(dbcon, userName, passwordString, request, response);
			
			if (check == 0) {
				request.getRequestDispatcher(destPage).forward(request, response);
			} else {
				request.getRequestDispatcher("/displayDish").forward(request, response);			
			}
		}
		
		
		
		
	}

}
