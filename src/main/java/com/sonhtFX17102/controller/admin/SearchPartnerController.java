package com.sonhtFX17102.controller.admin;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.impl.PartnerImpl;

@Controller
@RequestMapping(value = "admin")
public class SearchPartnerController extends BaseController{
	private PartnerImpl partnerService;

	@Autowired
	public SearchPartnerController(PartnerImpl partnerService) {
		this.partnerService = partnerService;
	}
	
	@RequestMapping(value = "/search-partner", method = RequestMethod.POST)
	public ModelAndView searchByKey(@RequestParam("nav-search-input") String key) {
		List<Partner> list = partnerService.getPartnersByKey(key);
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-money", method = RequestMethod.GET)
	public ModelAndView searchMoney() {
		List<Partner> list = partnerService.getPartnerByMoney();
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-project", method = RequestMethod.GET)
	public ModelAndView searchProject() {
		List<Partner> list = partnerService.getPartnerByProject();
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
}
