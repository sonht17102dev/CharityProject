package com.sonhtFX17102.DAO;

import org.springframework.stereotype.Repository;

@Repository
public class PayDAO extends BaseDao{
	
	public void insertPayInfo(int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date) {
		String sql = "INSERT INTO CIRCUM_ORDER ( "
				+ " circum_id, circum_order_name, circum_order_mail, circum_order_phone, circum_order_bank, "
				+ " circum_order_bankname, circum_order_address, circum_order_amount, circum_order_date ) "
				+ " VALUES ( "
				+ " " + circum_id + ", "
				+ " N'" + circum_order_name + "', "
				+ " N'" + circum_order_mail + "', "
				+ " N'" + circum_order_phone + "', "
				+ " N'" + circum_order_bank + "', "
				+ " N'" + circum_order_bankname + "', "
				+ " N'" + circum_order_address + "', "
				+ " " + circum_order_amount + ", "
				+ " N'" + circum_order_date + "' "
				+ ") ";
		_jdbcTemplate.update(sql);
	}
}
