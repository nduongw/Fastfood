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

@WebServlet(urlPatterns = {"/add-to-cart"})
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ArrayList<Cart>cartList = new ArrayList<Cart>();
		
		Cart cart = new Cart();
		cart.setDish_id(id);
		cart.setQuantity(1);
		
		
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart_List = (ArrayList<Cart>)session.getAttribute("cartInfo");
		
		if (cart_List == null) {
			cartList.add(cart);
			session.setAttribute("cartInfo", cartList);

		} else {
			cartList = cart_List;
			Boolean exist = false;
			
			for (Cart c: cartList) {
				if (c.getDish_id() == id) {
					exist = true;
					break;
				} 
			}
			
			if (!exist) {
				cart.setQuantity(cart.getQuantity() + 1);
				cartList.add(cart);
				session.setAttribute("cartInfo", cartList);
			}
			
		}

		response.sendRedirect("displayDish");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
