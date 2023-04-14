package com.sonhtFX17102.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;

@Controller
public class HomeController extends BaseController {

	@RequestMapping(value = { "/", "/trang-chu" }, method = RequestMethod.GET)
	public ModelAndView index() {
		List<Circum> list = _homeService.getTop6Circums();
		for (Circum circum : list) {
			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}

		_mvShare.addObject("list6", list);
		_mvShare.setViewName("user/index");
		return _mvShare;
	}

	@RequestMapping(value = "/login")
	public String login() {
		return "login/loginMain";
	}

	// add request mapping for /access-denied
	@RequestMapping(value = "/access-denied")
	public String showAccessDenied() {
		return "login/access-denied";
	}
}
