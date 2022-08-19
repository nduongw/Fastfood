package com.fastfood.controller.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.fastfood.entity.User;

@WebServlet(urlPatterns = {"/show-info"})
public class ShowInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User cUser = (User)session.getAttribute("userAcc");
		
		
		request.setAttribute("currentUser", cUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/ShowInfo.jsp");
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
