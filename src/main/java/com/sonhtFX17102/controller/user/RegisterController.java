package com.sonhtFX17102.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.service.impl.AccountImpl;

@Controller
public class RegisterController extends BaseController {
	@Autowired
	private AccountImpl accService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "register/registerMain";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView doRegister(HttpServletRequest request) {
		String mail = request.getParameter("usermail").trim();
		String name = request.getParameter("username");
		String phone = request.getParameter("userphone");
		String pass = generateRandomPassword(8); // sử dụng phương thức của BaseController tạo mk random 8 kí tự
		System.out.println(pass);
		String md5Pass = DigestUtils.md5Hex(pass);
		Account account = new Account("USER", mail, name, phone, md5Pass, "offline", 1);
		System.out.println(account.toString());
		account = accService.checkAccountByMailExist(mail);
		
		if (account == null) {
			try {
				accService.insertAccount("USER", mail, name, phone, md5Pass, "offline", 1);
				sendEmail("sonhtfx17102@funix.edu.vn",mail, "Chúc mừng bạn đã đăng ký thành công!",
						"Mật khẩu của bạn là " + pass + " \n\n Vui lòng không cung cấp mật khẩu cho bất kỳ ai.");
				_mvShare.setViewName("redirect:login");
			} catch (Exception e) {
				e.printStackTrace();
				
				_mvShare.setViewName("redirect:register");
			}

		} else {
			request.setAttribute("messageRegister", "Tài khoản đã tồn tại, vui lòng nhập lại!!!");
			_mvShare.setViewName("register/registerMain");
		}
		return _mvShare;
	}
}
