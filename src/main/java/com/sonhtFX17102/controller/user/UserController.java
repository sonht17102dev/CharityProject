package com.sonhtFX17102.controller.user;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.service.impl.AccountImpl;

@Controller
public class UserController extends BaseController {
	@Autowired
	private AccountImpl accService;
	
	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.GET)
	public ModelAndView profile(@RequestParam("usermail") String mail) {
		_mvShare.addObject("info", accService.getAccountDetailsByMail(mail));
		_mvShare.setViewName("user/manageUser/profile");
		return _mvShare;
	}
	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.POST)
	public ModelAndView updateProfile(HttpServletRequest request) {
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String orgName = request.getParameter("orgName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String mail = request.getParameter("email");
		String idS = request.getParameter("id");
		int id = Integer.parseInt(idS);
		accService.updateAccountDetailsByUser(id, firstName, lastName, address,
					birthday, orgName, username, phone);
		_mvShare.addObject("messageUser", "Thay đổi thành công !!!");
		_mvShare.setViewName("redirect:cap-nhat?usermail="+mail);
		return _mvShare;
	}
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
	
	@RequestMapping(value = "/tai-khoan/uploadfile", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("thisfile") CommonsMultipartFile file, 
			@RequestParam("id") String id,@RequestParam("email") String mail , HttpSession s, Model mod ) {
		byte[] data = file.getBytes();
		String filePath = s.getServletContext().getRealPath("/") + "resources"
				+ File.separator + "image" + File.separator + file.getOriginalFilename();
		System.out.println(filePath);
		try {
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);
			fileout.close();
			mod.addAttribute("imgName", file.getOriginalFilename());
			accService.uploadAvatar(file.getOriginalFilename(), id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/tai-khoan/cap-nhat?usermail="+mail;
	}
}
