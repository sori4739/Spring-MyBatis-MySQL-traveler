package com.traveler.app.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String username = request.getParameter("username");
		String rememberMe = request.getParameter("rememberMe");
		
		if(rememberMe != null) {
			Cookie c = new Cookie("username", username);
			c.setMaxAge(6000);
			response.addCookie(c);
		}else {
			Cookie c = new Cookie("username", null);
			c.setMaxAge(0);
			response.addCookie(c);
		}
		

		response.sendRedirect("/");
		
		
	}

}
