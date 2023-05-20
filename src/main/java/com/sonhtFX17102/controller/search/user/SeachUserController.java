package com.sonhtFX17102.controller.search.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.impl.CircumImpl;

@Controller
public class SeachUserController extends BaseController{
	
	private CircumImpl circumService;
	
	@Autowired
	public SeachUserController(CircumImpl circumService) {
		this.circumService = circumService;
	}

	@RequestMapping(value = "/search") 
	public ModelAndView findByCategoryCircum(@RequestParam("type") String type, HttpServletRequest request) {
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
		for (Circum circum : list) {
			String[] imgs = {splitImage(circum.getCircum_image()) };
			String imgNotStyle = removeStyle(imgs[0]);
			circum.setCircum_image(imgNotStyle);
		}
		if(list.isEmpty()) {
			request.setAttribute("message", "Danh sách đang được cập nhật vui lòng trở lại sau !");
			
		}
		_mvShare.addObject("listTop6Circum", list);
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/cause/cause");
		return _mvShare;
	}
}
