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
import com.fastfood.entity.Product;
import com.fastfood.entity.Receipt;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/checkoutProduct"})
public class CheckOutProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckOutProduct() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		
		int quantity = 1;
		int id = Integer.parseInt(request.getParameter("id"));
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.println(id);
//		System.out.println(quantity);
		User cUser = (User) session.getAttribute("userAcc");
		Product dish = new Product();
		
		try {
			dish = DBUtils.queryDish(conn, id);
			System.out.println(dish.getName());
			System.out.println(dish.getPrice());
			System.out.println(dish.getId());
		} catch (NumberFormatException | SQLException e1) {
			e1.printStackTrace();
		}
		
		int totalPrice = quantity * dish.getPrice();
		List<Cart> products = new ArrayList<Cart>();
		Cart cart = new Cart();
		
		cart.setId(id);
		cart.setPrice(dish.getPrice());
		cart.setQuantity(quantity);
		cart.setName(dish.getName());
		cart.setDescription(dish.getDescription());
		
		System.out.println(cart.getId());
		
		products.add(cart);
		
		for (@SuppressWarnings("unused") Cart cart2: products) {
			System.out.println(cart.getId());
		}
		
		Receipt receipt = new Receipt();
		
		receipt.setId(cUser.getUser_id());
		receipt.setPayment(1);
		receipt.setTotal(totalPrice);
		receipt.setStatus(1);
		receipt.setProducts(products);
		
		System.out.println("---------------------");
		
		try {
			DBUtils.addReceipt(conn, receipt, cUser.getUser_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Home.jsp");
//        dispatcher.forward(request, response);
		
		session.removeAttribute("detail");
		response.sendRedirect("displayDish");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
