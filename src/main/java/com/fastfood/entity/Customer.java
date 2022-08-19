package com.fastfood.entity;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fastfood.utils.DBUtils;

import jakarta.servlet.http.HttpSession;

public class Customer extends User{
	private int point;
	private int membership;
	private List<Product> myFavorites;
	private List<Receipt> receipts;
	
	public List<Receipt> getReceipts() {
		return receipts;
	}

	public void setReceipts(List<Receipt> receipts) {
		this.receipts = receipts;
	}

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

	public Customer(int user_id) {
		super(user_id);
		// TODO Auto-generated constructor stub
	}

	public Customer(int point, int membership) {
		super();
		this.point = point;
		this.membership = membership;
	}
	
	public Customer() {
		super();
	}
	

	public Customer(int user_id, String account, String password, String email, String name, String address,
			String phone, int is_admin) {
		super(user_id, account, password, email, name, address, phone, is_admin);
		// TODO Auto-generated constructor stub
	}

	public Customer(String account, String email, String name, String address, String phone) {
		super(account, email, name, address, phone);
		// TODO Auto-generated constructor stub
	}

	public Customer(int point, int membership, List<Product> myFavorites, List<Receipt> receipts) {
		super();
		this.point = point;
		this.membership = membership;
		this.myFavorites = myFavorites;
		this.receipts = receipts;
	}

	public Customer(int user_id, String account, String password, String email, String name, String address,
			Date birthday_date, String phone) {
		super(user_id, account, password, email, name, address, birthday_date, phone);
		// TODO Auto-generated constructor stub
	}

	public Customer(int user_id, String account, String email, String name, String address, String phone, int is_admin,
			int total_spent) {
		super(user_id, account, email, name, address, phone, is_admin, total_spent);
		// TODO Auto-generated constructor stub
	}

	public Customer(int user_id, String account, String password, String email, String name, String address,
			String phone, int is_admin, int point, int membership) {
		super(user_id, account, password, email, name, address, phone, is_admin);
		this.point = point;
		this.membership = membership;
	}

	public List<Product> getMyFavorites() {
		return myFavorites;
	}

	public void setMyFavorites(List<Product> myFavorites) {
		this.myFavorites = myFavorites;
	}
	
	public void likeProduct(Connection connection, int id, User cUser) {
		try {	
			this.myFavorites = DBUtils.getFavourites(connection, cUser.getUser_id());
			
			if(this.myFavorites.size() == 0) {
				DBUtils.addFavourite(connection, cUser.getUser_id(), id);
			}
			
			for (Product f : this.myFavorites) {
				if (f.getId() != id) {
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
				if (c.getId() == id) {
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
			if(cart.getId() == id) {
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
			if (cart.getId() == id) {
				cart_List.remove(cart);
				System.out.println("Removed cart " + cart.getId() + "successful");
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
	
	public List<Product> search(List<Category> categories, Connection conn, String txtSearch) {
		List<Product> dishList = null;
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
		
		return dishList;
	}

	@Override
	public void viewDetail() {
		System.out.println("Your membership level" + this.membership);
	}
}
