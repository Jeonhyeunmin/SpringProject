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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		
		model.addAttribute("vo", vo);
		return "/partner/myPageNav";
	}
	
	@GetMapping("/content")
	public String contentGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		
		ArrayList<ShopOrderVO> orderVOS = partnerService.getOrderList(mid, "");
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
	
	@GetMapping("/shopList")
	public String shopListGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		ArrayList<ShopVO> shopVOS = partnerService.getShopList(mid);
		
		model.addAttribute("shopVOS", shopVOS);
		return "/partner/myShopList";
	}
	
	@GetMapping("/orderList")
	public String orderListGet(Model model, HttpSession session, 
			@RequestParam(name = "status", defaultValue = "", required = false) String status
	) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		ArrayList<ShopOrderVO> orderVOS = partnerService.getOrderList(mid, status);
		
		model.addAttribute("status", status);
		model.addAttribute("orderVOS", orderVOS);
		return "/partner/myOrderList";
	}
	
	@ResponseBody
	@PostMapping("/deliveryStart")
	public int deliveryStartPost(int idx) {
		
		int res = partnerService.setDeliveryStart(idx);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/deliveryEnd")
	public int deliveryEndPost(int idx) {
		int res = partnerService.setDeliveryEnd(idx);
		return res;
	}
	
	@GetMapping("/orderDetail")
	public String orderDetailGet(Model model, int idx) {
		ShopOrderVO vo = partnerService.getOrderDetail(idx);
		model.addAttribute("vo", vo);
		return "/partner/orderDetail";
	}

	@ResponseBody
	@PostMapping("/deliveryAll")
	public int deliveryAllPost(HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		int res = 0;
		res = partnerService.setDeliveryAll(mid);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/deliveryFinish")
	public int deliveryFinishPost(HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		int res = 0;
		res = partnerService.setDeliveryFinish(mid);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/selectDelivery")
	public int deliveryAllPost(HttpSession session, String idxArr) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		String idx[] = idxArr.split("/");
		int res = 0;
		
		for(String i : idx) {
			res += partnerService.setSelectDelivery(i, mid);
		}
		
		return res;
	}
	
	@GetMapping("/adjustment")
	public String adjustmentGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ArrayList<ShopOrderVO> orderVOS = partnerService.getOrderList(mid, "");
		
		model.addAttribute("orderVOS", orderVOS);
		return "/partner/adjustment";
	}
	
	@ResponseBody
	@PostMapping("/adjustment")
	public int adjustmentPost(int idx) {
		return partnerService.setAdjustment(idx);
	}
	
	@GetMapping("/exchange")
	public String exchangeGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ArrayList<ShopOrderVO> orderVOS = partnerService.getOrderList(mid, "exchange");
		model.addAttribute("orderVOS", orderVOS);
		return "/partner/exchange";
	}
	
	@GetMapping("/marketing")
	public String marketingGet(HttpSession session, Model model) {
		return "/partner/marketing";
	}
	
	@GetMapping("/claimPost")
	public String claimPostGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		ArrayList<ShopVO> vos = partnerService.getClaimPostList(mid);
		
		model.addAttribute("vos", vos);
		
		return "/partner/claimPost";
	}
	
	@GetMapping("/partnerUpdate")
	public String partnerUpdateGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		model.addAttribute("vo", vo);
		
		return "/partner/partnerPwdCheck";
	}
	
	@PostMapping("/partnerUpdate")
	public String memberUpdatePost(HttpSession session, MultipartFile file, PartnerVO vo) {
		
		int res = partnerService.setPartnerUpdate(file, vo, session);
		
		if(res != 0) {
			return "redirect:/message/memberUpdateOk"; 
		}
		else {
			return "redirect:/message/memberUpdateNo"; 
		}
	}
	
	@PostMapping("/pwdCheck")
	public String partnerPwdCheckPost(Model model, HttpSession session, String pwd) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		
		if(passwordEncoder.matches(pwd, vo.getPwd())) {
			model.addAttribute("vo", vo);
			model.addAttribute("title", vo.getCompany() + "님 정보수정");
			return "/partner/partnerUpdate";
		}
		else {
			return "redirect:/message/partnerPwdCheckNo";
		}
	}
	
	@GetMapping("/partnerPwdChangeForm")
	public String partnerPwdChangeForm() {
		return "/partner/partnerPwdChangeForm";
	}
	
	@ResponseBody
	@PostMapping("/partnerPwdChangeOk")
	public String memberPwdChangeOkPost(HttpSession session, String nowPwd, String pwd) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		PartnerVO vo = commonService.getPartnerIdSearch(mid);
		
		String res = "0";
		if(passwordEncoder.matches(nowPwd, vo.getPwd())) {
			pwd = passwordEncoder.encode(pwd);
			partnerService.setPartnerPwdChange(pwd, mid);
			res = "1";
		}
		else {
			res = "99";
		}
		
		return res; 
	}
	
	@GetMapping("/partnerLeave")
	public String partnerLeaveGet(HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		int res = partnerService.setPartnerLeave(mid);
		
		if(res != 0) {
			return "redirect:/message/partnerLeaveOk"; 
		}
		else {
			return "redirect:/message/partnerLeaveNo"; 
		}
	}
	
}