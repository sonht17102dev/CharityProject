package com.sonhtFX17102.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.DAO.CircumDao;
import com.sonhtFX17102.DTO.CircumDTO;
import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.CircumImpl;
import com.sonhtFX17102.service.PartnerImpl;

@Controller
public class PartnerController extends BaseController{
	@Autowired
	private PartnerImpl partnerService;
	
	@RequestMapping(value = "doi-tac", method = RequestMethod.GET)
	public ModelAndView partner() {
		List<PartnerDTO> list = partnerService.getAllPartners();
		_mvShare.addObject("listPartner", list);
		_mvShare.setViewName("user/partner");
		return _mvShare;
	}
	@RequestMapping(value = "doi-tac-chi-tiet", method = RequestMethod.GET)
	public ModelAndView partnerDetail(@RequestParam("id") int id) {
		Partner p = partnerService.getPartnerById(id);
		_mvShare.addObject("partnerDetail", p);
		List<PartnerDTO> list = partnerService.getAllPartners();
		_mvShare.addObject("listPartner", list);
		List<Circum> listCircumOfPartner = partnerService.getAllCircumsOfPartner(id);
		_mvShare.addObject("listCircumOfPartner", listCircumOfPartner);
		_mvShare.setViewName("user/partner_detail");
		return _mvShare;
	}
}
