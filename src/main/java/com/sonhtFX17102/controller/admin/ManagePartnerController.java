package com.sonhtFX17102.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.impl.PartnerImpl;

@Controller
@RequestMapping(value = "admin")
public class ManagePartnerController extends BaseController {
	private PartnerImpl partnerService;

	@Autowired
	public ManagePartnerController(PartnerImpl partnerService) {
		this.partnerService = partnerService;
	}

	@RequestMapping(value = "quan-ly-doi-tac", method = RequestMethod.GET)
	public ModelAndView managePartner(HttpServletRequest request) {
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		String indexPage = request.getParameter("trang");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		int countPage = partnerService.getCountAllPartner();
		int endPage = countPage / 5;
		if (countPage % 5 != 0) {
			endPage++;
		}
		String action = request.getParameter("action");
		String idS = request.getParameter("id");
		int id;
		if (action != null && idS != null && action.equals("deletePartner")) {
			id = Integer.parseInt(idS);
			partnerService.deletePartnerById(id);
		}
		_mvShareAdmin.addObject("listTop5Partner", partnerService.getPagingPage(index));
		_mvShareAdmin.addObject("endPage", endPage);
		_mvShareAdmin.addObject("tag", index);
		return _mvShareAdmin;
	}

	@RequestMapping(value = "cap-nhat-doi-tac", method = RequestMethod.GET)
	public ModelAndView editPartner(@RequestParam("id") int id) {
		Partner partner = partnerService.getPartnerById(id);
		_mvShareAdmin.addObject("partner", partner);
		_mvShareAdmin.setViewName("admin/partner/editPartner");
		return _mvShareAdmin;
	}

	@RequestMapping(value = "cap-nhat-doi-tac", method = RequestMethod.POST)
	public String doEditPartner(HttpServletRequest request) {
		String name = request.getParameter("partner_name");
		String slogan = request.getParameter("partner_slogan");
		String logo = request.getParameter("partner_logo");
		String banner = request.getParameter("partner_banner");
		String number_donateS = request.getParameter("partner_number_donate");
		String total_moneyS = request.getParameter("partner_total_money");
		String introduce = request.getParameter("partner_introduce");
		String content = request.getParameter("partner_content");
		String status = request.getParameter("partner_status");
		String idS = request.getParameter("partner_id");

		partnerService.updatePartnerById(Integer.parseInt(idS), name, slogan, logo, banner,
				Integer.parseInt(number_donateS), Integer.parseInt(total_moneyS), introduce, content, status);

		return "redirect:quan-ly-doi-tac";
	}

	@RequestMapping(value = "them-doi-tac", method = RequestMethod.GET)
	public ModelAndView addPartner() {
		_mvShareAdmin.setViewName("admin/partner/addPartner");
		return _mvShareAdmin;
	}

	@RequestMapping(value = "them-doi-tac", method = RequestMethod.POST)
	public ModelAndView doAddPartner(HttpServletRequest request) {
		String name = request.getParameter("partner_name");
		String slogan = request.getParameter("partner_slogan");
		String logo = request.getParameter("partner_logo");
		String banner = request.getParameter("partner_banner");
		String numS = request.getParameter("partner_number_donate");
		int num = Integer.parseInt(numS);
		String moneyS = request.getParameter("partner_total_money");
		int money = Integer.parseInt(moneyS);
		String des = request.getParameter("partner_introduce");
		String content = request.getParameter("partner_content");
		Partner partner = new Partner(name, slogan, logo, banner, num, money, des, content, "active");
		System.out.println(partner);
		partner = partnerService.checkPartnerByNameExist(name);

		if (partner == null) {
			try {
				partnerService.insertPartner(name, slogan, logo, banner, num, money, des, content, "active");
				_mvShareAdmin.setViewName("admin/partner/managePartner");

			} catch (Exception e) {
				request.setAttribute("message", "Thêm mới thất bại - Đối tác này đã tồn tại vui lòng thử lại !!!");
				_mvShareAdmin.setViewName("admin/partner/addPartner");
			}

		}
		return _mvShareAdmin;
	}
}
