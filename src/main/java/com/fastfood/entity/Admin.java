package com.fastfood.entity;

public class Admin extends User implements Greeting{
	private int access;

	public int getAccess() {
		return access;
	}

	public void setAccess(int access) {
		this.access = access;
	}

	public Admin(int access) {
		super();
		this.access = access;
	}
	
	@Override
	public String greeting() {
		return (String) "Hello" + this.getName() + "Access level: " + this.getAccess();
	}
}
