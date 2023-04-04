package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.DTO.MapperPartnerDTO;
import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.entities.MapperPartner;
import com.sonhtFX17102.entities.Partner;

@Repository
public class PartnerDAO extends BaseDao{
	
	public List<PartnerDTO> getAllPartners(){
		String sql = "select partner_id, partner_logo, partner_name, partner_slogan from partner";
		List<PartnerDTO> list = _jdbcTemplate.query(sql, new MapperPartnerDTO());
		return list;
	}
	
	public Partner getPartnerById(int id) {
		String sql = "select * from partner where partner_id = " + id;
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list.get(0);
	}
	
	
}
