package com.fastfood.controller.home;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.fastfood.entity.Category;
import com.fastfood.entity.Product;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/cate"})
public class CategoryControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CategoryControl() {
        super();    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getContentType();
		String categoryId = request.getParameter("cid");
		System.out.println(categoryId);
		Connection conn = ConnectDatabase.getJDBCConnection();
		List<Product> dishList = null;
		List<Category> categories = null;
		
		try {
			dishList = DBUtils.queryDish(conn, categoryId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			categories = DBUtils.getAllCategories(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("dishL", dishList);
		request.setAttribute("category", categories);
		request.setAttribute("tag", categoryId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Home.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
