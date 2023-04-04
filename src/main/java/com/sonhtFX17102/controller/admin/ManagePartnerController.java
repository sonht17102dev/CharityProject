package com.sonhtFX17102.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;

@Controller
public class ManagePartnerController extends BaseController{
	
	
	@RequestMapping(value= "admin/manage-partner", method = RequestMethod.GET)
	public ModelAndView managePartner() {
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value= "admin/edit-add-partner", method = RequestMethod.GET)
	public ModelAndView editCircum() {
		_mvShareAdmin.setViewName("admin/partner/edit-addPartner");
		return _mvShareAdmin;
	}
}
