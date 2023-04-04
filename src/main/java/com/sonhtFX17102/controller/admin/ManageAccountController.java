package com.sonhtFX17102.controller.admin;

import java.util.List;

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
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.AccountImpl;
import com.sonhtFX17102.service.CircumImpl;

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
//		String action = request.getParameter("action");
//		String roleS = request.getParameter("role");
//		int role = Integer.parseInt(roleS);
//		if(action != null && roleS != null && )
		List<Account> listBanned = accService.getAccountBanned("ban");
		_mvShareAdmin.addObject("listBanned", listBanned);
		_mvShareAdmin.addObject("listTop5Account", accService.getPagingPage(index));
		_mvShareAdmin.addObject("endPage", endPage);
		_mvShareAdmin.addObject("tag", index);
		return _mvShareAdmin;
	}
	@RequestMapping(value= "cap-nhat-tai-khoan", method = RequestMethod.GET)
	public ModelAndView editAccount(@RequestParam("id") int id) {
		Account acc = accService.getAccountByID(id);
		_mvShareAdmin.addObject("accountByID", acc);
		_mvShareAdmin.setViewName("admin/account/editAccount");
		return _mvShareAdmin;
	}
	@RequestMapping(value= "admin/cap-nhat-tai-khoan", method = RequestMethod.POST)
	public String doEditAccount(HttpServletRequest request) {
		String roleS = request.getParameter("account_role");
		int role = Integer.parseInt(roleS);
		String mail = request.getParameter("account_mail").trim();
		String name = request.getParameter("account_name");
		String phone = request.getParameter("account_phone");
		String pass = request.getParameter("account_password");
		String md5Pass = DigestUtils.md5Hex(pass).toUpperCase();
		String status = request.getParameter("account_status");
		
		Account account = new Account(role, mail, name, phone, 0, md5Pass, status);
		System.out.println(account.toString());
		account = accService.checkAccountByMailExist(mail);
		try {
			accService.updateAccount(account.getAccount_id(),role, mail, name, phone, 0, md5Pass, status);
			return "redirect:quan-ly-tai-khoan";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Cập nhật thất bại - Mail đã tồn tại vui lòng thử lại !!!");
		}
		return "redirect:cap-nhat-tai-khoan";
	}
	@RequestMapping(value= "them-tai-khoan", method = RequestMethod.POST)
	public ModelAndView doAddAccount(HttpServletRequest request) {
		String roleS = request.getParameter("account_role");
		int role = Integer.parseInt(roleS);
		String mail = request.getParameter("account_mail").trim();
		String name = request.getParameter("account_name");
		String phone = request.getParameter("account_phone");
		String pass = request.getParameter("account_password");
		String md5Pass = DigestUtils.md5Hex(pass).toUpperCase();
		Account account = new Account(role, mail, name, phone, 0, md5Pass, "online");
		
		//System.out.println(account.toString());
		account = accService.checkAccountByMailExist(mail);
		
		if (account == null) {
			try {
				accService.insertAccount(role, mail, name, phone, 0, md5Pass, "online");
				_mvShareAdmin.setViewName("admin/account/manageAccount");
				//return "redirect:quan-ly-tai-khoan";
			} catch (Exception e) {
				e.printStackTrace();
				_mvShareAdmin.addObject("mess", "Thêm mới thất bại - Mail đã tồn tại vui lòng thử lại !!!");
				_mvShareAdmin.setViewName("admin/account/addAccount");
			}

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
