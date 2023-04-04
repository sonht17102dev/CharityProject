package com.sonhtFX17102.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCircumDTO implements RowMapper<CircumDTO>{

	@Override
	public CircumDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CircumDTO circumDTO = new CircumDTO();
		circumDTO.setCircum_id(rs.getInt("circum_id"));
		circumDTO.setPartner_id(rs.getInt("partner_id"));
		circumDTO.setCircum_name(rs.getString("circum_name"));
		circumDTO.setCircum_des(rs.getString("circum_des"));
		circumDTO.setCircum_start_donate(rs.getString("circum_start_donate"));
		circumDTO.setCircum_image(rs.getString("circum_image"));
		circumDTO.setCircum_content(rs.getString("circum_content"));
		circumDTO.setCircum_target(rs.getLong("circum_target"));
		circumDTO.setCircum_raise(rs.getLong("circum_raise"));
		circumDTO.setCircum_donations(rs.getInt("circum_donations"));
		
		circumDTO.setCircum_time_end(rs.getInt("circum_time_end"));
		circumDTO.setPartner_logo(rs.getString("partner_logo"));
		circumDTO.setPartner_name(rs.getString("partner_name"));
		return circumDTO;
	}

}
