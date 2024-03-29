package com.fastfood.controller.home;

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
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Cart;
import com.fastfood.entity.Category;
import com.fastfood.entity.Dish;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/low-high"})
public class DisplayDishLow2High extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DisplayDishLow2High() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		
		int cartSize = 0;
		
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart_List = (ArrayList<Cart>)session.getAttribute("cartInfo");
		List<Dish> dishList = null;
		List<Category> categories = null;
		
		if (cart_List != null) {
			cartSize = cart_List.size();
		}
		
		
		try {
			dishList = DBUtils.queryDishLow2High(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			categories = DBUtils.getAllCategories(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		cartSize = 4;
		System.out.println("Cart size: " + cartSize);
		
		request.setAttribute("dishL", dishList);
		request.setAttribute("category", categories);
		request.setAttribute("cartQuantity", String.valueOf(cartSize));
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Home.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
