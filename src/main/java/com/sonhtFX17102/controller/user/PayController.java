package com.sonhtFX17102.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.CircumOrder;
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
	
	@RequestMapping(value = "quyen-gop", method = RequestMethod.GET)
	public ModelAndView cart(@RequestParam("id") int id) {
		Circum circum = circumService.getCircumById(id);
		String logoPartner = partnerService.getPartnerById(id).getPartner_logo();
		
		_mvShare.addObject("circum", circum);
		_mvShare.addObject("logoPartner", logoPartner);
		_mvShare.setViewName("user/cart/cart");
		return _mvShare;
	}
	@RequestMapping(value = "quyen-gop", method = RequestMethod.POST)
	public String pay(HttpServletRequest request, HttpSession session) {
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
		try {
			cId = Integer.parseInt(cIdString);
			amount = Integer.parseInt(amountS);
//			CircumOrder c = new CircumOrder(cId, name, mail, phone, bank, bankName, address, amount, date);
//			System.out.println(c.toString());
			payService.insertPayInfo(cId, name, mail, phone, bank, bankName, address, amount, date);
			return "redirect:/";
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "Fail");
			return "redirect:quyen-gop?id="+cId;
		}
	}
}
