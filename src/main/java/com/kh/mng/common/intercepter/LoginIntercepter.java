package com.kh.mng.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session =request.getSession();
		
		if(session.getAttribute("loginUser")!=null) {
			return true;
		}
		else {
			session.setAttribute("alertMsg", "로그인후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		
		
	}
	
	
}
