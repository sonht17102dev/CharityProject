package com.sonhtFX17102.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.AccountImpl;

@Controller
public class HomeController extends BaseController {
	@Autowired
	private AccountImpl accountService;
	
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
	
	/* 
	 * url này để thay đổi trạng thái khi 1 account login thành công
	 * chuyển trạng thái status từ offline -> online
	 */
	@RequestMapping(value = "/trang-chu/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(@RequestParam("usermail") String usermail) {
		accountService.updateStatusOnline(usermail);
		return "redirect:/trang-chu";
	}
}
