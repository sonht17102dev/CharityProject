package com.sonhtFX17102.entities;

public class AccountDetails {
	private int account_id;
	private String account_firstName;
	private String account_lastName;
	private String account_image;
	private String account_address;
	private String account_birthday;
	private String account_organization;
	private long total_donated;
	public AccountDetails(int account_id, String account_firstName, String account_lastName, String account_image,
			String account_address, String account_birthday, String account_organization, long total_donated) {
		super();
		this.account_id = account_id;
		this.account_firstName = account_firstName;
		this.account_lastName = account_lastName;
		this.account_image = account_image;
		this.account_address = account_address;
		this.account_birthday = account_birthday;
		this.account_organization = account_organization;
		this.total_donated = total_donated;
	}
	
	public AccountDetails() {
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public String getAccount_firstName() {
		return account_firstName;
	}

	public void setAccount_firstName(String account_firstName) {
		this.account_firstName = account_firstName;
	}

	public String getAccount_lastName() {
		return account_lastName;
	}

	public void setAccount_lastName(String account_lastName) {
		this.account_lastName = account_lastName;
	}

	public String getAccount_image() {
		return account_image;
	}

	public void setAccount_image(String account_image) {
		this.account_image = account_image;
	}

	public String getAccount_address() {
		return account_address;
	}

	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}

	public String getAccount_birthday() {
		return account_birthday;
	}

	public void setAccount_birthday(String account_birthday) {
		this.account_birthday = account_birthday;
	}

	public String getAccount_organization() {
		return account_organization;
	}

	public void setAccount_organization(String account_organization) {
		this.account_organization = account_organization;
	}

	public long getTotal_donated() {
		return total_donated;
	}

	public void setTotal_donated(long total_donated) {
		this.total_donated = total_donated;
	}

	@Override
	public String toString() {
		return "AccountDetails [account_id=" + account_id + ", account_firstName=" + account_firstName
				+ ", account_lastName=" + account_lastName + ", account_image=" + account_image + ", account_address="
				+ account_address + ", account_birthday=" + account_birthday + ", account_organization="
				+ account_organization + ", total_donated=" + total_donated + "]";
	}
	
}
