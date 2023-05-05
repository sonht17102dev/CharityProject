package com.sonhtFX17102.controller.admin;

import java.util.List;

import javax.servlet.ServletRequest;
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
@RequestMapping(value = "admin")
public class ManageAccountController extends BaseController{
	@Autowired
	private AccountImpl accService;
	
	@RequestMapping(value= "quan-ly-tai-khoan", method = RequestMethod.GET)
	public ModelAndView manageAccount(HttpServletRequest request) {
		_mvShareAdmin.setViewName("admin/account/manageAccount");
		
		String indexPage = request.getParameter("trang");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		int countPage = accService.getCountAllAccount();
		int endPage = countPage / 5;
		if (countPage % 5 != 0) {
			endPage++;
		}
		String action = request.getParameter("action");
		String roleS = request.getParameter("role");
		String idS = request.getParameter("id");
		int id;
		if(action != null && roleS != null && idS != null && action.equals("deleteAccount")) {
			if(!roleS.equals("ADMIN")) {
				id = Integer.parseInt(idS);
				accService.deleteAccountById(id);
			}
		}
		List<Account> listBanned = accService.getAccountEnabled(0);
		_mvShareAdmin.addObject("listBanned", listBanned);
		_mvShareAdmin.addObject("listTop5Account", accService.getPagingPage(index));
		_mvShareAdmin.addObject("endPage", endPage);
		_mvShareAdmin.addObject("tag", index);
		_mvShareAdmin.addObject("mess", "");
		return _mvShareAdmin;
	}
	@RequestMapping(value= "cap-nhat-tai-khoan", method = RequestMethod.GET)
	public ModelAndView editAccount(@RequestParam(value="id", required = false) int id) {
		Account acc = accService.getAccountByID(id);
		_mvShareAdmin.addObject("accountByID", acc);
		_mvShareAdmin.setViewName("admin/account/editAccount");
		return _mvShareAdmin;
	}
	@RequestMapping(value= "cap-nhat-tai-khoan", method = RequestMethod.POST)
	public ModelAndView doEditAccount(HttpServletRequest request) {
		String idS = request.getParameter("account_id");
		String mail = request.getParameter("account_mail").trim();
		String name = request.getParameter("account_name");
		String phone = request.getParameter("account_phone");
		int id = Integer.parseInt(idS);
		accService.updateAccount(id, "ADMIN", mail, name, phone);
		_mvShareAdmin.setViewName("redirect:quan-ly-tai-khoan");
		return _mvShareAdmin;
	}
	@RequestMapping(value= "them-tai-khoan", method = RequestMethod.POST)
	public ModelAndView doAddAccount(HttpServletRequest request) {
		String roleS = request.getParameter("account_role");
		String mail = request.getParameter("account_mail").trim();
		String name = request.getParameter("account_name");
		String phone = request.getParameter("account_phone");
		String pass = request.getParameter("account_password");
		String md5Pass = DigestUtils.md5Hex(pass);
		System.out.println(pass);
		Account account = new Account(roleS, mail, name, phone, md5Pass, "offline");
		
		System.out.println(account.toString());
		account = accService.checkAccountByMailExist(mail);
		
		if (account == null) {
			try {
				accService.insertAccount(roleS, mail, name, phone, md5Pass, "offline");
				_mvShareAdmin.setViewName("admin/account/manageAccount");
				//return "redirect:quan-ly-tai-khoan";
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			_mvShareAdmin.addObject("mess", "Thêm mới thất bại - Mail đã tồn tại vui lòng thử lại !!!");
			_mvShareAdmin.setViewName("admin/account/addAccount");
			
		}
		//return "redirect:them-tai-khoan";
		return _mvShareAdmin;
	}
	@RequestMapping(value= "them-tai-khoan", method = RequestMethod.GET)
	public ModelAndView addAccount(HttpServletRequest request) {
		//request.setAttribute("message","");
		_mvShareAdmin.setViewName("admin/account/addAccount");
		return _mvShareAdmin;
	}
	
}
