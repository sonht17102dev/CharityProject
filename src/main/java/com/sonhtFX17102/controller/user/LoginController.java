package com.sonhtFX17102.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.service.AccountImpl;

@Controller
public class LoginController extends BaseController {
	@Autowired
	private AccountImpl accountService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/loginMain";
	}
	

	// add request mapping for /access-denied
	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public String showAccessDenied() {
		return "login/access-denied";
	}
	
	/* 
	 * url này để thay đổi trạng thái khi 1 account logout thành công
	 * chuyển trạng thái status từ online -> offline
	 */
	@RequestMapping(value = "/logout-success", method = RequestMethod.GET)
	public String logoutSuccess(@RequestParam("usermail") String usermail) {
		accountService.updateStatusOffline(usermail);
		return "user/index";
	}
}
