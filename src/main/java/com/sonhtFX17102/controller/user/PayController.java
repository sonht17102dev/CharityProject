package com.sonhtFX17102.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.DTO.AccountDetailsDTO;
import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.impl.AccountImpl;
import com.sonhtFX17102.service.impl.CircumImpl;
import com.sonhtFX17102.service.impl.PartnerImpl;
import com.sonhtFX17102.service.impl.PayImpl;

@Controller
public class PayController extends BaseController{
	@Autowired
	CircumImpl circumService;
	@Autowired
	PartnerImpl partnerService;
	
	@Autowired
	PayImpl payService;
	@Autowired
	AccountImpl accountService;
	
	@RequestMapping(value = "quyen-gop", method = RequestMethod.GET)
	public ModelAndView confirmPayment(@RequestParam("id") int id, Authentication authentication) {
		Circum circum = circumService.getCircumById(id);
		String logoPartner = partnerService.getPartnerById(circum.getPartner_id()).getPartner_logo();
		if (authentication != null) {
			String username = authentication.getName();
//			System.out.println(username);
			AccountDetailsDTO account = accountService.getAccountDetailsByUsername(username);
			_mvShare.addObject("accountDetails", account);
		}
		_mvShare.addObject("circum", circum);
		_mvShare.addObject("logoPartner", logoPartner);
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/cart/cart");
		return _mvShare;
	}
	@RequestMapping(value = "quyen-gop", method = RequestMethod.POST)
	public String doConfirmPayment(HttpServletRequest request) {
		String cIdString = request.getParameter("circum_id");
		int cId = 0;
		String name = request.getParameter("circum_order_name");
		String mail = request.getParameter("circum_order_mail");
		String phone = request.getParameter("circum_order_phone");
		String amountS = request.getParameter("circum_order_amount");
		int amount = 0;
		String bank = request.getParameter("circum_order_bank");
		String bankName = request.getParameter("circum_order_bankname");
		String address = request.getParameter("circum_order_address");
		String date = request.getParameter("circum_order_date");
		String circumName = request.getParameter("circum_name");
		try {
			cId = Integer.parseInt(cIdString);
			amount = Integer.parseInt(amountS);
			payService.insertPayInfo(cId, name, mail, phone, bank, bankName, address, amount, date, circumName,"pending");
			request.setAttribute("messageDonated", 
					"Cảm ơn bạn đã quyên góp!!\n Mọi đóng góp dù nhỏ cũng là một niềm động viên rất lớn!!!");
			return "user/cart/payment";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:quyen-gop?id="+cId;
		}
	}
	@RequestMapping(value = "thanh-toan", method = RequestMethod.GET)
	public ModelAndView pay() {
		_mvShare.addObject("category", category);
		_mvShare.setViewName("user/cart/payment");
		return _mvShare;
	}
}
