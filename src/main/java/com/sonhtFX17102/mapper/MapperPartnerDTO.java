package com.sonhtFX17102.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.entities.Partner;

public class MapperPartnerDTO implements RowMapper<PartnerDTO>{

	@Override
	public PartnerDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PartnerDTO p = new PartnerDTO();
		p.setPartner_id(rs.getInt("partner_id"));
		p.setPartner_name(rs.getString("partner_name"));
		p.setPartner_logo(rs.getString("partner_logo"));
		p.setPartner_slogan(rs.getString("partner_slogan"));
		return p;
	}

}
