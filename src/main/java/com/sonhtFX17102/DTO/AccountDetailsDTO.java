package com.sonhtFX17102.DTO;

public class AccountDetailsDTO {
	private int account_id;
	private String account_firstName;
	private String account_lastName;
	private String account_image;
	private String account_address;
	private String account_birthday;
	private String account_organization;
	private String account_mail;
	private String account_name;
	private String account_phone;

	public AccountDetailsDTO() {

	}

	public AccountDetailsDTO(int account_id, String account_firstName, String account_lastName, String account_image,
			String account_address, String account_birthday, String account_organization,
			String account_mail, String account_name, String account_phone) {
		super();
		this.account_id = account_id;
		this.account_firstName = account_firstName;
		this.account_lastName = account_lastName;
		this.account_image = account_image;
		this.account_address = account_address;
		this.account_birthday = account_birthday;
		this.account_organization = account_organization;
		this.account_mail = account_mail;
		this.account_name = account_name;
		this.account_phone = account_phone;
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

	@Override
	public String toString() {
		return "AccountDetailsDTO [account_id=" + account_id + ", account_firstName=" + account_firstName
				+ ", account_lastName=" + account_lastName + ", account_image=" + account_image + ", account_address="
				+ account_address + ", account_birthday=" + account_birthday + ", account_organization="
				+ account_organization + ", account_mail=" + account_mail
				+ ", account_name=" + account_name + ", account_phone=" + account_phone + "]";
	}

}
