package com.fastfood.controller.customer;

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

import com.fastfood.entity.Customer;
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
		String image = "WEB-INF/views/img/meals/meal-8.jpg";
		request.setAttribute("image", image);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("email");
		String passwordString = request.getParameter("password");		
		
		DBUtils utils = new DBUtils();
		
		ConnectDatabase con = new ConnectDatabase();
		Connection dbcon = con.getJDBCConnection();
		
		try {
			Customer cUser = DBUtils.findUser(dbcon, userName, passwordString);
			String destPage = "WEB-INF/views/login.jsp";
			
			if (cUser == null) {
				String message = "Cant found user email";
                request.setAttribute("message", message);
//                request.setAttribute("image", image);               
                request.getRequestDispatcher(destPage).forward(request, response);
			} else {
                request.getSession().setAttribute("userAcc", cUser);
                System.out.println("Login: " + userName);
        		System.out.println("Login: " +passwordString);
        		System.out.println(cUser.getName());
        		request.getRequestDispatcher("/displayDish").forward(request, response);
			}
			
            
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
