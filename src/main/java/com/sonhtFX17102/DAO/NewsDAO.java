package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.entities.MapperNews;
import com.sonhtFX17102.entities.News;

@Repository
public class NewsDAO extends BaseDao {

	public List<News> getAllNews() {
		String sql = "select * from news";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	public List<News> getTop6List() {
		String sql = "select top 6 * from news";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}

	public List<News> getNext6News(int amount) {
		String sql = "SELECT *\n" + "  FROM news\n" + " ORDER BY news_id\n" + "OFFSET " + amount + " ROWS\n"
				+ " FETCH NEXT 6 ROWS ONLY";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
}
