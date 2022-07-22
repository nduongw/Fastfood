package com.fastfood.controller.favourite;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fastfood.entity.Cart;
import com.fastfood.entity.Customer;
import com.fastfood.entity.Favourite;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/remove-from-favourite"})
public class RemoveFavourite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoveFavourite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Connection dbcon = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		User cUser = (User)session.getAttribute("userAcc");
		Customer customer = new Customer();
		
		customer.removeProduct(dbcon, id, cUser);
		
		response.sendRedirect("show-favourite");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
