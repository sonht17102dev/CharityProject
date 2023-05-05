package com.sonhtFX17102.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.service.impl.AccountImpl;

@Controller
public class LoginController extends BaseController {
	@Autowired
	private AccountImpl accountService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		String invalidSession= request.getParameter("invalid-session");
		if(invalidSession != null && invalidSession.equals("true")) {
			return "login/loginMain";
		} 
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
	
	@RequestMapping(value = "/login/resetPassword", method = RequestMethod.POST)
	public ModelAndView resetPassword(HttpServletRequest request) {
		String email = request.getParameter("email").trim();
		String passRandom = generateRandomPassword(8);
		System.out.println(passRandom);
		String md5Pass = DigestUtils.md5Hex(passRandom);
		try {
			Account account = accountService.checkAccountByMailExist(email);
			if(account != null) {
				accountService.updatePasswordByEmail(md5Pass, email);
				sendEmail("sonhtfx17102@funix.edu.vn", email, "Reset mật khẩu !!!", "Mật khẩu của bạn là " + passRandom + ". <br>Vui lòng không cung cấp mật khẩu cho bất kỳ ai.");
				_mvShare.addObject("resetMessage", "Mật khẩu của bạn đã được reset - Truy cập email để kiểm tra");
				_mvShare.setViewName("login/loginMain");
			} else {
				_mvShare.addObject("resetMessage", "");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		_mvShare.setViewName("login/loginMain");
		return _mvShare;
		
	}
}
