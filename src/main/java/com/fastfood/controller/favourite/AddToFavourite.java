package com.fastfood.controller.favourite;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.fastfood.entity.Dish;
import com.fastfood.entity.Favourite;
import com.fastfood.entity.User;
import com.fastfood.model.ConnectDatabase;
import com.fastfood.utils.DBUtils;

@WebServlet(urlPatterns = {"/add-to-favourite"})
public class AddToFavourite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToFavourite() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Connection dbcon = ConnectDatabase.getJDBCConnection();
		List<Dish> myFavourites = null;
		
		User cUser = (User)session.getAttribute("userAcc");
		
		if (cUser == null) {
			String direction = "WEB-INF/views/login.jsp";
			request.getRequestDispatcher(direction).forward(request, response);
		} else {
			try {	
				myFavourites = DBUtils.getFavourites(dbcon, cUser.getUser_id());
				for (Dish f : myFavourites) {
					if (f.getDish_id() != id) {
						DBUtils.addFavourite(dbcon, cUser.getUser_id(), id);						
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("displayDish");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
