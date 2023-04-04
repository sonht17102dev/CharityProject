package com.sonhtFX17102.entities;

public class Partner {
	private int partner_id;
	private String partner_name;
	private String partner_slogan;
	private String partner_logo;
	private String partner_banner;
	private String partner_introduce;
	private int partner_number_donate;
	private long partner_total_money;
	private String partner_content;
	public Partner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Partner(int partner_id, String partner_name, String partner_slogan, String partner_logo,
			String partner_banner, String partner_introduce, int partner_number_donate, long partner_total_money,
			String partner_content) {
		super();
		this.partner_id = partner_id;
		this.partner_name = partner_name;
		this.partner_slogan = partner_slogan;
		this.partner_logo = partner_logo;
		this.partner_banner = partner_banner;
		this.partner_introduce = partner_introduce;
		this.partner_number_donate = partner_number_donate;
		this.partner_total_money = partner_total_money;
		this.partner_content = partner_content;
	}
	public int getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(int partner_id) {
		this.partner_id = partner_id;
	}
	public String getPartner_name() {
		return partner_name;
	}
	public void setPartner_name(String partner_name) {
		this.partner_name = partner_name;
	}
	public String getPartner_slogan() {
		return partner_slogan;
	}
	public void setPartner_slogan(String partner_slogan) {
		this.partner_slogan = partner_slogan;
	}
	public String getPartner_logo() {
		return partner_logo;
	}
	public void setPartner_logo(String partner_logo) {
		this.partner_logo = partner_logo;
	}
	public String getPartner_banner() {
		return partner_banner;
	}
	public void setPartner_banner(String partner_banner) {
		this.partner_banner = partner_banner;
	}
	public String getPartner_introduce() {
		return partner_introduce;
	}
	public void setPartner_introduce(String partner_introduce) {
		this.partner_introduce = partner_introduce;
	}
	public int getPartner_number_donate() {
		return partner_number_donate;
	}
	public void setPartner_number_donate(int partner_number_donate) {
		this.partner_number_donate = partner_number_donate;
	}
	public long getPartner_total_money() {
		return partner_total_money;
	}
	public void setPartner_total_money(long partner_total_money) {
		this.partner_total_money = partner_total_money;
	}
	public String getPartner_content() {
		return partner_content;
	}
	public void setPartner_content(String partner_content) {
		this.partner_content = partner_content;
	}
	
	
}
