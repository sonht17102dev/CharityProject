package com.sonhtFX17102.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sonhtFX17102.entities.CircumOrder;

public class MapperCircumOrder implements RowMapper<CircumOrder>{

	@Override
	public CircumOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
		CircumOrder circumOrder = new CircumOrder();
		circumOrder.setCircum_order_id(rs.getInt("circum_order_id"));
		circumOrder.setCircum_id(rs.getInt("circum_id"));
		circumOrder.setCircum_order_name(rs.getString("circum_order_name"));
		circumOrder.setCircum_order_mail(rs.getString("circum_order_mail"));
		circumOrder.setCircum_order_phone(rs.getString("circum_order_phone"));
		circumOrder.setCircum_order_bank(rs.getString("circum_order_bank"));
		circumOrder.setCircum_order_bankname(rs.getString("circum_order_bankname"));
		circumOrder.setCircum_order_address(rs.getString("circum_order_address"));
		circumOrder.setCircum_order_name(rs.getString("circum_order_name"));
		circumOrder.setCircum_order_amount(rs.getInt("circum_order_amount"));
		circumOrder.setCircum_order_date(rs.getString("circum_order_date"));
		circumOrder.setCircum_name(rs.getString("circum_name"));
		return circumOrder;
	}

}
