package com.spring.javaGroupS6.contoller;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	@Autowired
	JavaProvide provide;
	
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
	
	@ResponseBody
	@PostMapping("/memberEmailCheck")
	public String memberEmailCheckPost(HttpSession session ,String email, HttpServletRequest request) throws MessagingException {
		String emailKey = UUID.randomUUID().toString().substring(0, 8);
		session.setAttribute("sEmailKey", emailKey);
		provide.mailSend(request, email, "이메일 인증키 입니다.", "인증키 : " + emailKey);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberEmailCheckOk", method = RequestMethod.POST)
	public String memberEmailCheckOkPost(HttpSession session ,String checkKey) throws MessagingException {
		String emailKey = (String) session.getAttribute("sEmailKey");
		if(emailKey.equals(checkKey)) {
			return "1";
		}
		else {
			return "2";
			
		}
	}
}
