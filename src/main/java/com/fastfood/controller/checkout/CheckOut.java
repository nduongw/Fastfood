package com.fastfood.controller.checkout;

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
import java.util.List;

import com.fastfood.entity.Cart;
import com.fastfood.entity.Receipt;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/checkout"})
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckOut() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		User cUser = (User)session.getAttribute("userAcc");
		
		if (cUser == null) {
			String direction = "WEB-INF/views/login.jsp";
			request.getRequestDispatcher(direction).forward(request, response);
		} else {
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
			
			Receipt receipt = new Receipt();
			
			receipt.setUser_id(cUser.getUser_id());
			receipt.setPayment(1);
			receipt.setTotal(totalPrice);
			receipt.setStatus(1);
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
