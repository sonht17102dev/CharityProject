package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.DTO.CircumDTO;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.mapper.MapperCircum;
import com.sonhtFX17102.mapper.MapperCircumDTO;

@Repository
public class CircumDao extends BaseDao {
	public List<Circum> getAllCircums() {
		String sql = "select * from circum";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}
	public int getCountAllCircums() {
		String sql = "select * from circum";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list.size();
	}

	public List<Circum> getAllCircumsOfPartner(int id) {
		String sql = "select * from circum where partner_id = " + id;
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		for (Circum circum : list) {
			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}
		return list;
	}

	public List<Circum> getPagingPage(int index) {
		index = (index - 1) * 6;
		String sql = "select * from circum "
				
				+ " order by circum_id desc\r\n" + "OFFSET " + index
				+ " ROWS FETCH NEXT 6 ROWS ONLY";

		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		for (Circum circum : list) {

			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}
		return list;
	}

	public List<Circum> getPagingPageAdmin(int index) {
		index = (index - 1) * 10;
		String sql = "select * from circum\r\n " 
				+ "where circum_status='active' " 
				+ "order by circum_id\r\n" + "OFFSET " + index
				+ " ROWS FETCH NEXT 10 ROWS ONLY";

		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		for (Circum circum : list) {
			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}
		return list;
	}

	public List<Circum> get6NewestCircums() {
		String sql = "select top 6 * from circum order by circum_id desc";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());

		return list;
	}

	public List<Circum> getTop6Circums() {
		String sql = "select top 6 * from circum "
				+ "where circum_status='active' "
				+ "order by circum_id desc";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}

	public List<Circum> getTop3Circums() {
		String sql = "select top 3 * from circum "
				+ "where circum_status = 'active'"
				+ "order by circum_id desc ";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}

	public List<Circum> getTop10Circums() {
		String sql = "select top 10 * from circum ";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}

	public Circum getCircumById(int id) {
		String sql = "select * from circum where circum_id = " + id;
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list.get(0);
	}

	public CircumDTO getCircumDetailsById(int id) {
		String sql = "exec selectCircumById " + id;
		List<CircumDTO> list = _jdbcTemplate.query(sql, new MapperCircumDTO());
		return list.get(0);
	}
	
	public Circum checkCircumByIdExist(int id) {
		String sql = "select * from circum where circum_id = " + id + "; ";
		List<Circum> circums =  _jdbcTemplate.query(sql, new MapperCircum());
		if (circums.size()==0) return null;
		return circums.get(0);
	}
	public Circum checkCircumByNameExist(String name) {
		String sql = "select * from circum where circum_name = '" + name + "'; ";
		List<Circum> circums =  _jdbcTemplate.query(sql, new MapperCircum());
		if (circums.size()==0) return null;
		else return circums.get(0);
	}
	public void deleteCircum(int  id) {
		String sql = "delete from circum where circum_id = " + id ;
		_jdbcTemplate.update(sql);
	}
	public void insertCircum(int partner_id, String name, String type, String content, String image, String des,
			int donations, long target, long raise, int time_end, String start_donate, String status) {
		String sql = "INSERT INTO CIRCUM("
				+ "    partner_id,"
				+ "    circum_name,"
				+ "    circum_type ,"
				+ "    circum_content ,"
				+ "    circum_image , "
				+ "    circum_des , "
				+ "    circum_donations , "
				+ "    circum_target ,"
				+ "    circum_raise ,"
				+ "    circum_time_end ,"
				+ "    circum_start_donate, "
				+ "    circum_status "
				+ ") values ("
				+ partner_id + ", "
				+ "N'"+ name + "', "
				+ "N'"+ type + "', "
				+ "N'"+ content + "', "
				+ "N'"+ image + "', "
				+ "N'"+ des + "', "
				+ donations + ","
				+ target + ","
				+ raise + ","
				+ time_end + ","
				+ "'"+ start_donate + "',"
				+ "'"+ status + "'"
				+ ")";
		_jdbcTemplate.update(sql);
	}
	public void upDateCircum(int circum_id, int partner_id, String name, String type, String content, String image,
			String des, int donations, long target, long raise, int time_end, String start_donate, String status) {
		String sql = "UPDATE CIRCUM\r\n"
				+ "SET\r\n"
				+ "partner_id = " + partner_id+",\r\n"
				+ "circum_name = N'"+ name + "',\r\n"
				+ "circum_type = N'"+ type +"',\r\n"
				+ "circum_content = N'"+ content +"',\r\n"
				+ "circum_image = N'"+ image + "', \r\n"
				+ "circum_des = N'"+ des + "', \r\n"
				+ "circum_donations = "+ donations +", \r\n"
				+ "circum_target = "+target +" ,\r\n"
				+ "circum_raise = "+ raise +",\r\n"
				+ "circum_time_end = "+ time_end +",\r\n"
				+ "circum_start_donate = N'"+ start_donate +"',\r\n"
				+ "circum_status = N'"+ status +"'\r\n"
				+ "WHERE\r\n"
				+ "circum_id = "+ circum_id +";";
		_jdbcTemplate.update(sql);
	}
	
	public List<Circum> findByCategory(String type){
		String sql = "select * from circum "
				+ "where circum_type = N'"+ type +"' and circum_status='active' "
				+ "order by circum_id desc";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}
	public List<Circum> findByName(String name){
		String sql = "select * from circum "
				+ "where circum_name like N'%"+ name +"%'";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}
	
	public void updateStatus(int id, String status){
		String sql = "UPDATE CIRCUM "
				+ "SET circum_status = '"+ status +"'"
				+ " WHERE circum_id = "+ id +";";
		_jdbcTemplate.update(sql);
	}
	
	public List<Circum> findCircumsInactive(String status){
		String sql = "select * from CIRCUM WHERE circum_status = '" + status + "';";
		List<Circum> list = _jdbcTemplate.query(sql, new MapperCircum());
		return list;
	}
}
