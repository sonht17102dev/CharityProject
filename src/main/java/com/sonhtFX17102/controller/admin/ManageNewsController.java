package com.sonhtFX17102.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;

@Controller
public class ManageNewsController extends BaseController{
	
	@RequestMapping(value= "admin/manage-news", method = RequestMethod.GET)
	public ModelAndView manageNews() {
		_mvShareAdmin.setViewName("admin/news/manageNews");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value= "admin/edit-add-news", method = RequestMethod.GET)
	public ModelAndView editCircum() {
		_mvShareAdmin.setViewName("admin/news/edit-addNews");
		return _mvShareAdmin;
	}
}
