package com.spring.javaGroupS6.contoller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaGroupS6.service.AdminService;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/admin")
	public String adminGet(Model model) {
		ArrayList<MemberVO> customerVOS = adminService.getCutomerList();
		ArrayList<MemberVO> partnerVOS = adminService.getPartnerList();
		ArrayList<ShopVO> shopVOS = adminService.getShopList();
		ArrayList<ShopOrderVO> orderVOS = adminService.getOrderList();
		ArrayList<CouponVO> couponVOS = adminService.getCouponList();
		ArrayList<ShopReviewVO> reviewVOS = adminService.getReviewList(0);
		
		ArrayList<ShopOrderVO> mostVOS = adminService.getVIP();
		int buyCnt[] = new int[7];
		String buyName[] = new String[7];
		
		for(int i = 0; i< mostVOS.size(); i++) {
			buyCnt[i] = mostVOS.get(i).getOrderCnt();
			buyName[i] = mostVOS.get(i).getVipName();
		}
		int claim = 0;
		int reviewClaim = 0;
		int partnerSale = 0;
		int acceptPost = 0;
		int adjustment = 0;
		int totalSell = 0;
		
		for(ShopVO vo : shopVOS) {
			if(!vo.getClaim().equals("NO")) {
				claim++;
			}
		}
		
		for(ShopVO vo : shopVOS) {
			if(!vo.getAccept().equals("승인")) {
				acceptPost++;
			}
		}
		
		for(ShopReviewVO vo : reviewVOS) {
			if(!vo.getClaim().equals("NO")) {
				reviewClaim++;
			}
		}
		
		for(ShopOrderVO vo : orderVOS) {
			partnerSale += (vo.getPrice() - vo.getPay()) * vo.getQuantity();
		}
		
		for(ShopOrderVO vo : orderVOS) {
			if(vo.getAdjustment().equals("ING")) {
				adjustment++;
			}
		}
		
		for(ShopOrderVO vo : orderVOS) {
			totalSell += vo.getTotalPrice();
		}
		
		model.addAttribute("buyCnt", buyCnt);
		model.addAttribute("buyName", buyName);
		model.addAttribute("totalSell", totalSell);
		model.addAttribute("adjustment", adjustment);
		model.addAttribute("acceptPost", acceptPost);
		model.addAttribute("reviewVOS", reviewVOS);
		model.addAttribute("customerVOS", customerVOS);
		model.addAttribute("partnerVOS", partnerVOS);
		model.addAttribute("shopVOS", shopVOS);
		model.addAttribute("orderVOS", orderVOS);
		model.addAttribute("couponVOS", couponVOS);
		
		model.addAttribute("claim", claim);
		model.addAttribute("reviewClaim", reviewClaim);
		model.addAttribute("partnerSale", partnerSale);
		return "admin/admin";
	}
	
	@GetMapping("/userManage")
	public String userManageGet(Model model) {
		ArrayList<MemberVO> customerVOS = adminService.getCutomerList();
		model.addAttribute("customerVOS", customerVOS);
		return "admin/userManage";
	}
	
	@GetMapping("/partnerManage")
	public String partnerManageGet(Model model) {
		ArrayList<MemberVO> partnerVOS = adminService.getPartnerList();
		model.addAttribute("partnerVOS", partnerVOS);
		return "admin/partnerManage";
	}
	
	@GetMapping("/orderManage")
	public String orderManageGet(Model model) {
		ArrayList<MemberVO> partnerVOS = adminService.getPartnerList();
		model.addAttribute("partnerVOS", partnerVOS);
		return "admin/orderManage";
	}
	
	@GetMapping("/reviewManage")
	public String reviewManageGet(Model model) {
		ArrayList<ShopVO> shopVOS = adminService.getShopReviewList();
		model.addAttribute("shopVOS", shopVOS);
		return "admin/reviewManage";
	}
	
	@ResponseBody
	@PostMapping("/reviewLoad")
	public ArrayList<ShopReviewVO> reviewLoadPost(int idx) {
		ArrayList<ShopReviewVO> reviewVOS = adminService.getReviewList(idx);
		return reviewVOS;
	}
}
