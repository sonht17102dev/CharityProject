package com.sonhtFX17102.controller;

import java.util.Random;

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
	// Phương thức tạo mật khẩu ngẫu nhiên
	public String generateRandomPassword(int length) {
	    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+{}[];:<>,.?/";
	    StringBuilder sb = new StringBuilder();
	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        int index = random.nextInt(chars.length());
	        sb.append(chars.charAt(index));
	    }
	    return sb.toString();
	}
}
