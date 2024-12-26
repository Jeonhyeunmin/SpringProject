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
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;

@RequestMapping("/common")
@Controller
public class CommonContoller {
	@Autowired
	JavaProvide provide;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping("/login")
	public String loginGet() {
		return "common/login";
	}
	
	@PostMapping("/login")
	public String loginPost(Model model, HttpSession session, String mid, String pwd) {
		MemberVO memberVO = commonService.getMemberIdSearch(mid);
		PartnerVO partnerVO = commonService.getPartnerIdSearch(mid);
		
		if(memberVO != null && (memberVO.getMid().equals(mid) && memberVO.getPwd().equals(pwd))) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", memberVO.getLevel());
			session.setAttribute("sName", memberVO.getName());
			return "redirect:/message/loginOk";
		}
		else if (partnerVO != null && (partnerVO.getMid().equals(mid) && partnerVO.getPwd().equals(pwd))) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", partnerVO.getLevel());
			session.setAttribute("sCompany", partnerVO.getCompany());
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
		int res = commonService.setMemberJoin(vo);
		if(res != 0) {
			return "redirect:/message/joinOk";
		}
		else {
			return "redirect:/message/joinNo";
		}
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
	
	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.GET)
	public String memberIdCheckGet(Model model, String mid) throws MessagingException {
		MemberVO memberVO = commonService.getMemberIdSearch(mid);
		PartnerVO partnerVO = commonService.getPartnerIdSearch(mid); 
		if(memberVO == null && partnerVO == null) {
			model.addAttribute("midCheck", "Yes");
			model.addAttribute("mid", mid);
		}
		else {
			model.addAttribute("midCheck", "No");
			model.addAttribute("mid", mid);
		}
		return "common/memberIdCheck";
	}
	
	@RequestMapping(value = "/companyCheck", method = RequestMethod.GET)
	public String companyCheckGet(Model model, String company) throws MessagingException {
		PartnerVO partnerVO = commonService.getPartnerSearch(company); 
		if(partnerVO == null) {
			model.addAttribute("companyCheck", "Yes");
			model.addAttribute("company", company);
		}
		else {
			model.addAttribute("companyCheck", "No");
			model.addAttribute("mid", company);
		}
		return "common/companyCheck";
	}
	
	@GetMapping("/partnerJoin")
	public String partnerJoinGet() {
		return "common/partnerJoin";
	}
	
	@PostMapping("/partnerJoin")
	public String partnerJoinPost(MultipartFile file, PartnerVO vo) {
		int res = commonService.setpartnerJoin(file, vo);
		if(res != 0) return "redirect:/message/partnerJoinOk";
		else return "redirect:/message/partnerJoinNo";
	}
	
	@GetMapping("/myPage")
	public String myPageGet(Model model, HttpSession session) {
		int level = (int)session.getAttribute("sLevel");
		String mid = (String)session.getAttribute("sMid");
		if(level == 1) {
			MemberVO memberVO = commonService.getMemberIdSearch(mid);
			model.addAttribute("vo", memberVO);
			return "common/customerPage";
		}
		else if(level == 2 || level == 3) {
			PartnerVO partnerVO = commonService.getPartnerIdSearch(mid);
			model.addAttribute("vo", partnerVO);
			return "common/partnerPage";
		}
		else {
			return "redirect:/message/myPageNo";
		}
		
	}
}
