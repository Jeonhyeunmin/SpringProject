package com.spring.javaGroupS6.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
//		관리자 : 0 | 고객 : 1 | 업체 : 2 | 탈퇴 예정 99
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 999 : (int)session.getAttribute("sLevel");
		
		
		if(level == 99){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/message/leaveUser");
			dispatcher.forward(request, response);
			return false;
		}
		else if(level > 99){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/message/loginError");
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
}
