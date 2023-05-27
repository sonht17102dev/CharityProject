package com.sonhtFX17102.entities;

public class Account {
	private int account_id;
	private String account_role;
	private String account_mail;
	private String account_name;
	private String account_phone;
	private String account_password;
	private String account_status;
	private int enabled;
	
	public Account() {
		super();
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public String getAccount_role() {
		return account_role;
	}

	public void setAccount_role(String account_role) {
		this.account_role = account_role;
	}

	public String getAccount_mail() {
		return account_mail;
	}

	public void setAccount_mail(String account_mail) {
		this.account_mail = account_mail;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getAccount_phone() {
		return account_phone;
	}

	public void setAccount_phone(String account_phone) {
		this.account_phone = account_phone;
	}

	public String getAccount_password() {
		return account_password;
	}

	public void setAccount_password(String account_password) {
		this.account_password = account_password;
	}

	public String getAccount_status() {
		return account_status;
	}

	public void setAccount_status(String account_status) {
		this.account_status = account_status;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public Account(int account_id, String account_role, String account_mail, String account_name, String account_phone,
			String account_password, String account_status, int enabled) {
		super();
		this.account_id = account_id;
		this.account_role = account_role;
		this.account_mail = account_mail;
		this.account_name = account_name;
		this.account_phone = account_phone;
		this.account_password = account_password;
		this.account_status = account_status;
		this.enabled = enabled;
	}

	public Account(String account_role, String account_mail, String account_name, String account_phone,
			String account_password, String account_status, int enabled) {
		super();
		this.account_role = account_role;
		this.account_mail = account_mail;
		this.account_name = account_name;
		this.account_phone = account_phone;
		this.account_password = account_password;
		this.account_status = account_status;
		this.enabled = enabled;
	}
	
}
