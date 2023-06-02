package com.sonhtFX17102.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Service;

/*
 * CustomLogoutSuccessHandlerImpl là 1 bean để dependency injection 
 * vào thuộc tính success-handler-ref="customLogoutSuccessHandler"
 * của thẻ logout trong cấu hình spring security
 */
public class CustomLogoutSuccessHandlerImpl implements LogoutSuccessHandler{
	/*
	 * method onLogoutSuccess triển khai cụ thể cho interface LogoutSuccessHandler
	 * dùng để tùy chỉnh url khi 1 account logout thành công gửi theo param usermail
	 * redirect tới url thay đổi trạng thái từ online -> offline
	 */
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
//		System.out.println("The user " + authentication.getName() + " has logged out.");
		response.sendRedirect(request.getContextPath()+"/logout-success?username=" + authentication.getName());
	}

}
