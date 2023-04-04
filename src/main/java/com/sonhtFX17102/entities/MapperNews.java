package com.sonhtFX17102.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperNews implements RowMapper<News> {

	@Override
	public News mapRow(ResultSet rs, int rowNum) throws SQLException {
		News news = new News();
		news.setNews_id(rs.getInt("news_id"));
		news.setNews_img_banner(rs.getString("news_img_banner"));
		news.setNews_descritption(rs.getString("news_descritption"));
		news.setNews_post_date(rs.getString("news_post_date"));
		news.setNews_content(rs.getString("news_content"));
		return news;
	}

}
