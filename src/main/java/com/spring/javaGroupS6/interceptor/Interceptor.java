package com.spring.javaGroupS6.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.javaGroupS6.service.ShopService;
import com.spring.javaGroupS6.vo.ShopVO;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	ShopService shopService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
//		관리자 : 0 | 고객 : 1 | 업체 : 2 | 탈퇴 예정 99
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 999 : (int)session.getAttribute("sLevel");
		
		Cookie[] cookies = request.getCookies();
		String productList = "";
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cShop")) {
					productList = cookies[i].getValue();
					if(productList.indexOf(":") != -1) productList = productList.substring(0, productList.length()-1);
					break;
				}
			}
		}
		List<ShopVO> cookieVos = new ArrayList<ShopVO>();
		
		if (productList != null && !productList.isEmpty()) {
	    String[] cookieArr = productList.split(":");
	    for (int i = 0; i < cookieArr.length; i++) {
	        if (cookieArr[i] != null && !cookieArr[i].isEmpty()) { // 값 검증
	            try {
	                int productId = Integer.parseInt(cookieArr[i]);
	                if (cookieVos.size() < 3) {
	                    ShopVO vo = shopService.getShopContent(productId);
	                    cookieVos.add(vo);
	                }
	            } catch (NumberFormatException e) {
	                System.err.println("Invalid number format: " + cookieArr[i]);
	            }
	        }
	    }
		}

		request.setAttribute("cookieVos", cookieVos);
		
		if(level > 999){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/message/leaveUser");
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
}
