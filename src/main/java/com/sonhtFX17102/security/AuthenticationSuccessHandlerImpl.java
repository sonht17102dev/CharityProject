package com.sonhtFX17102.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

/*
 * AuthenticationSuccessHandlerImpl là 1 bean để dependency injection 
 * vào thuộc tính authentication-success-handler-ref="authenticationSuccessHandler" 
 * của thẻ form-login trong cấu hình spring security
 */
public class AuthenticationSuccessHandlerImpl extends SimpleUrlAuthenticationSuccessHandler {
	/*
	 * Phương thức onAuthenticationSuccess được implement từ interface AuthenticationSuccessHandler
	 * dùng để tùy chỉnh url loginSuccess truyển param redirect tới url thay đổi trường status
	 */
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
		String username = authentication.getName();
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        if (roles.contains("ROLE_ADMIN")) {
        	response.sendRedirect("/CharityApp/admin/loginSuccess?username="+username);
        } else if (roles.contains("ROLE_USER")) {
        	response.sendRedirect("/CharityApp/trang-chu/loginSuccess?username="+username);
        } else {
	        super.onAuthenticationSuccess(request, response, authentication);
	        return;
        }
    }
}
