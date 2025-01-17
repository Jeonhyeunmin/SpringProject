package com.spring.javaGroupS6.contoller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.MemberService;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	@Autowired
	JavaProvide provide;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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
	
	@GetMapping("/header")
	public String headerGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		ArrayList<CouponVO> couponVOS = memberService.getMyCoupon(mid);
		
		model.addAttribute("couponVOS", couponVOS);
		model.addAttribute("vo", vo);
		return "/member/myPageHeader";
	}
	
	@GetMapping("/nav")
	public String navGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		model.addAttribute("vo", vo);
		return "/member/myPageNav";
	}
	
	@GetMapping("/content")
	public String contentGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		ArrayList<ShopOrderVO> orderVOS = memberService.getMyOrder(mid);
		
		model.addAttribute("orderVOS", orderVOS);
		model.addAttribute("vo", vo);
		return "/member/myPageContent";
	}
	
	
	@GetMapping("/memberPwdCheck")
	public String memberPwdCheckGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getName() + "님 정보수정");
		return "/member/memberPwdCheck";
	}
	
	@PostMapping("/pwdCheck")
	public String memberPwdCheckPost(Model model, HttpSession session, String pwd) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		if(passwordEncoder.matches(pwd, vo.getPwd())) {
			model.addAttribute("vo", vo);
			model.addAttribute("title", vo.getName() + "님 정보수정");
			return "/member/memberUpdate";
		}
		else {
			return "redirect:/message/memberPwdCheckNo";
		}
	}
	
	@GetMapping("/memberUpdate")
	public String memberUpdateGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getName() + "님 정보수정");
		return "/member/memberPwdCheck";
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdatePost(HttpSession session, MultipartFile file, MemberVO vo) {
		
		int res = memberService.setMemberUpdate(file, vo, session);
		
		if(res != 0) {
			return "redirect:/message/memberUpdateOk"; 
		}
		else {
			return "redirect:/message/memberUpdateNo"; 
		}
	}
	
	@GetMapping("/memberUserLeave")
	public String memberUserLeaveGet(HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		int res = memberService.setUserLeave(mid);
		
		if(res != 0) {
			return "redirect:/message/memberUserLeaveOk"; 
		}
		else {
			return "redirect:/message/memberUserLeaveNo"; 
		}
	}
	
	@GetMapping("/memberPwdChangeForm")
	public String memberPwdChangeFormGet() {
		return "/member/memberPwdChangeForm"; 
	}
	
	@ResponseBody
	@PostMapping("/memberPwdChangeOk")
	public String memberPwdChangeOkPost(HttpSession session, String nowPwd, String pwd) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		String res = "0";
		if(passwordEncoder.matches(nowPwd, vo.getPwd())) {
			pwd = passwordEncoder.encode(pwd);
			memberService.setPwdChange(pwd, mid);
			res = "1";
		}
		else {
			res = "99";
		}
		
		return res; 
	}
	
	@GetMapping("/myOrder")
	public String myOrderGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		ArrayList<ShopOrderVO> orderVOS = memberService.getMyOrder(mid);
		
		model.addAttribute("orderVOS", orderVOS);
		model.addAttribute("vo", vo);
		return "/member/myOrder"; 
	}
	
	@GetMapping("/shopCancle")
	public String shopCancleGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		ArrayList<ShopOrderVO> orderVOS = memberService.getMyOrder(mid);
		
		model.addAttribute("orderVOS", orderVOS);
		model.addAttribute("vo", vo);
		return "/member/shopCancle"; 
	}
	
	@ResponseBody
	@PostMapping("/buyDecide")
	public int buyDecidePost(int idx) {
		int res = 0;
		res = memberService.setBuyDecide(idx);
		return res; 
	}
	
	@ResponseBody
	@PostMapping("/orderExchange")
	public int orderExchangePost(int idx) {
		int res = 0;
		res = memberService.setorderExchange(idx);
		return res; 
	}
	
}
