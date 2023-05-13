package com.sonhtFX17102.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.HomeService;
import com.sonhtFX17102.service.impl.AccountImpl;

@Controller
public class HomeController extends BaseController {
	@Autowired
	public HomeService _homeService;
	@Autowired
	private AccountImpl accountService;
	
	@RequestMapping(value = { "/", "/trang-chu" }, method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		
		List<Circum> list = _homeService.getTop6Circums();
		for (Circum circum : list) {
			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}
		List<Partner> listPartners = _homeService.getTop6Partner();
		List<News> listNews = _homeService.getTop2News();
		
		_mvShare.addObject("list6Partner", listPartners);
		_mvShare.addObject("list2News", listNews);
		_mvShare.addObject("list6Circum", list);
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/index");
		//session.removeAttribute("message");
		return _mvShare;
	}
	
	/* 
	 * url này để thay đổi trạng thái khi 1 account login thành công
	 * chuyển trạng thái status từ offline -> online
	 */
	@RequestMapping(value = "/trang-chu/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(@RequestParam("username") String username) {
		accountService.updateStatusOnline(username);
		return "redirect:/trang-chu";
	}
	
}
