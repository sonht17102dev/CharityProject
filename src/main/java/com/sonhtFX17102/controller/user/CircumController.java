package com.sonhtFX17102.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.DTO.CircumDTO;
import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.impl.CircumImpl;

@Controller
public class CircumController extends BaseController {
	@Autowired
	private CircumImpl circumService;

	@RequestMapping(value = "/nhung-hoan-canh", method = RequestMethod.GET)
	public ModelAndView circum(HttpServletRequest request) {

		_mvShare.setViewName("user/cause/cause");

		String indexPage = request.getParameter("trang");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		int countPage = circumService.getCountAllCircums();
		int endPage = countPage / 6;
		if (countPage % 6 != 0) {
			endPage++;
		}
		List<Circum> list = circumService.getPagingPage(index);
		for (Circum circum : list) {
			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}
		_mvShare.addObject("endPage", endPage);
		_mvShare.addObject("tag", index);
		_mvShare.addObject("listTop6Circum", list);
		_mvShare.addObject("category", category);
		return _mvShare;
	}


	@RequestMapping(value = "/hoan-canh-chi-tiet")
	public ModelAndView circum_detail(@RequestParam("id") int id) {
		CircumDTO circumDetail = (CircumDTO) circumService.getCircumDetailsById(id);
		String[] img = circumDetail.getCircum_image().split(",");
		List<Circum> list = circumService.getTop3Circums();
		for (Circum circum : list) {
			String[] banner_img = circum.getCircum_image().split(",");
			circum.setCircum_image(banner_img[0]);
		}

		_mvShare.addObject("listTop3Circum", list);
		_mvShare.addObject("circumDetail", circumDetail);
		_mvShare.addObject("img", img);
		_mvShare.setViewName("user/cause/cause_detail");
		return _mvShare;
	}

}
