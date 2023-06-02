package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.entities.CircumOrder;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.mapper.MapperCircumOrder;

@Repository
public class PayDAO extends BaseDao{
	
	public void insertPayInfo(int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date, String circum_name, String circum_status) {
		String sql = "INSERT INTO CIRCUM_ORDER ( "
				+ " circum_id, circum_order_name, circum_order_mail, circum_order_phone, circum_order_bank, "
				+ " circum_order_bankname, circum_order_address, circum_order_amount, circum_order_date,"
				+ " circum_name,circum_status ) "
				+ " VALUES ( "
				+ " " + circum_id + ", "
				+ " N'" + circum_order_name + "', "
				+ " N'" + circum_order_mail + "', "
				+ " N'" + circum_order_phone + "', "
				+ " N'" + circum_order_bank + "', "
				+ " N'" + circum_order_bankname + "', "
				+ " N'" + circum_order_address + "', "
				+ " " + circum_order_amount + ", "
				+ " N'" + circum_order_date + "', "
				+ " N'" + circum_name + "', "
				+ " N'" + circum_status + "' "
				+ ") ";
		_jdbcTemplate.update(sql);
	}
	public List<CircumOrder> getCircumOrderByUsername(String username) {
		String sql = "select * from circum_order where circum_order_name = N'" + username + "';";
		List<CircumOrder> list = _jdbcTemplate.query(sql, new MapperCircumOrder());
		return list;
	}
	public int getCountAllPayment() {
		String sql = "select * from circum_order ";
		List<CircumOrder> list = _jdbcTemplate.query(sql, new MapperCircumOrder());
		return list.size();
	}
	public List<CircumOrder> getPagingPage(int index) {
		index = (index - 1) * 5;
		String sql = "select * from circum_order "
				+ " order by circum_order_id " + "OFFSET " + index
				+ " ROWS FETCH NEXT 5 ROWS ONLY";
		List<CircumOrder> list = _jdbcTemplate.query(sql, new MapperCircumOrder());
		return list;
	}
	public void updateStatusById(String type, int id) {
		String sql = "Update CIRCUM_ORDER "
				+ "SET circum_status = '" + type +"' "
				+ "WHERE circum_order_id = " + id + " ;";
		_jdbcTemplate.update(sql);
	}
	public List<CircumOrder> findByName(String keyword) {
		String sql = "Select * from circum_order where circum_name like N'%"+ keyword +"%' "
				+ "or circum_order_mail like N'%"+ keyword +"%'; ";
		List<CircumOrder> list = _jdbcTemplate.query(sql, new MapperCircumOrder());
		return list;
	}
	public List<CircumOrder> findPaymentByType(String typeStatus) {
		String sql = "Select * from circum_order where circum_status = '"+ typeStatus +"'; ";
		List<CircumOrder> list = _jdbcTemplate.query(sql, new MapperCircumOrder());
		return list;
	}
	
}
