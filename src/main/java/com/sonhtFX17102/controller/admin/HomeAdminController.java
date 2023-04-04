package com.sonhtFX17102.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;

@Controller
public class HomeAdminController extends BaseController{
	
	
	@RequestMapping(value= {"admin", "admin/home"}, method = RequestMethod.GET)
	public ModelAndView homeAd() {
		_mvShareAdmin.setViewName("admin/indexAd");
		return _mvShareAdmin;
	}
}
