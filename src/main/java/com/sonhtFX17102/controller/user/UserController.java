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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.DTO.AccountDetailsDTO;
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
	public String profile(@RequestParam("username") String username, Model model) {
		if (accService.getAccountDetailsByUsername(username).getAccount_id() == 0) {
			AccountDetailsDTO aDto = new AccountDetailsDTO();
			Account a = accService.getAccountByUsername(username);
			aDto.setAccount_name(username);
			aDto.setAccount_id(a.getAccount_id());
//			System.out.println(aDto.toString());
			model.addAttribute("info", aDto);
		} else {
			model.addAttribute("info", accService.getAccountDetailsByUsername(username));
		}
		model.addAttribute("category", category);
		return "user/manageUser/profile";
	}

	@RequestMapping(value = "/tai-khoan/cap-nhat", method = RequestMethod.POST)
	public ModelAndView updateProfile(HttpServletRequest request,
			@ModelAttribute("info") AccountDetailsDTO aDetailsDTO) {
		AccountDetailsDTO a = accService.getAccountDetailsByUsername(aDetailsDTO.getAccount_name());
		if (a.getAccount_firstName() == null) {
			accService.addAccountDetailsByUser(aDetailsDTO.getAccount_id(), aDetailsDTO.getAccount_firstName(),
					aDetailsDTO.getAccount_lastName(), null, aDetailsDTO.getAccount_address(),
					aDetailsDTO.getAccount_birthday(), aDetailsDTO.getAccount_organization(), 0,
					aDetailsDTO.getAccount_bank(), aDetailsDTO.getAccount_bankname());
		} else {

			accService.updateAccountDetailsByUser(aDetailsDTO.getAccount_id(), aDetailsDTO.getAccount_firstName(),
					aDetailsDTO.getAccount_lastName(), aDetailsDTO.getAccount_address(),
					aDetailsDTO.getAccount_birthday(), aDetailsDTO.getAccount_organization(),
					aDetailsDTO.getAccount_name(), aDetailsDTO.getAccount_phone(), aDetailsDTO.getAccount_bank(),
					aDetailsDTO.getAccount_bankname());
		}
		_mvShare.addObject("messageUser", "Cập nhật thành công !!!");
		_mvShare.setViewName("redirect:cap-nhat?username=" + aDetailsDTO.getAccount_name());
		return _mvShare;
	}

	@RequestMapping(value = "/tai-khoan/thanh-toan", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
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
		if (acc.getAccount_password().equals(md5Pass)) {
			accService.updatePasswordByUsername(md5NewPass, username);
			_mvShare.addObject("messagePass",
					"Mật khẩu đã được thay đổi thành công - Vui lòng đăng nhập lại hoặc tiếp tục !");
		}
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/manageUser/security");

		return _mvShare;
	}

	@RequestMapping(value = "/tai-khoan/uploadfile", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("thisfile") CommonsMultipartFile file, @RequestParam("id") String id,
			@RequestParam("username") String username, HttpSession s, Model mod) {
		byte[] data = file.getBytes();
		String filePath = s.getServletContext().getRealPath("/") + "resources" + File.separator + "image"
				+ File.separator + file.getOriginalFilename();
		System.out.println(filePath);
		try {
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);
			fileout.close();
			// mod.addAttribute("imgName", file.getOriginalFilename());
			if (accService.getAccountDetailsByUsername(username).getAccount_id() == 0) {
				accService.addAccountDetailsByUser(Integer.parseInt(id), "", "", file.getOriginalFilename(), "", "", "",
						0, "", "");
			} else {
				accService.uploadAvatar(file.getOriginalFilename(), id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail to upload");
		}

		mod.addAttribute("messageUser", "Cập nhật thành công !!!");
		return "redirect:/tai-khoan/cap-nhat?username=" + username;
	}
}
