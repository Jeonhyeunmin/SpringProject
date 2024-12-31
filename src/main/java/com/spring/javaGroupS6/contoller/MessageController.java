package com.spring.javaGroupS6.contoller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String getMessage(Model model, HttpSession session, 
			@PathVariable String msgFlag,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="idx", defaultValue = "0", required = false) int idx
		) {
		
		String company = (String)session.getAttribute("sCompany");
		String name = (String)session.getAttribute("sName");
		int level = (int)session.getAttribute("sLevel");
		
		if(level == 1&& msgFlag.equals("loginOk")) {
			model.addAttribute("message", name + "님 반갑습니다.");
			model.addAttribute("url", "/");
		}
		else if((level == 2 || level == 3) && msgFlag.equals("loginOk")) {
			model.addAttribute("message", company + "님 반갑습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("loginNo")) {
			model.addAttribute("message", "회원님 로그인 실패");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("joinOk")) {
			model.addAttribute("message", "회원가입 성공 \n다시 로그인해주세요");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("joinNo")) {
			model.addAttribute("message", "회원가입 실패");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("partnerJoinOk")) {
			model.addAttribute("message", "파트너 신청이 완료되었습니다 \n관리자 승인 후 게시물 등록 가능합니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("partnerJoinOk")) {
			model.addAttribute("message", "파트너 신청이 완료되었습니다 \n관리자 승인 후 게시물 등록 가능합니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("partnerJoinNo")) {
			model.addAttribute("message", "신청 실패");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("myPageNo")) {
			model.addAttribute("message", "누구세요~?");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("shopUpdateOk")) {
			model.addAttribute("message", "게시물 업데이트 완료");
			model.addAttribute("url", "/shop/shopContent?idx=" + idx);
		}
		else if(msgFlag.equals("shopUpdateNo")) {
			model.addAttribute("message", "게시물 업데이트 실패");
			model.addAttribute("url", "/shop/shopUpdate?idx=" + idx);
		}
		
		return "include/message";
	}
	
}
