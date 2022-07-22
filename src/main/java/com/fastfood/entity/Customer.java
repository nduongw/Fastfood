package com.fastfood.entity;

public class Customer extends User implements Greeting{
	private int point;
	private int membership;
	
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
	
}
