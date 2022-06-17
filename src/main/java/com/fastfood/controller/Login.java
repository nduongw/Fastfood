package com.fastfood.controller;

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

import org.apache.catalina.realm.UserDatabaseRealm;
import org.apache.jasper.tagplugins.jstl.core.If;

import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("email");
		String passwordString = request.getParameter("password");

		System.out.println("Login" + userName);
		System.out.println("Login" + passwordString);
		
		DBUtils utils = new DBUtils();
		
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		
		try {
			User cUser = DBUtils.findUser(dbcon, userName, passwordString);
			String destPage = "WEB-INF/views/login.jsp";
			
			if (cUser == null) {
				String message = "Cant found user email";
                request.setAttribute("message", message);
			} else {
				String message = "Hello dungbui";
                request.setAttribute("message", message);
                
                HttpSession session = request.getSession();
                session.setAttribute("user", cUser);
                
                	destPage = "WEB-INF/views/user_index.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
            
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
