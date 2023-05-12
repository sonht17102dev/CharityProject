package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.Partner;

@Service
public interface IPartnerService {
	public List<PartnerDTO> getAllPartners();
	public Partner getPartnerById(int id);
	public List<Circum> getAllCircumsOfPartner(int partner_id);
	public int getCountAllPartner();
	public List<Partner> getPagingPage(int index);
	public List<Partner> getPartnersByKey(String key);
	public List<Partner> getPartnerByMoney();
	public List<Partner> getPartnerByProject();
	public void deletePartnerById(int id);
	public Partner checkPartnerByNameExist(String name);
	public void insertPartner(String partner_name, String partner_slogan, String partner_logo, String partner_banner,
			int partner_number_donate, int partner_total_money, String partner_introduce,
			String partner_content, String partner_status) ;
	public void updatePartnerById(int partner_id, String partner_name, String partner_slogan, String partner_logo,
			String partner_banner, int partner_number_donate, int partner_total_money, String partner_introduce,
			String partner_content, String partner_status);
	
}
