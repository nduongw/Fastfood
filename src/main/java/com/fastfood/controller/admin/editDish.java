package com.fastfood.controller.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;
import com.fastfood.entity.Admin;
import com.fastfood.entity.Dish;
import com.fastfood.entity.Product;


@WebServlet(urlPatterns = {"/edit"})
public class editDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int id;

    public editDish() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		Product result = null;
		Admin admin = new Admin();
		admin.editDish(dbcon, id, result);
		
		request.setAttribute("info", result);
        String destPage = "WEB-INF/views/editDish.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));

		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();

		try {
			int result = DBUtils.editDish(dbcon, id, name, category_id, description, price);
			if (result == 0) {
				String message = "Cant edit";
                request.setAttribute("message", message);
			} else {
				String message = "Editted successfully";
                request.setAttribute("message", message);                
                response.sendRedirect("displayDish"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}