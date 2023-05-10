package com.sonhtFX17102.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.service.impl.AccountImpl;

@Controller
public class HomeAdminController extends BaseController{
	
	@Autowired
	private AccountImpl accountService;
	
	@RequestMapping(value= {"admin", "admin/home"}, method = RequestMethod.GET)
	public ModelAndView homeAd() {
		_mvShareAdmin.setViewName("admin/indexAd");
		return _mvShareAdmin;
	}
	
	/* 
	 * url này để thay đổi trạng thái khi 1 account login thành công
	 * chuyển trạng thái status từ offline -> online
	 */
	@RequestMapping(value= "/admin/loginSuccess", method = RequestMethod.GET)
	public String adminLoginSuccess(@RequestParam("username") String username) {
		// thay đổi field account_status trong database từ offline -> online
		accountService.updateStatusOnline(username);
		return "redirect:/admin/";
	}
}
