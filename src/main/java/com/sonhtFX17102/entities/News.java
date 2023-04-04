package com.sonhtFX17102.entities;

public class News {
	@Override
	public String toString() {
		return "News [news_id=" + news_id + ", news_img_banner=" + news_img_banner + ", news_descritption="
				+ news_descritption + ", news_post_date=" + news_post_date + ", news_content=" + news_content + "]";
	}

	private int news_id;
	private String news_img_banner;
	private String news_descritption;
	private String news_post_date;
	private String news_content;

	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	public News(int news_id, String news_img_banner, String news_descritption, String news_post_date,
			String news_content) {
		super();
		this.news_id = news_id;
		this.news_img_banner = news_img_banner;
		this.news_descritption = news_descritption;
		this.news_post_date = news_post_date;
		this.news_content = news_content;
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

	public String getNews_descritption() {
		return news_descritption;
	}

	public void setNews_descritption(String news_descritption) {
		this.news_descritption = news_descritption;
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
