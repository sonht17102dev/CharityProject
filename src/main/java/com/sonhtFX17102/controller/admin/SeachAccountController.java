package com.sonhtFX17102.controller.admin;

import java.util.ArrayList;
import java.util.IllegalFormatFlagsException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.service.AccountImpl;

@Controller
@RequestMapping(value = "admin")
public class SeachAccountController extends BaseController{
	@Autowired
	private AccountImpl accoutService;
	
	@RequestMapping(value = "/search-account", method = RequestMethod.GET)
	public ModelAndView searchByRole(@RequestParam("role") String role) {
		List<Account> list = new ArrayList<>();
		if(role!=null && role.equals("ADMIN")) {
			list = accoutService.getAccountsByRole("ADMIN");
		} else if (role.equals("USER")) {
			list = accoutService.getAccountsByRole("USER");
		}
		_mvShareAdmin.addObject("listTop5Account", list);
		_mvShareAdmin.setViewName("admin/account/manageAccount");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-account", method = RequestMethod.POST)
	public ModelAndView searchByKey(@RequestParam("nav-search-input") String key) {
		List<Account> list = accoutService.getAccountsByKey(key);
		_mvShareAdmin.addObject("listTop5Account", list);
		_mvShareAdmin.setViewName("admin/account/manageAccount");
		return _mvShareAdmin;
	}
	
//	@RequestMapping(value = "/search-account", method = RequestMethod.GET)
//	public ModelAndView searchByPhone(@RequestParam("type") String type) {
//		if(type != null && type.equals("phone")) {
//			List<Account> list = accoutService.getAccountsByPhone("phone");
//			
//			_mvShareAdmin.addObject("listTop5Account", list);
//		}
//		_mvShareAdmin.setViewName("admin/account/manageAccount");
//		return _mvShareAdmin;
//	}
}
