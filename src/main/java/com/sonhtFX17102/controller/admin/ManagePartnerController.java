package com.sonhtFX17102.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.News;
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
	public ModelAndView editPartner(@RequestParam("id") int id, Model model) {
		Partner partner = partnerService.getPartnerById(id);
		model.addAttribute("partner", partner);
		List<String> listStatus = new ArrayList<>();
		listStatus.add("active");
		listStatus.add("inactive");
		model.addAttribute("listStatus", listStatus);
		_mvShareAdmin.setViewName("admin/partner/editPartner");
		return _mvShareAdmin;
	}

	@RequestMapping(value = "cap-nhat-doi-tac", method = RequestMethod.POST)
	public String doEditPartner(HttpServletRequest request, @ModelAttribute("partner") Partner p) {
		System.out.println(p.toString());
		partnerService.updatePartnerById(p.getPartner_id(), p.getPartner_name(), p.getPartner_slogan(),
				p.getPartner_logo(), p.getPartner_banner(), p.getPartner_number_donate(),
				p.getPartner_total_money(), p.getPartner_introduce(), p.getPartner_content(), p.getPartner_status());
		request.setAttribute("messagePartner", "Cập nhật thành công !!!");
		return "admin/partner/managePartner";
	}

	@RequestMapping(value = "them-doi-tac", method = RequestMethod.GET)
	public ModelAndView addPartner(Model model) {
		model.addAttribute("partner", new Partner());
		_mvShareAdmin.setViewName("admin/partner/addPartner");
		return _mvShareAdmin;
	}

	@RequestMapping(value = "them-doi-tac", method = RequestMethod.POST)
	public ModelAndView doAddPartner(HttpServletRequest request,@ModelAttribute("partner") Partner partner,
			Model model) {
		Partner partnerExisted = partnerService.checkPartnerByNameExist(partner.getPartner_name());
		if (partnerExisted == null) {
			partnerService.insertPartner(partner.getPartner_name(), partner.getPartner_slogan(),
					partner.getPartner_logo(), partner.getPartner_banner(),
					partner.getPartner_number_donate(), partner.getPartner_total_money(),
					partner.getPartner_introduce(), partner.getPartner_content(), "active");
			request.setAttribute("messagePartner", "Thêm mới thành công !!!");
			_mvShareAdmin.setViewName("admin/partner/managePartner");
		} else {
			request.setAttribute("messagePartner", "Thêm mới thất bại - Đối tác này đã tồn tại vui lòng thử lại !!!");
			_mvShareAdmin.setViewName("admin/partner/addPartner");
		}
		return _mvShareAdmin;
	}
}
