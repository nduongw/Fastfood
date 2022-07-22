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

import com.fastfood.entity.Dish;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/detail"})
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Detail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		Dish dish = new Dish();
		Connection dbcon = ConnectDatabase.getJDBCConnection();
		HttpSession session = request.getSession();
		
		try {
			dish = DBUtils.queryDish(dbcon, pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("detailDish", dish);
		session.setAttribute("detail", dish);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Detail.jsp");
        dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
