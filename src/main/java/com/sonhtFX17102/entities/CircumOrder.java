package com.sonhtFX17102.entities;

import java.util.Date;

public class CircumOrder {
	private int circum_order_id;
	private String account_mail;
	private int circum_id;
	private Date circum_order_date;
	private String circum_order_phone;
	public CircumOrder(int circum_order_id, String account_mail, int circum_id, Date circum_order_date,
			String circum_order_phone) {
		super();
		this.circum_order_id = circum_order_id;
		this.account_mail = account_mail;
		this.circum_id = circum_id;
		this.circum_order_date = circum_order_date;
		this.circum_order_phone = circum_order_phone;
	}
	public CircumOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCircum_order_id() {
		return circum_order_id;
	}
	public void setCircum_order_id(int circum_order_id) {
		this.circum_order_id = circum_order_id;
	}
	public String getAccount_mail() {
		return account_mail;
	}
	public void setAccount_mail(String account_mail) {
		this.account_mail = account_mail;
	}
	public int getCircum_id() {
		return circum_id;
	}
	public void setCircum_id(int circum_id) {
		this.circum_id = circum_id;
	}
	public Date getCircum_order_date() {
		return circum_order_date;
	}
	public void setCircum_order_date(Date circum_order_date) {
		this.circum_order_date = circum_order_date;
	}
	public String getCircum_order_phone() {
		return circum_order_phone;
	}
	public void setCircum_order_phone(String circum_order_phone) {
		this.circum_order_phone = circum_order_phone;
	}
	
	
}
