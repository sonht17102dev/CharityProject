package com.sonhtFX17102.DTO;

public class PartnerDTO {
	private int partner_id;
	private String partner_name;
	private String partner_logo;
	private String partner_slogan;

	public PartnerDTO() {

	}

	public PartnerDTO(int partner_id, String partner_name, String partner_logo, String partner_slogan) {
		super();
		this.partner_id = partner_id;
		this.partner_name = partner_name;
		this.partner_logo = partner_logo;
		this.partner_slogan = partner_slogan;
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

	public String getPartner_logo() {
		return partner_logo;
	}

	public void setPartner_logo(String partner_logo) {
		this.partner_logo = partner_logo;
	}

	public String getPartner_slogan() {
		return partner_slogan;
	}

	public void setPartner_slogan(String partner_slogan) {
		this.partner_slogan = partner_slogan;
	}

}
