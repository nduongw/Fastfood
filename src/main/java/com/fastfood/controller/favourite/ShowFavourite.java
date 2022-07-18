package com.fastfood.controller.favourite;

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
import java.util.ArrayList;
import java.util.List;

import com.fastfood.entity.Favourite;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/show-favourite"})
public class ShowFavourite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ShowFavourite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		User cUser = (User)session.getAttribute("userAcc");
		List<Favourite> myFavourites = new ArrayList<Favourite>();
		
		if (cUser == null) {
			String direction = "WEB-INF/views/login.jsp";
			request.getRequestDispatcher(direction).forward(request, response);
		} else {
			Connection dbcon = ConnectDatabase.getJDBCConnection();
			try {
				myFavourites = DBUtils.getFavourites(dbcon, cUser.getUser_id());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("favourites", myFavourites);
		request.setAttribute("user", cUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/Favourite.jsp");
        dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
