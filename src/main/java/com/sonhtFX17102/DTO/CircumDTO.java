package com.sonhtFX17102.DTO;

public class CircumDTO {
	

	private int circum_id;
	private int partner_id;
	private String circum_name;
	private String circum_des;
	private String circum_start_donate;
	private String circum_image;
	private String circum_content;
	private long circum_target;
	private long circum_raise;
	private int circum_donations;
	private int circum_time_end;
	private String partner_logo;
	private String partner_name;

	public CircumDTO(int circum_id, int partner_id, String circum_name, String circum_des, String circum_start_donate,
			String circum_image, String circum_content, long circum_target, long circum_raise, int circum_donations,
			int circum_time_end, String partner_logo, String partner_name) {
	
		this.circum_id = circum_id;
		this.partner_id = partner_id;
		this.circum_name = circum_name;
		this.circum_des = circum_des;
		this.circum_start_donate = circum_start_donate;
		this.circum_image = circum_image;
		this.circum_content = circum_content;
		this.circum_target = circum_target;
		this.circum_raise = circum_raise;
		this.circum_donations = circum_donations;
		this.circum_time_end = circum_time_end;
		this.partner_logo = partner_logo;
		this.partner_name = partner_name;
	}

	public CircumDTO() {
		
	}

	public int getCircum_id() {
		return circum_id;
	}

	public void setCircum_id(int circum_id) {
		this.circum_id = circum_id;
	}

	public int getPartner_id() {
		return partner_id;
	}

	public void setPartner_id(int partner_id) {
		this.partner_id = partner_id;
	}

	public String getCircum_name() {
		return circum_name;
	}

	public void setCircum_name(String circum_name) {
		this.circum_name = circum_name;
	}

	public String getCircum_des() {
		return circum_des;
	}

	public void setCircum_des(String circum_des) {
		this.circum_des = circum_des;
	}

	public String getCircum_start_donate() {
		return circum_start_donate;
	}

	public void setCircum_start_donate(String circum_start_donate) {
		this.circum_start_donate = circum_start_donate;
	}

	public String getCircum_image() {
		return circum_image;
	}

	public void setCircum_image(String circum_image) {
		this.circum_image = circum_image;
	}

	public String getCircum_content() {
		return circum_content;
	}

	public void setCircum_content(String circum_content) {
		this.circum_content = circum_content;
	}

	public long getCircum_target() {
		return circum_target;
	}

	public void setCircum_target(long circum_target) {
		this.circum_target = circum_target;
	}

	public long getCircum_raise() {
		return circum_raise;
	}

	public void setCircum_raise(long circum_raise) {
		this.circum_raise = circum_raise;
	}

	public int getCircum_donations() {
		return circum_donations;
	}

	public void setCircum_donations(int circum_donations) {
		this.circum_donations = circum_donations;
	}

	public int getCircum_time_end() {
		return circum_time_end;
	}

	public void setCircum_time_end(int circum_time_end) {
		this.circum_time_end = circum_time_end;
	}

	public String getPartner_logo() {
		return partner_logo;
	}

	public void setPartner_logo(String partner_logo) {
		this.partner_logo = partner_logo;
	}

	public String getPartner_name() {
		return partner_name;
	}

	public void setPartner_name(String partner_name) {
		this.partner_name = partner_name;
	}

	@Override
	public String toString() {
		return "CircumDTO [circum_id=" + circum_id + ", partner_id=" + partner_id + ", circum_name=" + circum_name
				+ ", circum_des=" + circum_des + ", circum_start_donate=" + circum_start_donate + ", circum_image="
				+ circum_image + ", circum_content=" + circum_content + ", circum_target=" + circum_target
				+ ", circum_raise=" + circum_raise + ", circum_donations=" + circum_donations + ", circum_time_end="
				+ circum_time_end + ", partner_logo=" + partner_logo + ", partner_name=" + partner_name + "]";
	}
	
	
}
