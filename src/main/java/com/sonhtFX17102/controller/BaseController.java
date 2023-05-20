package com.sonhtFX17102.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BaseController {
	
	
	@Autowired
	public JavaMailSender emailSender;
	
	public ModelAndView _mvShare = new ModelAndView();
	public ModelAndView _mvShareAdmin = new ModelAndView();
	public String[] category = { "Vì Trẻ Em", "Người Già, Người Khuyết Tật", "Bệnh Hiểm Nghèo", "Hoàn Cảnh Khó Khăn",
			"Hỗ Trợ Giáo Dục", "Đầu Tư Cơ Sở Vật Chất", "Cứu Trợ Động Vật", "Bảo Vệ Môi Trường" };
	// Phương thức tạo mật khẩu ngẫu nhiên
	public String generateRandomPassword(int length) {
//	    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+{}[];:<>,.?/";
	    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder sb = new StringBuilder();
	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        int index = random.nextInt(chars.length());
	        sb.append(chars.charAt(index));
	    }
	    return sb.toString();
	}
	
	
	
	public void sendEmail(String from,String to, String subject, String content) {
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom(from);
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(content);
		
		this.emailSender.send(mailMessage);
	}

	public String splitImage(String input) {
		String result = "";
		// Tìm vị trí đầu tiên của thẻ <img>
		int firstImgTagIndex = input.indexOf("<img");

		// Tìm vị trí của ký tự '>' sau thẻ <img> đầu tiên
		int closingBracketIndex = input.indexOf(">", firstImgTagIndex);

		// Kiểm tra xem có tìm thấy thẻ <img> và ký tự '>' hay không
		if (firstImgTagIndex != -1 && closingBracketIndex != -1) {
		    // Lấy chuỗi con chứa thẻ <img> đầu tiên
		    result = input.substring(firstImgTagIndex, closingBracketIndex + 1);
		}    

		    
		return result;
	}
	
	public String removeStyle(String input) {
		return input.replaceAll("style=\"[^\"]*\"", "");
	}
}
