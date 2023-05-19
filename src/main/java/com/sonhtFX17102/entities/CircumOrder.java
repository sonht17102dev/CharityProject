package com.sonhtFX17102.entities;


public class CircumOrder {
	private int circum_order_id;
	private int circum_id;
	private String circum_order_name;
	private String circum_order_mail;
	private String circum_order_phone;
	private String circum_order_bank;
	private String circum_order_bankname;
	private String circum_order_address;
	private int circum_order_amount;
	private String circum_order_date;
	private String circum_name;
	public CircumOrder() {
		super();
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
	public String getCircum_order_name() {
		return circum_order_name;
	}
	public void setCircum_order_name(String circum_order_name) {
		this.circum_order_name = circum_order_name;
	}
	public String getCircum_order_mail() {
		return circum_order_mail;
	}
	public void setCircum_order_mail(String circum_order_mail) {
		this.circum_order_mail = circum_order_mail;
	}
	public String getCircum_order_phone() {
		return circum_order_phone;
	}
	public void setCircum_order_phone(String circum_order_phone) {
		this.circum_order_phone = circum_order_phone;
	}
	public String getCircum_order_bank() {
		return circum_order_bank;
	}
	public void setCircum_order_bank(String circum_order_bank) {
		this.circum_order_bank = circum_order_bank;
	}
	public String getCircum_order_bankname() {
		return circum_order_bankname;
	}
	public void setCircum_order_bankname(String circum_order_bankname) {
		this.circum_order_bankname = circum_order_bankname;
	}
	public String getCircum_order_address() {
		return circum_order_address;
	}
	public void setCircum_order_address(String circum_order_address) {
		this.circum_order_address = circum_order_address;
	}
	public int getCircum_order_amount() {
		return circum_order_amount;
	}
	public void setCircum_order_amount(int circum_order_amount) {
		this.circum_order_amount = circum_order_amount;
	}
	public String getCircum_order_date() {
		return circum_order_date;
	}
	public void setCircum_order_date(String circum_order_date) {
		this.circum_order_date = circum_order_date;
	}
	public String getCircum_name() {
		return circum_name;
	}
	public void setCircum_name(String circum_name) {
		this.circum_name = circum_name;
	}
	@Override
	public String toString() {
		return "CircumOrder [circum_order_id=" + circum_order_id + ", circum_id=" + circum_id + ", circum_order_name="
				+ circum_order_name + ", circum_order_mail=" + circum_order_mail + ", circum_order_phone="
				+ circum_order_phone + ", circum_order_bank=" + circum_order_bank + ", circum_order_bankname="
				+ circum_order_bankname + ", circum_order_address=" + circum_order_address + ", circum_order_amount="
				+ circum_order_amount + ", circum_order_date=" + circum_order_date + ", circum_name=" + circum_name
				+ "]";
	}
	public CircumOrder(int circum_order_id, int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date, String circum_name) {
		super();
		this.circum_order_id = circum_order_id;
		this.circum_id = circum_id;
		this.circum_order_name = circum_order_name;
		this.circum_order_mail = circum_order_mail;
		this.circum_order_phone = circum_order_phone;
		this.circum_order_bank = circum_order_bank;
		this.circum_order_bankname = circum_order_bankname;
		this.circum_order_address = circum_order_address;
		this.circum_order_amount = circum_order_amount;
		this.circum_order_date = circum_order_date;
		this.circum_name = circum_name;
	}
	public CircumOrder(int circum_id, String circum_order_name, String circum_order_mail, String circum_order_phone,
			String circum_order_bank, String circum_order_bankname, String circum_order_address,
			int circum_order_amount, String circum_order_date, String circum_name) {
		super();
		this.circum_id = circum_id;
		this.circum_order_name = circum_order_name;
		this.circum_order_mail = circum_order_mail;
		this.circum_order_phone = circum_order_phone;
		this.circum_order_bank = circum_order_bank;
		this.circum_order_bankname = circum_order_bankname;
		this.circum_order_address = circum_order_address;
		this.circum_order_amount = circum_order_amount;
		this.circum_order_date = circum_order_date;
		this.circum_name = circum_name;
	}
		
}
