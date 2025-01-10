package com.spring.javaGroupS6.contoller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.PartnerService;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;

@RequestMapping("/partner")
@Controller
public class PartnerContoller {
	@Autowired
	PartnerService partnerService;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping("/myPage")
	public String myPageGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getCompany() + "님");
		return "partner/partnerPage";
	}
	

}
