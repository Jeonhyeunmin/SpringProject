package com.spring.javaGroupS6.contoller;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.MemberService;
import com.spring.javaGroupS6.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	@Autowired
	JavaProvide provide;
	
	@Autowired
	MemberService memberservice;
	
	
	@GetMapping("/login")
	public String loginGet() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginPost(Model model, HttpSession session, String mid, String pwd) {
		MemberVO vo = memberservice.getMemberIdSearch(mid);
		
		if(mid.equals(vo.getMid()) && pwd.equals(vo.getPwd())) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sNickName", vo.getNickName());
			model.addAttribute("mid", mid);
			return "redirect:/message/loginOk";
		}
		else {
			return "redirect:/message/loginNo";
		}
		
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
		System.out.println("emailKey : " + emailKey);
		System.out.println("checkKey : " + checkKey);
		if(emailKey.equals(checkKey)) {
			return "1";
		}
		else {
			return "2";
			
		}
	}
	
	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.GET)
	public String memberIdCheckGet(Model model, String mid) throws MessagingException {
		model.addAttribute("mid", mid);
		return "member/memberIdCheck";
	}
}
