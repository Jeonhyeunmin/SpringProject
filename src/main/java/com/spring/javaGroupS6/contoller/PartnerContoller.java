package com.spring.javaGroupS6.contoller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.PartnerService;
import com.spring.javaGroupS6.service.ShopService;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopVO;

@RequestMapping("/partner")
@Controller
public class PartnerContoller {
	@Autowired
	PartnerService partnerService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/myPage")
	public String myPageGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getCompany() + "님");
		return "partner/partnerPage";
	}
	
	@GetMapping("/header")
	public String headerGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		
		model.addAttribute("vo", vo);
		return "/partner/myPageHeader";
	}
	
	@GetMapping("/nav")
	public String navGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		model.addAttribute("vo", vo);
		return "/partner/myPageNav";
	}
	
	@GetMapping("/content")
	public String contentGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		MemberVO vo = commonService.getMemberIdSearch(mid);
		
		ArrayList<ShopOrderVO> orderVOS = partnerService.getOrderList(mid);
		ArrayList<ShopVO> shopVOS = partnerService.getShopList(mid);
		int exchage = 0;
		int claim = 0;
		for(ShopOrderVO oVO : orderVOS) {
			if(oVO.getDecide().equals("교환 및 환불")) {
				exchage++;
			}
		}
		
		for(ShopVO sVO : shopVOS) {
			if(sVO.getClaim().equals("YES")) {
				claim++;
			}
		}
		
		model.addAttribute("claim", claim);
		model.addAttribute("exchage", exchage);
		model.addAttribute("orderVOS", orderVOS);
		model.addAttribute("vo", vo);
		return "/partner/myPageContent";
	}
	
	@GetMapping("/partnerLeave")
	public String partnerLeaveGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		int res = partnerService.setPartnerLeave(mid);
		
		if(res != 0) {
			return "redirect:/message/memberUserLeaveOk";
		}
		else {
			return "redirect:/message/memberUserLeaveNo";
		}
	}
	
	@GetMapping("/shopList")
	public String shopListGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		ArrayList<ShopVO> shopVOS = partnerService.getShopList(mid);
		
		model.addAttribute("shopVOS", shopVOS);
		return "/partner/myShopList";
	}
	
	@GetMapping("/orderList")
	public String orderListGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		ArrayList<ShopOrderVO> orderVOS = partnerService.getOrderList(mid);
		
		model.addAttribute("orderVOS", orderVOS);
		return "/partner/myOrderList";
	}
	

}
