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
		String name = (String)session.getAttribute("sName");
		if(msgFlag.equals("loginOk")) {
			model.addAttribute("message", name + "님 반갑습니다.");
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
		
		return "include/message";
	}
	
}
