package com.sonhtFX17102.controller.search.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.CircumOrder;
import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.impl.AccountImpl;
import com.sonhtFX17102.service.impl.CircumImpl;
import com.sonhtFX17102.service.impl.NewsImpl;
import com.sonhtFX17102.service.impl.PartnerImpl;
import com.sonhtFX17102.service.impl.PayImpl;

@Controller
@RequestMapping(value = "admin")
public class SearchAdminController extends BaseController{
	@Autowired
	private AccountImpl accoutService;
	@Autowired
	private CircumImpl circumService;
	@Autowired
	private PartnerImpl partnerService;
	@Autowired
	private NewsImpl newsService;
	@Autowired
	private PayImpl payService;
	
	@RequestMapping(value = "/search-account", method = RequestMethod.GET)
	public ModelAndView searchByRole(@RequestParam("role") String role) {
		List<Account> list = new ArrayList<>();
		if(role!=null && role.equals("ADMIN")) {
			list = accoutService.getAccountsByRole("ADMIN");
		} else if (role.equals("USER")) {
			list = accoutService.getAccountsByRole("USER");
		}
		_mvShareAdmin.addObject("listTop5Account", list);
		_mvShareAdmin.setViewName("admin/account/manageAccount");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-account", method = RequestMethod.POST)
	public ModelAndView searchAccountByKey(@RequestParam("nav-search-input") String key) {
		List<Account> list = accoutService.getAccountsByKey(key);
		_mvShareAdmin.addObject("listTop5Account", list);
		_mvShareAdmin.setViewName("admin/account/manageAccount");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/searchAccountInactive", method = RequestMethod.GET)
	public ModelAndView findAccountsUnabled() {
		List<Account> list = accoutService.getAccountEnabled(0);
		_mvShareAdmin.addObject("listTop5Account", list);
		_mvShareAdmin.setViewName("admin/account/manageAccount");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/searchCircum", method = RequestMethod.GET)
	public ModelAndView findByStatusCircum(@RequestParam("status") String status) {
		List<Circum> list = circumService.findCircumsInactive(status);
		
		_mvShareAdmin.addObject("listTop10Circum", list);
		_mvShareAdmin.addObject("category", category);
		_mvShareAdmin.setViewName("admin/circum/manageCircum");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView findByCategoryCircum(@RequestParam("type") String type) {
		List<Circum> list = new ArrayList<>();
		if(type != null && type.equalsIgnoreCase(category[0].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[1].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[2].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[3].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[4].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[5].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[6].trim())) {
			list = circumService.findByCategory(type);
		}
		else if(type != null && type.equalsIgnoreCase(category[7].trim())) {
			list = circumService.findByCategory(type);
		}
		_mvShareAdmin.addObject("listTop10Circum", list);
		_mvShareAdmin.addObject("category", category);
		_mvShareAdmin.setViewName("admin/circum/manageCircum");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView findByNameCircum(HttpServletRequest request) {
		String name = request.getParameter("nav-search-input");
		List<Circum> list = circumService.findByName(name);
		_mvShareAdmin.addObject("listTop10Circum", list);
		_mvShareAdmin.addObject("category", category);
		_mvShareAdmin.setViewName("admin/circum/manageCircum");
		return _mvShareAdmin;
	} 
	@RequestMapping(value="/searchPartner", method = RequestMethod.GET)
	public ModelAndView findPartnerInactive(@RequestParam("status") String status) {
		List<Partner> list = partnerService.findPartnersInactive(status);
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-partner", method = RequestMethod.POST)
	public ModelAndView searchPartnerByKey(@RequestParam("nav-search-input") String key) {
		List<Partner> list = partnerService.getPartnersByKey(key);
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-money", method = RequestMethod.GET)
	public ModelAndView searchMoney() {
		List<Partner> list = partnerService.getPartnerByMoney();
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-project", method = RequestMethod.GET)
	public ModelAndView searchProject() {
		List<Partner> list = partnerService.getPartnerByProject();
		_mvShareAdmin.addObject("listTop5Partner", list);
		_mvShareAdmin.setViewName("admin/partner/managePartner");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/searchYear", method = RequestMethod.GET)
	public ModelAndView searchYear(@RequestParam("year") String year) {
		List<News> list = newsService.getNewsByYear(year);
		_mvShareAdmin.addObject("listTop6News", list);
		_mvShareAdmin.setViewName("admin/news/manageNews");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/searchNews", method = RequestMethod.GET)
	public ModelAndView findNewsInactive(@RequestParam("status") String status) {
		List<News> list = newsService.findNewsInactive(status);
		_mvShareAdmin.addObject("listTop6News", list);
		_mvShareAdmin.setViewName("admin/news/manageNews");
		return _mvShareAdmin;
	}
	@RequestMapping(value = "/search-news", method = RequestMethod.POST)
	public ModelAndView searchNewsByKey(@RequestParam("nav-search-input") String key) {
		List<News> list = newsService.getNewsByKey(key);
		_mvShareAdmin.addObject("listTop6News", list);
		_mvShareAdmin.setViewName("admin/news/manageNews");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value = "/search-payment", method = RequestMethod.POST)
	public ModelAndView findByName(HttpServletRequest request) {
		String keyword = request.getParameter("nav-search-input");
		List<CircumOrder> list = payService.findByName(keyword);
		_mvShareAdmin.addObject("listTop5Payment", list);
		_mvShareAdmin.setViewName("admin/payment/managePayment");
		return _mvShareAdmin;
	} 
	@RequestMapping(value = "/searchOrder", method = RequestMethod.GET)
	public ModelAndView findOrderInactive(@RequestParam("status") String status) {
		List<CircumOrder> list = payService.findOrderInactive(status);
		_mvShareAdmin.addObject("listTop5Payment", list);
		_mvShareAdmin.setViewName("admin/payment/managePayment");
		return _mvShareAdmin;
	}
	
	@RequestMapping(value = "/searchByStatus", method = RequestMethod.GET)
	public ModelAndView findPaymentByType(@RequestParam("type") String typeStatus) {
//		List<CircumOrder> list = new ArrayList<>();
//		if(type != null && type.equalsIgnoreCase(category[0].trim())) {
//			list = circumService.findByCategory(type);
//		}
//		else if(type != null && type.equalsIgnoreCase(category[1].trim())) {
//			list = circumService.findByCategory(type);
//		}
		List<CircumOrder> list = payService.findPaymentByType(typeStatus);
		_mvShareAdmin.addObject("listTop5Payment", list);
		_mvShareAdmin.setViewName("admin/payment/managePayment");
		return _mvShareAdmin;
	}
}
