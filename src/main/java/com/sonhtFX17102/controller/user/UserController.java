package com.sonhtFX17102.controller.user;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

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
import com.sonhtFX17102.entities.CircumOrder;
import com.sonhtFX17102.service.impl.AccountImpl;
import com.sonhtFX17102.service.impl.PayImpl;

@Controller
public class UserController extends BaseController {
	@Autowired
	private AccountImpl accService;
	@Autowired
	private PayImpl payService;
	
	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.GET)
	public ModelAndView profile(@RequestParam("username") String username) {
		_mvShare.addObject("info", accService.getAccountDetailsByUsername(username));
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/manageUser/profile");
		_mvShare.addObject("category", category);
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
		String bank = request.getParameter("bank");
		String bankname = request.getParameter("bankname");
		String idS = request.getParameter("id");
		
		int id = Integer.parseInt(idS);
		accService.updateAccountDetailsByUser(id, firstName, lastName, address,
					birthday, orgName, username, phone, bank, bankname);
		_mvShare.addObject("messageUser", "Thay đổi thành công !!!");
		_mvShare.setViewName("redirect:cap-nhat?username="+username);
		return _mvShare;
	}
	@RequestMapping(value = "/tai-khoan/thanh-toan", method = RequestMethod.GET)
	public ModelAndView billing(@RequestParam("username") String name) {
		List<CircumOrder> listOrders = payService.getCircumOrderByUsername(name);
		_mvShare.addObject("listOrders", listOrders);
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/manageUser/billing");
		return _mvShare;
	}
	@RequestMapping(value = "/tai-khoan/bao-mat", method = RequestMethod.GET)
	public ModelAndView security(HttpServletRequest request) {
		_mvShare.addObject("messagePass", "");
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/manageUser/security");
		
		return _mvShare;
	}
	@RequestMapping(value = "/tai-khoan/bao-mat", method = RequestMethod.POST)
	public ModelAndView securityChange(HttpServletRequest request) {
		String username = request.getParameter("account_name");
		String curPass = request.getParameter("currentPassword");
		String newPass = request.getParameter("newPassword");
		String md5Pass = DigestUtils.md5Hex(curPass);
		String md5NewPass = DigestUtils.md5Hex(newPass);
		Account acc = accService.getAccountByUsername(username);
		if(acc.getAccount_password().equals(md5Pass)) {
			accService.updatePasswordByUsername(md5NewPass, username);
			_mvShare.addObject("messagePass", "Mật khẩu đã được thay đổi thành công - Vui lòng đăng nhập lại hoặc tiếp tục !");
		}
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/manageUser/security");
		
		return _mvShare;
	}
	
	@RequestMapping(value = "/tai-khoan/uploadfile", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("thisfile") CommonsMultipartFile file, 
			@RequestParam("id") String id,@RequestParam("username") String username , HttpSession s, Model mod ) {
		byte[] data = file.getBytes();
		String filePath = s.getServletContext().getRealPath("/") + "resources"
				+ File.separator + "image" + File.separator + file.getOriginalFilename();
		System.out.println(filePath);
		try {
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);
			fileout.close();
			//mod.addAttribute("imgName", file.getOriginalFilename());
			accService.uploadAvatar(file.getOriginalFilename(), id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail to upload");
		}

		return "redirect:/tai-khoan/cap-nhat?username="+username;
	}
}
