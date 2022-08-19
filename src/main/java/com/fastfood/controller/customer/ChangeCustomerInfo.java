package com.fastfood.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.entity.Customer;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/change-cinfo"})
public class ChangeCustomerInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeCustomerInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(name);
		System.out.println(address);
		System.out.println(phone);
		
		Customer newUser = new Customer(username, email, name, address, phone);
		
		HttpSession session = request.getSession();
		Connection dbcon = ConnectDatabase.getJDBCConnection();
		Customer cUser = (Customer)session.getAttribute("userAcc");
		
		try {
			DBUtils.changeCustomerInfo(dbcon, username, email, name, address, phone, cUser.getUser_id());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		session.removeAttribute("userAcc");		
		session.setAttribute("userAcc", newUser);
		response.sendRedirect("showDish");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
