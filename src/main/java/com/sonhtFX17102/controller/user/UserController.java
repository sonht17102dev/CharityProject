package com.sonhtFX17102.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.DTO.AccountDetailsDTO;
import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.service.impl.AccountImpl;

@Controller
public class UserController extends BaseController {
	@Autowired
	private AccountImpl accService;
	
//	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.GET)
//	public ModelAndView profile(@RequestParam("usermail") String mail) {
//		Account account = accService.checkAccountByMailExist(mail);
//		AccountDetailsDTO accountDetailsDTO = accService.getAccountDetails(account.getAccount_id());
//		_mvShare.addObject("user", account);
//		_mvShare.addObject("userDetails", accountDetailsDTO);
//		_mvShare.setViewName("user/manageUser/profile");
//		return _mvShare;
//	}
	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.GET)
	public ModelAndView profile() {
		_mvShare.setViewName("user/manageUser/profile");
		return _mvShare;
	}
//	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.POST)
//	public ModelAndView updateProfile(HttpServletRequest request) {
//		String username = request.getParameter("username");
//		String firstName = request.getParameter("firstName");
//		String lastName = request.getParameter("lastName");
//		String orgName = request.getParameter("orgName");
//		String address = request.getParameter("address");
//		String phone = request.getParameter("phone");
//		String birthday = request.getParameter("birthday");
//		String idS = request.getParameter("id");
//		int id = Integer.parseInt(idS);
//		accService.updateAccountDetailsByUser(id, firstName, lastName, address,
//					birthday, orgName, username, phone);
//		_mvShare.addObject("messageUser", "Thay đổi thành công !!!");
//		_mvShare.setViewName("user/manageUser/profile");
//		return _mvShare;
//	}
	@RequestMapping(value = "/tai-khoan/thanh-toan", method = RequestMethod.GET)
	public String billing(HttpServletRequest request) {
		
		return "user/manageUser/billing";
	}
	@RequestMapping(value = "/tai-khoan/bao-mat", method = RequestMethod.GET)
	public ModelAndView security(HttpServletRequest request) {
		_mvShare.addObject("messagePass", "");
		_mvShare.setViewName("user/manageUser/security");
		return _mvShare;
	}
	@RequestMapping(value = "/tai-khoan/bao-mat", method = RequestMethod.POST)
	public ModelAndView securityChange(HttpServletRequest request) {
		String mail = request.getParameter("account_mail");
		String curPass = request.getParameter("currentPassword");
		String newPass = request.getParameter("newPassword");
		String md5Pass = DigestUtils.md5Hex(curPass);
		String md5NewPass = DigestUtils.md5Hex(newPass);
		Account acc = accService.checkAccountByMailExist(mail);
		if(acc.getAccount_password().equals(md5Pass)) {
			accService.updatePasswordByEmail(md5NewPass, mail);
			_mvShare.addObject("messagePass", "Mật khẩu đã được thay đổi thành công - Vui lòng đăng nhập lại hoặc tiếp tục !");
		}
		_mvShare.setViewName("user/manageUser/security");
		return _mvShare;
	}
}
