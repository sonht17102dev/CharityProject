package com.sonhtFX17102.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sonhtFX17102.entities.Partner;


public class MapperPartner implements RowMapper<Partner> {

	@Override
	public Partner mapRow(ResultSet rs, int rowNum) throws SQLException {
		Partner p = new Partner();
		p.setPartner_id(rs.getInt("partner_id"));
		p.setPartner_name(rs.getString("partner_name"));
		p.setPartner_slogan(rs.getString("partner_slogan"));
		p.setPartner_logo(rs.getString("partner_logo"));
		p.setPartner_banner(rs.getString("partner_banner"));
		p.setPartner_introduce(rs.getString("partner_introduce"));
		p.setPartner_number_donate(rs.getInt("partner_number_donate"));
		p.setPartner_total_money(rs.getLong("partner_total_money"));
		p.setPartner_content(rs.getString("partner_content"));
		p.setPartner_status(rs.getString("partner_status"));
		return p;
	}

}
