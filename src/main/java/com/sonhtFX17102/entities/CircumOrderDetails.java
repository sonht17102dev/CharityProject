package com.sonhtFX17102.entities;

public class CircumOrderDetails {
	private int circum_order_id;
	private int circum_id;
	private long donated_money;

	public CircumOrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CircumOrderDetails(int circum_order_id, int circum_id, long donated_money) {
		super();
		this.circum_order_id = circum_order_id;
		this.circum_id = circum_id;
		this.donated_money = donated_money;
	}

	public int getCircum_order_id() {
		return circum_order_id;
	}

	public void setCircum_order_id(int circum_order_id) {
		this.circum_order_id = circum_order_id;
	}

	public int getCircum_id() {
		return circum_id;
	}

	public void setCircum_id(int circum_id) {
		this.circum_id = circum_id;
	}

	public long getDonated_money() {
		return donated_money;
	}

	public void setDonated_money(long donated_money) {
		this.donated_money = donated_money;
	}

}
