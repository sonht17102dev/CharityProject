package com.sonhtFX17102.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.CircumOrder;
import com.sonhtFX17102.service.impl.CircumImpl;
import com.sonhtFX17102.service.impl.PartnerImpl;
import com.sonhtFX17102.service.impl.PayImpl;

@Controller
@RequestMapping("admin")
public class ManagePaymentController extends BaseController{
	@Autowired
	PayImpl payService;
	
	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String changePayment(HttpServletRequest request) {
		String action = request.getParameter("type");
		String idS = request.getParameter("id");
		int id;
		if (action != null && idS != null && action.equals("pending")) {
			id = Integer.parseInt(idS);
			payService.updateStatusById("pending",id);
		} else if (action.equals("paid")) {
			id = Integer.parseInt(idS);
			payService.updateStatusById("paid",id);
		}
		request.setAttribute("messagePayment", "Cập nhật trạng thái thành công!!!");
		return "admin/payment/managePayment";
	}
	@RequestMapping(value = "quan-ly-thanh-toan", method = RequestMethod.GET)
	public ModelAndView managePayment(HttpServletRequest request) {
		_mvShareAdmin.setViewName("admin/payment/managePayment");
		String indexPage = request.getParameter("trang");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		int countPage = payService.getCountAllPayment();
		int endPage = countPage / 5;
		if (countPage % 5 != 0) {
			endPage++;
		}
		
		_mvShareAdmin.addObject("listTop5Payment", payService.getPagingPage(index));
		_mvShareAdmin.addObject("endPage", endPage);
		_mvShareAdmin.addObject("tag", index);
		return _mvShareAdmin;
	}
}
