package com.sonhtFX17102.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sonhtFX17102.controller.BaseController;

@Controller
public class LoginController extends BaseController {
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/loginMain";
	}

	// add request mapping for /access-denied
	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public String showAccessDenied() {
		return "login/access-denied";
	}
	
	
}
