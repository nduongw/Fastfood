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

import com.fastfood.entity.Admin;
import com.fastfood.entity.Customer;
import com.fastfood.model.ConnectDatabase;

@WebServlet(urlPatterns = {"/edit-account"})
public class editAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public editAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		Customer result = null;
		Admin admin = new Admin();
		try {
			admin.editAccount(dbcon, id, result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("info", result);
        String destPage = "WEB-INF/views/editDish.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
