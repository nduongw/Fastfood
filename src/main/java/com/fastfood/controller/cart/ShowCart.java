package com.fastfood.controller.cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Cart;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/showCart"})
public class ShowCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart_List = (ArrayList<Cart>)session.getAttribute("cartInfo");
		
		List<Cart> products = null;
		
		try {
			products = DBUtils.getAllCart(conn, cart_List);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int totalPrice = 0;
		
		for (Cart cart: products) {
			totalPrice += cart.getPrice();
		}
		
		request.setAttribute("cartInfo", products);
		request.setAttribute("totalPrice", totalPrice);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Cart.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
