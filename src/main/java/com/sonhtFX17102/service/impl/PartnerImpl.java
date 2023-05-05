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
}
