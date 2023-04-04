package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.Partner;

@Service
public interface IPartnerService {
	@Autowired
	public List<PartnerDTO> getAllPartners();
	public Partner getPartnerById(int id);
	public List<Circum> getAllCircumsOfPartner(int partner_id);
}
