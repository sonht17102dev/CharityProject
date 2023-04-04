package com.sonhtFX17102.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCircum implements RowMapper<Circum>{

	@Override
	public Circum mapRow(ResultSet rs, int rowNum) throws SQLException {
		Circum circum = new Circum();
		circum.setCircum_id(rs.getInt("circum_id"));
		circum.setPartner_id(rs.getInt("partner_id"));
		circum.setCircum_name(rs.getString("circum_name"));
		circum.setCircum_type(rs.getString("circum_type"));
		circum.setCircum_content(rs.getString("circum_content"));
		circum.setCircum_image(rs.getString("circum_image"));
		circum.setCircum_des(rs.getString("circum_des"));
		circum.setCircum_donations(rs.getInt("circum_donations"));
		circum.setCircum_target(rs.getLong("circum_target"));
		circum.setCircum_raise(rs.getLong("circum_raise"));
		circum.setCircum_time_end(rs.getInt("circum_time_end"));
		circum.setCircum_start_donate(rs.getString("circum_start_donate"));
		circum.setCircum_status(rs.getString("circum_status"));
		return circum;
	}

}
