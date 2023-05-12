package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.mapper.MapperNews;
import com.sonhtFX17102.mapper.MapperPartner;

@Repository
public class NewsDAO extends BaseDao {

	public List<News> getAllNews() {
		String sql = "select * from news";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	public List<News> getTop2News() {
		String sql = "select top 2 * from news order by news_id";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	public List<News> getTop6List() {
		String sql = "select top 6 * from news";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	
	public List<News> getNext6News(int amount) {
		String sql = "SELECT *\n" + "  FROM news\n where news_status = 'active'" + " ORDER BY news_id\n" + "OFFSET " + amount + " ROWS\n"
				+ " FETCH NEXT 6 ROWS ONLY";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	
	public List<News> getPagingPage(int index) {
		index = (index - 1) * 6;
		String sql = "select * from news "
				+ " where news_status = 'active'"
				+ " order by news_id " + "OFFSET " + index
				+ " ROWS FETCH NEXT 6 ROWS ONLY";

		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	public int getCountAllNews() {
		String sql = "select * from news where news_status = 'active'; ";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list.size();
	}
	
	public void deleteNewsById(int id) {
		String sql = "update news set news_status = 'inactive' where news_id = "+ id +"; ";
		_jdbcTemplate.update(sql);
	}
	
	public News checkNewsByTitleExisted(String title) {
		String sql = "select * from news where news_description = N'"+ title +"'; ";
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		
		return list.size()== 0 ? null : list.get(0);
	}
	
	public void insertNews(String description, String banner, String date, String content) {
		String sql = "INSERT INTO news ( "
				+ " news_img_banner, news_description, news_post_date, news_content, news_status "
				+ " ) "
				+ " VALUES ( "
				+ " '" + banner + "', "
				+ " N'"+ description +"', "
				+ " N'"+ date +"', "
				+ " N'"+ content +"', "
				+ " 'active' ) ";
		_jdbcTemplate.update(sql);
	}
	public News getNewsById(int id) {
		String sql = "select * from news where news_id = " + id + " and news_status='active' ;" ;
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list.size()== 0 ? null : list.get(0);
	}
	
	public void updateNewsById(int news_id, String description, String banner,
			String date, String content, String status) {
		String sql = "Update NEWS set "
				+ " news_img_banner = N'" + banner + "', "
				+ " news_description = N'" + description + "', "
				+ " news_post_date = N'" + date + "', "
				+ " news_content = N'" + content + "', "
				+ " news_status = N'" + status + "' "
				+ " where news_id = " + news_id + " ;" ;
		_jdbcTemplate.update(sql);
	}
	
	public List<News> getNewsByYear(String year) {
		String sql = "select * from news where news_post_date like '%" + year + "' and news_status='active' ;" ;
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
	public List<News> getNewsByKey(String key) {
		String sql = "select * from news where news_description like N'%" + key + "%' and news_status='active' ;" ;
		List<News> list = _jdbcTemplate.query(sql, new MapperNews());
		return list;
	}
}
