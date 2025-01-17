package com.spring.javaGroupS6.contoller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.EventService;
import com.spring.javaGroupS6.service.MemberService;
import com.spring.javaGroupS6.service.ShopService;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.PaymentVO;
import com.spring.javaGroupS6.vo.ReviewLikesVO;
import com.spring.javaGroupS6.vo.ShopCartVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;
import com.spring.javaGroupS6.vo.SubCategoryVO;

@Controller
@RequestMapping("/shop")
public class ShopContoller {
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaProvide provide;
	

	@GetMapping("/shopList")
	public String shopListGet(Model model, HttpServletRequest request, String category) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/images/shop/" + category + "/");
		String files[] = new File(realPath).list();
		
		model.addAttribute("files", files);
		
		ArrayList<ShopVO> vos = shopService.getShopList(category, "category", "yes" ,"");
		ArrayList<String> mainCategory = new ArrayList<String>();
		ArrayList<ShopVO> products = new ArrayList<ShopVO>();
		ArrayList<String> brands = new ArrayList<String>();
		for(int i = 0; i < vos.size(); i++) {
			if(!brands.contains(vos.get(i).getCompany())) {
				brands.add(vos.get(i).getCompany());
			}
		}
		
		for(int i = 0; i < vos.size(); i++) {
			if(!mainCategory.contains(vos.get(i).getMainCategory())) {
				mainCategory.add(vos.get(i).getMainCategory());
			}
			products.add(vos.get(i));
		}
		
		model.addAttribute("title", category);
		model.addAttribute("category", category);
		model.addAttribute("mainCategoryList", mainCategory);
		model.addAttribute("vos", vos);
		model.addAttribute("products", products);
		model.addAttribute("brands", brands);
		
		return "shop/shopList";
	}
	
	@GetMapping("/shopMainList")
	public String shopMainListGet(Model model, String mainCategory) {
		
		ArrayList<ShopVO> vos = shopService.getShopList(mainCategory, "mainCategory", "yes", "");
		ArrayList<String> subCategory = new ArrayList<String>();
		ArrayList<Integer> subCateCnt = shopService.getSubCateCnt(mainCategory);
		String category = "";
		
		for(int i = 0; i < vos.size(); i++) {
			if(!subCategory.contains(vos.get(i).getSubCategory())) {
				subCategory.add(vos.get(i).getSubCategory());
				category = vos.get(i).getCategory();
			}
		}
		
		model.addAttribute("title", mainCategory);
		model.addAttribute("category", category);
		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subCategoryList", subCategory);
		model.addAttribute("vos", vos);
		model.addAttribute("subCateCnt", subCateCnt);
		
		return "shop/shopMainList";
	}
	
	@GetMapping("/shopSubList")
	public String shopSubListGet(Model model, String subCategory,
			@RequestParam(name = "company", defaultValue = "all") String company,			
			@RequestParam(name = "alignColumn", defaultValue = "") String alignColumn,			
			@RequestParam(name = "align", defaultValue = "asc") String align			
	) {
		ArrayList<ShopVO> allList = shopService.getShopList(subCategory, "subCategory", "yes", "");
		ArrayList<ShopVO> vos = shopService.getShopList(subCategory, "subCategory", "yes", company);
		ArrayList<String> BrandList = new ArrayList<String>();
		ArrayList<Integer> BrandCnt = shopService.getBrandCateCnt(subCategory);
		String category = "";
		String mainCategory = "";
		
		for(int i = 0; i < allList.size(); i++) {
			if(!BrandList.contains(allList.get(i).getCompany())) {
				BrandList.add(allList.get(i).getCompany());
				category = allList.get(i).getCategory();
				mainCategory = allList.get(i).getMainCategory();
			}
		}
		
		model.addAttribute("title", subCategory);
		model.addAttribute("category", category);
		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subCategory", subCategory);
		model.addAttribute("BrandList", BrandList);
		model.addAttribute("vos", vos);
		model.addAttribute("BrandCnt", BrandCnt);
		
		return "shop/shopSubList";
	}
	
	@GetMapping("/shopContent")
	public String shopContentGet(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, int idx) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ShopVO vo = shopService.getShopContent(idx);
		
		PartnerVO pVO = commonService.getPartnerIdSearch(vo.getMid());
		
		int postCount = shopService.getPostCount(vo.getMid());
		
		String logo = pVO.getLogo();
		ArrayList<String> titleImgs = new ArrayList<String>();
		if(vo.getTitleImg().contains("/")) {
			String titleImgArr[] = vo.getTitleImg().split("/");
			for(int i = 0; i < titleImgArr.length; i++) {
				titleImgs.add(titleImgArr[i]);
			}
		}
		else {
			titleImgs.add(vo.getTitleImg());
		}
		
		ArrayList<ShopReviewVO> reviewVOS = shopService.getReview(idx, "");
		Double reviewAvg = shopService.getReviewAverage(idx);
		
		ArrayList<Integer> likeVOS = shopService.getMyLikes(idx, mid);
		
	// 최근본 상품을 Cookie에 저장하기
		Cookie[] cookies = request.getCookies();
		String productList = "";
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cShop")) {
					productList = cookies[i].getValue();
					break;
				}
			}
		}
		
		
		if(productList.contains(idx + ":")) {
			productList = productList.replace(idx + ":", "");
		}
		if(productList.equals("") || productList.indexOf(idx+"") == -1) {
			String[] cookieArr = productList.split(":");
			if(cookieArr.length > 2) {
				productList = cookieArr[0] + ":" + cookieArr[1] + ":";
			}
		}
		Cookie cookieProduct = new Cookie("cShop", idx + ":" + productList);
		cookieProduct.setPath("/");
		cookieProduct.setMaxAge(60*60*24*7);
		response.addCookie(cookieProduct);
		
		model.addAttribute("likeVOS", likeVOS);
		model.addAttribute("reviewVOS", reviewVOS);
		model.addAttribute("reviewAvg", reviewAvg);
		
		model.addAttribute("postCount", postCount);
		model.addAttribute("logo", logo);
		model.addAttribute("titleImgs", titleImgs);
		model.addAttribute("title", vo.getTitle());
		model.addAttribute("vo", vo);
		
		return "shop/shopContent";
	}
	
	@ResponseBody
	@PostMapping("/mainCategoryLoad")
	public ArrayList<MainCategoryVO> mainCategoryLoadPost(String category) {
		
		ArrayList<MainCategoryVO> vos = shopService.getMainCategoryList(category);
		
		return vos;
	}
	
	@ResponseBody
	@PostMapping("/subCategoryLoad")
	public ArrayList<SubCategoryVO> subCategoryLoadPost(String mainCategory) {
		
		ArrayList<SubCategoryVO> vos = shopService.getSubCategoryList(mainCategory);
		return vos;
	}
	
	@GetMapping("/shopUpdate")
	public String shopUpdateGet(Model model, int idx) {
		ShopVO vo = shopService.getShopContent(idx);
		
		if(vo.getContent().contains("src=\"/")) {
			provide.imgBackup(vo.getContent(), "category");
		}
		provide.titleImgBackup(vo.getTitleImg(), "category");
		
		ArrayList<ShopVO> vos = shopService.getList();
		
		model.addAttribute("vos", vos);
		model.addAttribute("title", "게시물 수정");
		model.addAttribute("vo", vo);
		return "/shop/shopUpdate";
	}
	
	@PostMapping("/shopUpdate")
	public String shopUpdatePost(Model model, MultipartHttpServletRequest titleImg , ShopVO vo, HttpServletRequest request) {
		
		int res = 0;
		
		res = shopService.setShopUpdate(vo, titleImg, request);
		
		model.addAttribute("idx", vo.getIdx());
		if(res != 0) {
			return "redirect:/message/shopUpdateOk";
		}
		else {
			return "redirect:/message/shopUpdateOk";
		}
		
	}
	
	@GetMapping("/shopInput")
	public String shopInputGet(Model model) {
		ArrayList<ShopVO> vos = shopService.getList();
		model.addAttribute("title", "게시물 등록");
		model.addAttribute("vos", vos);
		return "/shop/shopInput";
	}
	
	@PostMapping("/shopInput")
	public String shopInputPost(Model model, MultipartRequest titleImg, ShopVO vo, HttpServletRequest request) {
		
		String mid = (String)request.getSession().getAttribute("sMid");
		vo.setMid(mid);
		String optionName = vo.getOptionName();
		String optionPrice= vo.getOptionPrice();
		vo.setOptionName(optionName.substring(0, optionName.length()-1));
		vo.setOptionPrice(optionPrice.substring(0, optionPrice.length()-1));
		int res = shopService.shopInput(vo, titleImg, request);
		
		
		if(res != 0) {
			return "redirect:/message/shopInputOk";
		}
		else {
			return "redirect:/message/shopInputNo";
		}
	}
	
	@GetMapping("/shopDelete")
	public String shopDeleteGet(int idx) {
		int res = shopService.setShopDelete(idx);
		
		if(res != 0) {
			return "redirect:/message/shopDeleteOk";
		}
		else {
			return "redirect:/message/shopDeleteNo?idx=" + idx;
		}
	}
	
	@GetMapping("/shopReview")
	public String shopReviewGet(Model model, int idx, int orderIdx) {
		ShopVO vo = shopService.getShopContent(idx);
		model.addAttribute("title", vo.getTitle() + "리뷰 등록 | Min's");
		model.addAttribute("vo", vo);
		model.addAttribute("orderIdx", orderIdx);
		return "/shop/shopReview";
	}
	
	@PostMapping("/shopReviewInput")
	public String shopReviewInputPost(Model model, ShopReviewVO vo, int idx, String mid, int orderIdx) {
		int res = shopService.setReviewInput(vo, idx, mid);
		shopService.setPointUp(mid, "10");
		shopService.setReviewOk(orderIdx);
		model.addAttribute("idx", idx);
		if(res != 0) {
			return "redirect:/message/reviewInputOk";
		}
		else {
			return "redirect:/message/reviewInputNo";
		}
	}
	
	@PostMapping("/reviewUpdateForm")
	public String reviewUpdateFormPost(Model model, int shopIdx, int reviewIdx) {
		ShopVO shopVO = shopService.getShopContent(shopIdx);
		ShopReviewVO reviewVO = shopService.getMyReview(reviewIdx);
		
		model.addAttribute("reviewVO", reviewVO);
		model.addAttribute("shopVO", shopVO);
		return "/shop/reviewUpdateForm";
	}
	
	@ResponseBody
	@PostMapping("/reviewUpdate")
	public int reviewUpdatePost(ShopReviewVO vo) {
		return shopService.setReviewUpdate(vo);
	}
	
	
	@ResponseBody
	@Transactional
	@PostMapping("/reviewGoodCheck")
	public String shopGoodCheckPost(int idx, int reviewIdx, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		int res = 0;
		shopService.setReviewGoodCheck(reviewIdx);
		ReviewLikesVO vo = shopService.getReviewLikeInfo(idx, mid);
		if(vo == null) {
			res = shopService.setReviewGoodInput(idx, reviewIdx, mid);
		}
		return res + "";
	}
	
	@PostMapping("/reviewList")
	public String reviewListPost(Model model, HttpSession session, int idx) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ArrayList<ShopReviewVO> reviewVOS = shopService.getReview(idx, "");
		Double reviewAvg = shopService.getReviewAverage(idx);
		
		ArrayList<Integer> likeVOS = shopService.getMyLikes(idx, mid);
		
		model.addAttribute("likeVOS", likeVOS);
		model.addAttribute("reviewVOS", reviewVOS);
		model.addAttribute("reviewAvg", reviewAvg);
		
    return "/shop/reviewList";
	}
	
	@ResponseBody
	@PostMapping("/reviewClaim")
	public int reviewClaimPost(int idx) {
		return shopService.setReviewClaim(idx);
	}
	
	@ResponseBody
	@PostMapping("/reviewDelete")
	public int reviewDeletePost(int idx) {
		return shopService.setReviewDelete(idx);
	}
	
	@GetMapping("/shopCart")
	public String shopCartGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ArrayList<ShopCartVO> vos = shopService.getMyCart(mid);
		model.addAttribute("vos", vos);
		model.addAttribute("title", "장바구니");
		return "shop/shopCart";
	}
	
	@ResponseBody
	@PostMapping("/shopCart")
	public int shopCartPost(HttpSession session, ShopCartVO vo,
			@RequestParam(name = "quantityMinus", defaultValue = "0", required = false) int quantityMinus
	) {
		
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		int res = 0;
		int quantity = 0; 
		int totalPrice = 0;
		
		ShopVO shopVO = shopService.getShopContent(vo.getShopIdx());
		
		ShopCartVO cartVO = shopService.getMyCartSearch(vo.getShopIdx(), vo.getOptionSelect(), mid);
		
		vo.setMid(mid);
		vo.setShopTitle(shopVO.getTitle());
		vo.setThumbnail(shopVO.getThumbnail());
		
		if(cartVO != null) {
			int price = cartVO.getTotalPrice() / cartVO.getQuantity();
			if(quantityMinus != 0) {
				quantity = quantityMinus;
				totalPrice = price * (cartVO.getQuantity() + quantity);
				shopService.setCartQuantityUpdate(cartVO.getIdx(), quantity, totalPrice);
			}
			else if(cartVO.getQuantity() >= 5) {
				res = 2;
			}
			else if(cartVO.getQuantity() + vo.getQuantity() < 5) {
				quantity = vo.getQuantity();
				totalPrice = price * (cartVO.getQuantity() + quantity);
				shopService.setCartQuantityUpdate(cartVO.getIdx(), quantity, totalPrice);
				res = 1;
			}
			else if(cartVO.getQuantity() + vo.getQuantity() >= 5) {
				quantity = 5 - cartVO.getQuantity();
				totalPrice = price * (cartVO.getQuantity() + quantity);
				shopService.setCartQuantityUpdate(cartVO.getIdx(), quantity, totalPrice);
				res = 3;
			}
			else if(cartVO.getQuantity() < 5) {
				quantity = 5 - cartVO.getQuantity();
				totalPrice = price * (cartVO.getQuantity() + quantity);
				shopService.setCartQuantityUpdate(cartVO.getIdx(), quantity, totalPrice);
				res = 3;
			}
		}
		else {
			res = shopService.setCartInput(vo);
		}
		
		return res;
	}
	
	@PostMapping("/shopOrder")
	public String shopOrder(Model model, HttpSession session,
			@RequestParam(name = "idx", defaultValue = "0", required = false) int idx,
			@RequestParam(name = "optionSelect", defaultValue = "", required = false) String optionSelect,
			@RequestParam(name = "quantity", defaultValue = "0", required = false) int quantity,
			@RequestParam(name = "totalPrice", defaultValue = "0", required = false) int totalPrice, 
			String idxArr, String quantityArr, String totalPriceArr
	) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ShopOrderVO vo = null;
		ArrayList<ShopOrderVO> vos = new ArrayList<ShopOrderVO>();
		
		int pay = 0;
		if(idx == 0) {
			String[] cartIdx = idxArr.split("/"); 
			String cartQuantity[] = quantityArr.split("/"); 
			String cartTotalPrice[] = totalPriceArr.split("/");
			for(int i = 0; i < cartIdx.length; i++) {
				vo = shopService.getIdxCart(cartIdx[i]);
				pay = Integer.parseInt(cartTotalPrice[i]) / Integer.parseInt(cartQuantity[i]);
				vo.setQuantity(Integer.parseInt(cartQuantity[i]));
				vo.setTotalPrice(Integer.parseInt(cartTotalPrice[i]));
				vo.setPay(pay);
				vo.setCartIdx(Integer.parseInt(cartIdx[i]));
				vos.add(vo);
			}
		}
		else {
			vo = shopService.getOneOrder(idx);
			vo.setMid(mid);
			vo.setShopIdx(idx);
			pay = totalPrice / quantity;
			vo.setPay(pay);
			
			vo.setQuantity(quantity);
			vo.setTotalPrice(totalPrice);
			vos.add(vo);
		}
		System.out.println("vos : " + vos);
		MemberVO memberVO = commonService.getMemberIdSearch(mid);
		session.setAttribute("sOrderVOS", vos);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("vos", vos);
		model.addAttribute("title", "주문서 작성");
		return "shop/shopOrder";
	}
	
	@ResponseBody
	@PostMapping("/cartDelete")
	public int cartDeletePost(int idx) {
		return shopService.setCartDelete(idx);
	}
	
	@ResponseBody
	@PostMapping("/cartSelectDelete")
	public int cartSelectDeletePost(String idxArr) {
		
		String idx[] = idxArr.split("/");
		int res = 0;
		for(String i : idx) {
			res = shopService.setCartDelete(Integer.parseInt(i));
		}
		
		return res;
	}
	
	@ResponseBody
	@PostMapping("/cookieShopDelete")
	public void cookieShopDeletePost(HttpServletRequest request, HttpServletResponse response, int idx) {
		Cookie[] cookies = request.getCookies();
		String productList = "";
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cShop")) {
					productList = cookies[i].getValue();
					
					productList= productList.replace(idx+":", "");
					Cookie cookieProduct = new Cookie("cShop", productList);
					cookieProduct.setPath("/");
					cookieProduct.setMaxAge(60*60*24*7);
					response.addCookie(cookieProduct);
					
					break;
				}
			}
		}
	}
	
	@GetMapping("/couponSelect")
	public String couponSelectGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		ArrayList<CouponVO> vos = memberService.getMyCoupon(mid);
		
		model.addAttribute("vos", vos);
		return "/shop/couponSelect";
	}
	
	@ResponseBody
	@PostMapping("/couponSearch")
	public CouponVO couponSearchPost(HttpSession session, int idx) {
		
		CouponVO vo = shopService.getCouponInfo(idx);
		
		return vo;
	}
	
	@PostMapping("/payment")
	public String paymentPost(PaymentVO paymentVO, HttpSession session, Model model,
			@RequestParam(name = "couponIdx", defaultValue = "0", required = false) String couponIdx,
			@RequestParam(name = "usePoint", defaultValue = "0", required = false)  int usePoint,
			int addPoint) {
		
		List<ShopOrderVO> orderVos = (List<ShopOrderVO>) session.getAttribute("sOrderVOS");
		CouponVO couponVO = shopService.getCouponInfo(Integer.parseInt(couponIdx));
		int tot = 0;
		for(ShopOrderVO vo : orderVos) {
			if(couponVO != null) {
				vo.setCouponDiscount(couponVO.getDiscount());
				vo.setCoupon(couponVO.getCouponName());
				vo.setCouponIdx(Integer.parseInt(couponIdx));
				tot = (vo.getTotalPrice() * couponVO.getDiscount()) / 100;
				vo.setTotalPrice(vo.getTotalPrice() - tot);
			}
			vo.setAddPoint(addPoint);
			vo.setUsePoint(usePoint);
		}
		
		model.addAttribute("payMentVO", paymentVO);
		model.addAttribute("title", "결제");
		
		session.setAttribute("sPaymentVO", paymentVO);
		return "/shop/payment";
	}
	
	@GetMapping("/paymentOk")
	public String paymentOkGet(HttpSession session, Model model, PaymentVO paymentVO) {
		List<ShopOrderVO> orderVos = (List<ShopOrderVO>) session.getAttribute("sOrderVOS");

		for(ShopOrderVO vo : orderVos) {
			shopService.setShopOrder(vo);
			if(vo.getCartIdx() != 0) {
				shopService.setCartDeleteAll(vo.getCartIdx());
			}
			shopService.setUseCoupon(vo);
		}
		String mid = orderVos.get(0).getMid();
		int addPoint = orderVos.get(0).getAddPoint();
		int usePoint = orderVos.get(0).getUsePoint();
		memberService.setPointUpdate(addPoint, usePoint, mid);
		
		return "redirect:/message/paymentResult";
	}
	
	@GetMapping("/shopOrderOk")
	public String shopOrderOkGet(HttpSession session, Model model) {
		List<ShopOrderVO> orderVos = (List<ShopOrderVO>) session.getAttribute("sOrderVOS");
		model.addAttribute("orderVos", orderVos);
		model.addAttribute("title", "구매내역");
		
		
		return "shop/paymentResult";
	}
}