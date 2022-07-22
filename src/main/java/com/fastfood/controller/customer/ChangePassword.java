package com.fastfood.controller.customer;

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

import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/change-password"})
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangePassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/ChangePassword.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		System.out.println(oldPassword);
		System.out.println(newPassword);
		System.out.println(confirmPassword);
		
		HttpSession session = request.getSession();
		Connection dbcon = ConnectDatabase.getJDBCConnection();
		User cUser = (User)session.getAttribute("userAcc");
		
		
		if (newPassword.compareTo(confirmPassword) == 1) {
			System.out.println("Password did not similar");
		} else {
			try {
				DBUtils.changePasswordUser(dbcon, confirmPassword, cUser.getUser_id());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/ChangeSuccessfully.jsp");
	        dispatcher.forward(request, response);
		}
		
		
	}

}
