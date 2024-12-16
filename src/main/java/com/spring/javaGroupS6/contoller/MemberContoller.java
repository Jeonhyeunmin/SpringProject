package com.spring.javaGroupS6.contoller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaGroupS6.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	
	@GetMapping("/login")
	public String loginGet() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginPost(HttpSession session, String mid, String pwd) {
		if(mid.equals("admin") && pwd.equals("1234")) {
			session.setAttribute("sMid", mid);
		}
		return "redirect:/";
	}
	@GetMapping("/logout")
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/join")
	public String joinGet(MemberVO vo) {
		
		return "redirect:/";
	}
}
