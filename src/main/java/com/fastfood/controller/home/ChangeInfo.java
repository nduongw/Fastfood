package com.fastfood.controller.home;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.fastfood.entity.User;

@WebServlet(urlPatterns = {"/changeInfo"})
public class ChangeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User loginedUser = (User)session.getAttribute("userAcc");		
		
		session.setAttribute("loginedUser", loginedUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/changeUserInfo.jsp");
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
