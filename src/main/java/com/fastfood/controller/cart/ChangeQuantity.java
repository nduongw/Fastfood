package com.fastfood.controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.fastfood.entity.Cart;
import com.fastfood.entity.Customer;

@WebServlet(urlPatterns = {"/quantity-inc-dec"})
public class ChangeQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeQuantity() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart_List = (ArrayList<Cart>)session.getAttribute("cartInfo");
		Customer customer = new Customer();
		
		customer.changeQuantity(session, id, action, cart_List);
		session.setAttribute("cartInfo", cart_List);
		
		response.sendRedirect("showCart");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
