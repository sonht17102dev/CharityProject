package com.sonhtFX17102.entities;

public class Circum {
	private int circum_id;
	private int partner_id;
	private String circum_name;
	private String circum_type;
	private String circum_content;
	private String circum_image;
	private String circum_des;
	private int circum_donations;
	private long circum_target;
	private long circum_raise;
	private int circum_time_end;
	private String circum_start_donate;
	private String circum_status;

	public String getCircum_status() {
		return circum_status;
	}

	public void setCircum_status(String circum_status) {
		this.circum_status = circum_status;
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

	public String getCircum_type() {
		return circum_type;
	}

	public void setCircum_type(String circum_type) {
		this.circum_type = circum_type;
	}

	public String getCircum_content() {
		return circum_content;
	}

	public void setCircum_content(String circum_content) {
		this.circum_content = circum_content;
	}

	public String getCircum_image() {
		return circum_image;
	}

	public void setCircum_image(String circum_image) {
		this.circum_image = circum_image;
	}

	public String getCircum_des() {
		return circum_des;
	}

	public void setCircum_des(String circum_des) {
		this.circum_des = circum_des;
	}

	public int getCircum_donations() {
		return circum_donations;
	}

	public void setCircum_donations(int circum_donations) {
		this.circum_donations = circum_donations;
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

	public String getCircum_start_donate() {
		return circum_start_donate;
	}

	public void setCircum_start_donate(String circum_start_donate) {
		this.circum_start_donate = circum_start_donate;
	}

	public Circum() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCircum_time_end() {
		return circum_time_end;
	}

	public void setCircum_time_end(int circum_time_end) {
		this.circum_time_end = circum_time_end;
	}

	public Circum(int circum_id, int partner_id, String circum_name, String circum_type, String circum_content,
			String circum_image, String circum_des, int circum_donations, long circum_target, long circum_raise,
			int circum_time_end, String circum_start_donate, String circum_status) {
		super();
		this.circum_id = circum_id;
		this.partner_id = partner_id;
		this.circum_name = circum_name;
		this.circum_type = circum_type;
		this.circum_content = circum_content;
		this.circum_image = circum_image;
		this.circum_des = circum_des;
		this.circum_donations = circum_donations;
		this.circum_target = circum_target;
		this.circum_raise = circum_raise;
		this.circum_time_end = circum_time_end;
		this.circum_start_donate = circum_start_donate;
		this.circum_status = circum_status;
	}

	public Circum(int partner_id, String circum_name, String circum_type, String circum_content, String circum_image,
			String circum_des, int circum_donations, long circum_target, long circum_raise, int circum_time_end,
			String circum_start_donate, String circum_status) {
		super();
		this.partner_id = partner_id;
		this.circum_name = circum_name;
		this.circum_type = circum_type;
		this.circum_content = circum_content;
		this.circum_image = circum_image;
		this.circum_des = circum_des;
		this.circum_donations = circum_donations;
		this.circum_target = circum_target;
		this.circum_raise = circum_raise;
		this.circum_time_end = circum_time_end;
		this.circum_start_donate = circum_start_donate;
		this.circum_status = circum_status;
	}

	@Override
	public String toString() {
		return "Circum [circum_id=" + circum_id + ", partner_id=" + partner_id + ", circum_name=" + circum_name
				+ ", circum_type=" + circum_type + ", circum_content=" + circum_content + ", circum_image="
				+ circum_image + ", circum_des=" + circum_des + ", circum_donations=" + circum_donations
				+ ", circum_target=" + circum_target + ", circum_raise=" + circum_raise + ", circum_time_end="
				+ circum_time_end + ", circum_start_donate=" + circum_start_donate + ", circum_status=" + circum_status
				+ "]";
	}


}
