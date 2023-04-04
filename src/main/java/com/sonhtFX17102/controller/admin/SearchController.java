package com.sonhtFX17102.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.CircumImpl;

@Controller
public class SearchController extends BaseController{
	@Autowired
	private CircumImpl circumService;
	
	@RequestMapping(value = "admin/search", method = RequestMethod.GET)
	public ModelAndView findByCategoryCircum(@RequestParam("type") String type) {
//		String type = request.getParameter("type");
		List<Circum> list = new ArrayList<>();
		if(type != null && type.equalsIgnoreCase(category[0].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[1].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[2].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[3].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[4].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[5].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[6].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[7].trim())) {
			list = circumService.findByCategory(type);
		}
		_mvShareAdmin.addObject("listTop10Circum", list);
		_mvShareAdmin.addObject("category", category);
		_mvShareAdmin.setViewName("admin/circum/manageCircum");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value = "admin/search", method = RequestMethod.POST)
	public ModelAndView findByNameCircum(HttpServletRequest request) {
		String name = request.getParameter("nav-search-input");
		List<Circum> list = circumService.findByName(name);
		_mvShareAdmin.addObject("listTop10Circum", list);
		_mvShareAdmin.setViewName("admin/circum/manageCircum");
		return _mvShareAdmin;
	} 
}
