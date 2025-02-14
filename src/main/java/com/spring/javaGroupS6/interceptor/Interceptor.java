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
		
	  String uri = request.getRequestURI();
    if (uri.matches(".*\\.(png|jpg|jpeg|gif|svg|webp)$")) {
        return true; // 이미지 요청은 바로 통과
    }
		
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
		
		ArrayList<ShopVO> BestVosTop3 = shopService.getBestShopTop3();
		ArrayList<ShopVO> dateVosTop3 = shopService.getdateShopTop3();
		
		request.setAttribute("dateVosTop3", dateVosTop3);
		request.setAttribute("BestVosTop3", BestVosTop3);
		request.setAttribute("cookieVos", cookieVos);
		
		return true;
	}
}
