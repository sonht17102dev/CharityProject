package com.sonhtFX17102.entities;

public class News {

	private int news_id;
	private String news_img_banner;
	private String news_description;
	private String news_post_date;
	private String news_content;
	private String news_status;
	
	@Override
	public String toString() {
		return "News [news_id=" + news_id + ", news_img_banner=" + news_img_banner + ", news_description="
				+ news_description + ", news_post_date=" + news_post_date + ", news_content=" + news_content
				+ ", news_status=" + news_status + "]";
	}


	public News(int news_id, String news_img_banner, String news_description, String news_post_date,
			String news_content, String news_status) {
		this.news_id = news_id;
		this.news_img_banner = news_img_banner;
		this.news_description = news_description;
		this.news_post_date = news_post_date;
		this.news_content = news_content;
		this.news_status = news_status;
	}


	public String getNews_status() {
		return news_status;
	}


	public void setNews_status(String news_status) {
		this.news_status = news_status;
	}


	public News(String news_img_banner, String news_description, String news_post_date,
			String news_content, String news_status) {
		this.news_img_banner = news_img_banner;
		this.news_description = news_description;
		this.news_post_date = news_post_date;
		this.news_content = news_content;
		this.news_status = news_status;
	}


	public News() {
	}


	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}

	public String getNews_img_banner() {
		return news_img_banner;
	}

	public void setNews_img_banner(String news_img_banner) {
		this.news_img_banner = news_img_banner;
	}

	public String getNews_description() {
		return news_description;
	}

	public void setNews_description(String news_description) {
		this.news_description = news_description;
	}

	public String getNews_post_date() {
		return news_post_date;
	}

	public void setNews_post_date(String news_post_date) {
		this.news_post_date = news_post_date;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

}
