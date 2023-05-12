package com.sonhtFX17102.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.CircumDao;
import com.sonhtFX17102.DAO.PartnerDAO;
import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.IPartnerService;

@Service
public class PartnerImpl implements IPartnerService {
	@Autowired
	private PartnerDAO partnerDAO;
	@Autowired
	private CircumDao circumDao;

	@Override
	public List<PartnerDTO> getAllPartners() {
		// TODO Auto-generated method stub
		return partnerDAO.getAllPartners();
	}

	@Override
	public Partner getPartnerById(int id) {
		// TODO Auto-generated method stub
		return partnerDAO.getPartnerById(id);
	}

	@Override
	public List<Circum> getAllCircumsOfPartner(int partner_id) {
		// TODO Auto-generated method stub
		return circumDao.getAllCircumsOfPartner(partner_id);
	}

	@Override
	public int getCountAllPartner() {
		// TODO Auto-generated method stub
		return partnerDAO.getCountAllPartner();
	}

	@Override
	public List<Partner> getPagingPage(int index) {
		// TODO Auto-generated method stub
		return partnerDAO.getPagingPage(index);
	}

	@Override
	public List<Partner> getPartnersByKey(String key) {
		// TODO Auto-generated method stub
		return partnerDAO.getPartnersByKey(key);
	}

	@Override
	public List<Partner> getPartnerByMoney() {
		// TODO Auto-generated method stub
		return partnerDAO.getPartnerByMoney();
	}

	@Override
	public List<Partner> getPartnerByProject() {
		// TODO Auto-generated method stub
		return partnerDAO.getPartnerByProject();
	}

	@Override
	public void deletePartnerById(int id) {
		// TODO Auto-generated method stub
		partnerDAO.deletePartnerById(id);
	}

	@Override
	public Partner checkPartnerByNameExist(String name) {
		// TODO Auto-generated method stub
		return partnerDAO.checkPartnerByNameExist(name);
	}

	@Override
	public void insertPartner(String partner_name, String partner_slogan, String partner_logo, String partner_banner,
			int partner_number_donate, int partner_total_money, String partner_introduce, String partner_content,
			String partner_status) {
		// TODO Auto-generated method stub
		partnerDAO.insertPartner(partner_name, partner_slogan, partner_logo, partner_banner, partner_number_donate,
				partner_total_money, partner_introduce, partner_content, partner_status);
	}

	@Override
	public void updatePartnerById(int partner_id, String partner_name, String partner_slogan, String partner_logo,
			String partner_banner, int partner_number_donate, int partner_total_money, String partner_introduce,
			String partner_content, String partner_status) {
		// TODO Auto-generated method stub
		partnerDAO.updatePartnerById(partner_id, partner_name, partner_slogan, partner_logo, partner_banner,
				partner_number_donate, partner_total_money, partner_introduce, partner_content, partner_status);
	}

}
