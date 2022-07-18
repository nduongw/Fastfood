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
import com.fastfood.entity.Dish;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/search"})
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Search() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtSearch = request.getParameter("txt");
		
		Connection conn = ConnectDatabase.getJDBCConnection();
		List<Dish> dishList = null;
		List<Category> categories = null;
		
		try {
			dishList = DBUtils.searchByName(conn, txtSearch);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Home.jsp");
        dispatcher.forward(request, response);
        
        for (Dish obj : dishList) {
			System.out.println(obj.getName());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
