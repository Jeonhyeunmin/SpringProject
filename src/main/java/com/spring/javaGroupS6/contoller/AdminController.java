package com.spring.javaGroupS6.contoller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaGroupS6.service.AdminService;
import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.MemberService;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.EventVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping("/admin")
	public String adminGet(Model model) {
		ArrayList<MemberVO> customerVOS = adminService.getCutomerList("");
		ArrayList<PartnerVO> partnerVOS = adminService.getPartnerList("");
		ArrayList<ShopVO> shopVOS = adminService.getShopList("", "");
		ArrayList<ShopOrderVO> orderVOS = adminService.getOrderList();
		ArrayList<CouponVO> couponVOS = adminService.getCouponList();
		ArrayList<ShopReviewVO> reviewVOS = adminService.getReviewList(0);
		
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
			if(!vo.getAccept().equals("YES")) {
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
	public String userManageGet(Model model,
			@RequestParam(name = "userDel", defaultValue = "all", required = false) String userDel
	) {
		ArrayList<MemberVO> customerVOS = adminService.getCutomerList(userDel);
		model.addAttribute("customerVOS", customerVOS);
		return "admin/userManage";
	}
	
	@GetMapping("/userDetail")
	public String userDetailGet(Model model, int idx) {
		MemberVO vo = adminService.getCustomerInfo(idx);
		model.addAttribute("vo", vo);
		return "admin/userDetail";
	}
	
	@ResponseBody
	@PostMapping("/CustomerDelete")
	public int CustomerDeletePost(int idx) {
		int res = adminService.getCustomerDelete(idx);
		return res;
	}
	
	@GetMapping("/partnerManage")
	public String partnerManageGet(Model model,
			@RequestParam(name = "accept", defaultValue = "all", required = false) String accept
	) {
		ArrayList<PartnerVO> partnerVOS = adminService.getPartnerList(accept);
		model.addAttribute("partnerVOS", partnerVOS);
		return "admin/partnerManage";
	}
	
	@GetMapping("/partnerDetail")
	public String partnerDetailGet(Model model, int idx) {
		PartnerVO vo = adminService.getPartnerInfo(idx);
		model.addAttribute("vo", vo);
		return "admin/partnerDetail";
	}
	
	@GetMapping("/orderManage")
	public String orderManageGet(Model model) {
		int totalSell = 0;
		
		ArrayList<ShopOrderVO> orderVOS = adminService.getOrderList();
		
		for(ShopOrderVO vo : orderVOS) {
			totalSell += vo.getTotalPrice();
		}
		
		model.addAttribute("orderVOS", orderVOS);
		model.addAttribute("totalSell", totalSell);
		return "admin/orderManage";
	}
	
	@GetMapping("/acceptPost")
	public String acceptPostGet(Model model,
			@RequestParam(name = "accept", defaultValue = "NO", required = false) String accept
	) {
		ArrayList<ShopVO> shopVOS = adminService.getShopList(accept, "");
		model.addAttribute("shopVOS", shopVOS);
		return "admin/acceptPost";
	}
	
	@GetMapping("/claimPost")
	public String claimPostGet(Model model,
			@RequestParam(name = "claim", defaultValue = "YES", required = false) String claim
	) {
		ArrayList<ShopVO> shopVOS = adminService.getShopList("", claim);
		model.addAttribute("shopVOS", shopVOS);
		return "admin/claimPost";
	}
	
	@GetMapping("/reviewManage")
	public String reviewManageGet(Model model) {
		ArrayList<ShopVO> reviewShopVOS = adminService.getShopReviewList();
		ArrayList<ShopReviewVO> reviewVOS = adminService.getReview();
		ArrayList<Integer> ClaimReviewIdx = new ArrayList<Integer>();
		
		for(ShopReviewVO vo : reviewVOS) {
			if(vo.getClaim().equals("YES")) {
				ClaimReviewIdx.add(vo.getShopIdx());
			}
		}
		
		
		model.addAttribute("reviewShopVOS", reviewShopVOS);
		model.addAttribute("reviewVOS", reviewVOS);
		model.addAttribute("ClaimReviewIdx", ClaimReviewIdx);
		return "admin/reviewManage";
	}
	
	@ResponseBody
	@PostMapping("/reviewLoad")
	public ArrayList<ShopReviewVO> reviewLoadPost(int idx) {
		ArrayList<ShopReviewVO> reviewVOS = adminService.getReviewList(idx);
		return reviewVOS;
	}
	
	@ResponseBody
	@PostMapping("/mostUser")
	public Map<String, Object> mostUserPost(Model model) {
    // DB에서 가져온 데이터 (모든 고객의 월별 구매 정보)
    ArrayList<ShopOrderVO> mostUser = adminService.getMostUser();

    // JSON 반환을 위한 데이터 준비
    List<String> names = new ArrayList<>();          // 고객 이름 리스트
    List<String> months = new ArrayList<>();         // 월 리스트
    List<Integer> totalPurchases = new ArrayList<>();

    for (ShopOrderVO user : mostUser) {
      names.add(user.getName());                   // 고객 이름 추가
      months.add(user.getPurchase_month());        // 구매 월 추가
      totalPurchases.add(user.getTotal());
    }

    // JSON 데이터로 반환
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("names", names);
    resultMap.put("months", months);
    resultMap.put("total", totalPurchases);
    resultMap.put("title", "VIP 고객 월 구매 수");
    resultMap.put("unit", "MONTH");

    return resultMap;
	}
	
	@ResponseBody
	@PostMapping("/mostCompany")
	public Map<String, Object> mostCompanyPost(Model model) {
		// DB에서 가져온 데이터 (모든 고객의 월별 구매 정보)
		ArrayList<ShopOrderVO> mostCompany= adminService.getMostCompany();
		
		// JSON 반환을 위한 데이터 준비
		List<String> names = new ArrayList<>();
		List<String> months = new ArrayList<>();
		List<Integer> totalPurchases = new ArrayList<>();
		
		for (ShopOrderVO company : mostCompany) {
			names.add(company.getName());
			months.add(company.getPurchase_month());
			totalPurchases.add(company.getTotal());
		}
		
		// JSON 데이터로 반환
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("names", names);
		resultMap.put("months", months);
		resultMap.put("total", totalPurchases);
		resultMap.put("title", "상위 파트너 월 판매 수");
		resultMap.put("unit", "MONTH");
		
		return resultMap;
	}
	
	@ResponseBody
	@PostMapping("/partnerAllAccpet")
	public int partnerAllAccpetPost() {
		int res = adminService.setPartnerAllAccpet();
		return res;
	}
	
	@ResponseBody
	@PostMapping("/selectAccept")
	public int selectAcceptPost(String idxArr) {
		String idx[] = idxArr.split("/");
		int res = 0;
		for(String i : idx) {
			res += adminService.setSelectAccept(Integer.parseInt(i));
		}
		return res;
	}
	
	@ResponseBody
	@PostMapping("/selectNoPartner")
		public int partnerDeleteAllPost(String idxArr) {
		String idx[] = idxArr.split("/");
		int res = 0;
		for(String i : idx) {
			res += adminService.setSelectNoPartnerAccept(Integer.parseInt(i));
		}
		return res;
	}
	
	@ResponseBody
	@PostMapping("/partnerNo")
	public int partnerNoPost(int idx) {
		int res = adminService.setNoPartner(idx);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/userDeleteAll")
	public int userDeleteAllPost() {
		int res = 0;
		res += adminService.setCustomerDeleteAll();
		return res;
	}
	
	@ResponseBody
	@PostMapping("/MemberLeaveCancel")
	public int MemberLeaveCancelPost(int idx) {
		int res = 0;
		res += adminService.setMemberLeaveCancel(idx);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/partnerYes")
	public int partnerYesPost(int idx) {
		int res = adminService.setPartnerYes(idx);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/allAccept")
	public int allAcceptPost() {
		return adminService.setAllAccept();
	}
	
	@ResponseBody
	@PostMapping("/selectAcceptPost")
	public int selectAccept(String idxArr) {
		int res = 0;
		String idx[] = idxArr.split("/");
		
		for(String i : idx) {
			res += adminService.setSelectAcceptPost(Integer.parseInt(i));
		}
		
		return res;
	}
	
	@ResponseBody
	@PostMapping("/accept")
	public int acceptPost(int idx) {
		return adminService.setSelectAcceptPost(idx);
	}
	
	@ResponseBody
	@PostMapping("/claimAllDelete")
	public int claimAllDeletePost() {
		return adminService.setClaimAllDelete();
	}
	
	@ResponseBody
	@PostMapping("/selectDelete")
	public int selectDeletePost(String idxArr) {
		int res = 0;
		String idx[] = idxArr.split("/");
		
		for(String i : idx) {
			res += adminService.setSelectDelete(Integer.parseInt(i));
		}
		
		return res;
	}
	
	@ResponseBody
	@PostMapping("/shopClaimNo")
	public int shopClaimNoPost(int idx) {
		return adminService.setShopClaimNo(idx);
	}
	
	@ResponseBody
	@PostMapping("/filterOrders")
	public List<ShopOrderVO> filterOrders(
    @RequestParam(required = false) String keyword,
    @RequestParam(required = false) String status,
    @RequestParam(required = false) String date) {

    return adminService.filterOrders(keyword, status, date);
	}
	
	@ResponseBody
	@GetMapping("/orderDetails")
	public ShopOrderVO getOrderDetails(@RequestParam("idx") int idx) {
    return adminService.getOrderDetails(idx);
	}
	
	@ResponseBody
	@GetMapping("/searchUsers")
	public List<MemberVO> searchUsers(@RequestParam("keyword") String keyword) {
    return adminService.searchUsers(keyword);
	}
	
	@ResponseBody
	@GetMapping("/searchPartners")
	public List<PartnerVO> searchPartners(@RequestParam("keyword") String keyword) {
    return adminService.searchPartners(keyword);
	}
	
	@GetMapping("/adjustmentManage")
	public String adjustmentManageGet(Model model) {
		int totalSell = 0;
		int adjustment = 0;
		ArrayList<ShopOrderVO> vos = adminService.getAdjustMentList();
		ArrayList<ShopOrderVO> orderVOS = new ArrayList<ShopOrderVO>();
		for(ShopOrderVO vo : vos) {
			totalSell += vo.getTotalPrice();
			if(vo.getAdjustment().equals("ING") && vo.getDecide().equals("구매확정") && vo.getDelivery().equals("배송완료")) {
				adjustment++;
				orderVOS.add(vo);
			}
		}
		
		model.addAttribute("totalSell", totalSell);
		model.addAttribute("adjustment", adjustment);
		model.addAttribute("orderVOS", orderVOS);
		return "admin/adjustmentManage";
	}
	
	@ResponseBody
	@PostMapping("/allAdjustment")
	public int allAdjustmentPost() {
		int res = adminService.setAllAdjustment();
		return res;
	}
	
	@ResponseBody
	@PostMapping("/selectAdjustment")
	public int selectAdjustmentPost(String idxArr) {
		String idx[] = idxArr.split("/");
		int res = 0;
		for(String i : idx) {
			res = adminService.setSelectAdjustment(Integer.parseInt(i));
		}
		return res;
	}
	
	@ResponseBody
	@PostMapping("/adjustment")
	public int adjustmentPost(int idx) {
		int res = adminService.setSelectAdjustment(idx);
		return res;
	}
	
	@ResponseBody
	@GetMapping("/searchOrders")
	public List<ShopOrderVO> searchOrdersPost(String keyword) {
		List<ShopOrderVO> filteredOrders = adminService.searchOrders(keyword);
    return filteredOrders;
	}
	
	@GetMapping("/eveneManage")
	public String eventListGet(Model model) {
		ArrayList<EventVO> eventVOS = adminService.getEventList();
		
		for (EventVO vo : eventVOS) {
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

	    LocalDate endDate = LocalDate.parse(vo.getEndDate(), formatter);

	    LocalDate currentDate = LocalDate.now();
	    if (currentDate.isAfter(endDate)) {
        vo.setStatus("종료");
	    }
		}
		
		model.addAttribute("eventVOS", eventVOS);
		return "admin/eveneManage";
	}
	
	
	@ResponseBody
	@PostMapping("/activeEvent")
	public int activeEventPost(int idx) {
    return adminService.setActiveEvent(idx);
	}
	
	@ResponseBody
	@PostMapping("/deactiveEvent")
	public int deactiveEventPost(int idx) {
		return adminService.setDeActiveEvent(idx);
	}
	
	@ResponseBody
	@PostMapping("/selectActiveEvent")
	public int selectActiveEventPost(String idxArr) {
		int res = 0;
		String idx[] = idxArr.split("/");
		for(String i : idx) {
			res += adminService.setActiveEvent(Integer.parseInt(i));
		}
		
		return res;
	}
	
	@ResponseBody
	@PostMapping("/selectDeactiveEvent")
	public int selectDeactiveEventPost(String idxArr) {
		int res = 0;
		String idx[] = idxArr.split("/");
		for(String i : idx) {
			res += adminService.setDeActiveEvent(Integer.parseInt(i));
		}
		
		return res;
	}
	
	@ResponseBody
	@PostMapping("/filterEvents")
	public List<EventVO> filterEventsPost(String keyword, String status) {
		return adminService.getFilterEvents(keyword, status);
	}
	
}
