package com.fastfood.controller.cart;

import jakarta.servlet.RequestDispatcher;
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

@WebServlet(urlPatterns = {"/remove-from-cart"})
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveFromCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart_List = (ArrayList<Cart>)session.getAttribute("cartInfo");
		Customer customer = new Customer();
		
		customer.removeCart(cart_List, id);
		
		session.setAttribute("cartInfo", cart_List);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Cart.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
