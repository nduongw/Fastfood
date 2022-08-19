package com.fastfood.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;
import com.mysql.cj.xdevapi.DatabaseObject.DbObjectType;

@WebServlet(urlPatterns = {"/manage-account"})
public class manageAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public manageAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		
		List<User> users = null;
		
		try {
			users = DBUtils.getAllUsers(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int totalIncome = 0;
		
		for (User user: users) {
			totalIncome += user.getTotal_spent();
		}
		
		request.setAttribute("usersInfo", users);
		request.setAttribute("totalIncome", totalIncome * 100000);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/ManageAccount.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
