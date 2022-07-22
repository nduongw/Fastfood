package com.fastfood.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Dish;
import com.fastfood.entity.Category;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/list"})
public class DishList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DishList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		
		try {
			List<Dish> result = DBUtils.queryallDish(dbcon);
			List<Category> cateList = DBUtils.queryallCategory(dbcon);
			if (result == null || cateList == null) {
				System.out.println("Cant show");
			} else {
//				System.out.println("Done");
                String destPage = "WEB-INF/views/DishList.jsp";
                request.setAttribute("ListD", result);
                request.setAttribute("ListC", cateList);
                RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
                dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/DishList.jsp");
		
		dispatcher.forward(request, response);
	}

}