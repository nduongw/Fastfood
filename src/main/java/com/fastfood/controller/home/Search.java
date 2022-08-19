package com.fastfood.controller.home;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.fastfood.entity.Category;
import com.fastfood.entity.Customer;
import com.fastfood.entity.Product;
import com.fastfood.model.ConnectDatabase;

@WebServlet(urlPatterns = {"/search"})
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Search() {
        super();
    }
    
	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtSearch = request.getParameter("txt");
		
		Connection conn = ConnectDatabase.getJDBCConnection();
		List<Product> dishList = null;
		List<Category> categories = null;
		
		Customer customer = new Customer();
		
		dishList = customer.search(categories, conn, txtSearch);
		
		request.setAttribute("dishL", dishList);
		request.setAttribute("category", categories);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Home.jsp");
        dispatcher.forward(request, response);
        
        if (dishList == null) {
        	System.out.println("Nullll");
        }
        
        for (Product obj : dishList) {
			System.out.println(obj.getName());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
