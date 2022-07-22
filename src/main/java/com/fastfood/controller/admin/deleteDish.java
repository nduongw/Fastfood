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

@WebServlet(urlPatterns = {"/delete"})
public class deleteDish extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public deleteDish() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();

		try {
			int result = DBUtils.deleteDish(dbcon, id);
			if (result == 0) {
				System.out.println("Cant delete");
			} else {
				System.out.println("Delete successfully");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("displayDish");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}