package com.sonhtFX17102.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.service.HomeImpl;

@Controller
public class BaseController {
	@Autowired
	public HomeImpl _homeService;
	
	public ModelAndView _mvShare = new ModelAndView();
	public ModelAndView _mvShareAdmin = new ModelAndView();
	public String[] category = { "Vì Trẻ Em", "Người Già, Người Khuyết Tật", "Bệnh Hiểm Nghèo", "Hoàn Cảnh Khó Khăn",
			"Hỗ Trợ Giáo Dục", "Đầu Tư Cơ Sở Vật Chất", "Cứu Trợ Động Vật", "Bảo Vệ Môi Trường" };
	
}
