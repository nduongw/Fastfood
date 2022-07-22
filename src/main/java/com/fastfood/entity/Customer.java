package com.fastfood.entity;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fastfood.utils.DBUtils;

import jakarta.servlet.http.HttpSession;

public class Customer extends User implements Greeting{
	private int point;
	private int membership;
	private List<Dish> myFavorites;
	
	public int getPoint() {
		return point;
	}
	
	public void setPoint(int point) {
		this.point = point;
	}
	
	public int getMembership() {
		return membership;
	}
	
	public void setMembership(int membership) {
		this.membership = membership;
	}

	public Customer(int point, int membership) {
		super();
		this.point = point;
		this.membership = membership;
	}
	
	public Customer() {
		super();
	}

	@Override
	public String greeting() {
		return (String) "Hello" + this.getName() + "- Membership: " + this.getMembership();
	}

	public List<Dish> getMyFavorites() {
		return myFavorites;
	}

	public void setMyFavorites(List<Dish> myFavorites) {
		this.myFavorites = myFavorites;
	}
	
	public void likeProduct(Connection connection, int id, User cUser) {
		try {	
			this.myFavorites = DBUtils.getFavourites(connection, cUser.getUser_id());
			for (Dish f : this.myFavorites) {
				if (f.getDish_id() != id) {
					DBUtils.addFavourite(connection, cUser.getUser_id(), id);						
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void removeProduct(Connection connection, int id, User cUser) {
		try {
			DBUtils.removeFavourite(connection, cUser.getUser_id(), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void addToCart(ArrayList<Cart> cartList, HttpSession session, Cart cart, int id, ArrayList<Cart> cart_List) {
		if (cart_List == null) {
			cartList.add(cart);
			session.setAttribute("cartInfo", cartList);

		} else {
			cartList = cart_List;
			Boolean exist = false;
			
			for (Cart c: cartList) {
				if (c.getDish_id() == id) {
					exist = true;
					break;
				} 
			}
			
			if (!exist) {
//				cart.setQuantity(cart.getQuantity() + 1);
				cartList.add(cart);
				session.setAttribute("cartInfo", cartList);
			}
			
		}
	}
	
	public void changeQuantity(HttpSession session, int id, String action, ArrayList<Cart> cart_List) {
		
		
		for (Cart cart: cart_List) {
			if(cart.getDish_id() == id) {
				if (action.equals("dec")) {
					cart.setQuantity(cart.getQuantity() - 1);
				} else if (action.equals("inc")) {
					cart.setQuantity(cart.getQuantity() + 1);
				} else {
					System.out.println("Invalid action");
				}
			}
		}
	}
	
	public void removeCart(ArrayList<Cart> cart_List, int id) {
		for (Cart cart: cart_List) {
			if (cart.getDish_id() == id) {
				cart_List.remove(cart);
				System.out.println("Removed cart " + cart.getDish_id() + "successful");
				break;
			}
		}
	}
	
	public int checkout(List<Cart> products, Connection conn, ArrayList<Cart> cart_List) {
		try {
			products = DBUtils.getAllCart(conn, cart_List);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int totalPrice = 0;
		
		for (Cart cart: products) {
			totalPrice += cart.getPrice();
			System.out.println(cart.getName());
			System.out.println(cart.getQuantity());
			System.out.println("-----------------------");
		}
		
		return totalPrice;
	}
	
	public void search(List<Dish> dishList, List<Category> categories, Connection conn, String txtSearch) {
		try {
			dishList = DBUtils.searchByName(conn, txtSearch);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			categories = DBUtils.getAllCategories(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
