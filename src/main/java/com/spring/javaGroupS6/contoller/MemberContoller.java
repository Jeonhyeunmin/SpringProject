package com.spring.javaGroupS6.contoller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.MemberService;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	@Autowired
	JavaProvide provide;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping("/myPage")
	public String myPageGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		ArrayList<CouponVO> couponVOS = memberService.getMyCoupon(mid);
		
		model.addAttribute("couponVOS", couponVOS);
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getName() + "님");
		return "member/customerPage";
	}
	@GetMapping("memberUpdate")
	public String memberUpdateGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getName() + "님 정보수정");
		return "member/memberUpdate";
	}
	
	
}
