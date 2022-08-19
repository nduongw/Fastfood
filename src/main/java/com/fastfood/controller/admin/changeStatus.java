package com.fastfood.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.fastfood.entity.Admin;
import com.fastfood.model.ConnectDatabase;

@WebServlet(urlPatterns = {"/change-status"})
public class changeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public changeStatus() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		
		Admin admin = new Admin();
		
		try {
			admin.changeStatus(dbcon, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("manage-receipts");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}