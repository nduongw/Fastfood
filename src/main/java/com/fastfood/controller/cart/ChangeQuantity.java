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
		
		for (Cart cart: cart_List) {
			if(cart.getDish_id() == id) {
				if (action.equals("dec")) {
					cart.setQuantity(cart.getQuantity() - 1);
				} else if (action.equals("inc")) {
					cart.setQuantity(cart.getQuantity() + 1);
				} else {
					System.out.println("Invalid action");
				}
			}
		}
		
		session.setAttribute("cartInfo", cart_List);
		response.sendRedirect("showCart");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
