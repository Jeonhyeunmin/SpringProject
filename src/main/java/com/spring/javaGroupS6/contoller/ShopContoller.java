package com.spring.javaGroupS6.contoller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.spring.javaGroupS6.service.ShopService;
import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.PartnerVO;
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
			@RequestParam(name = "company", defaultValue = "all") String company			
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
	public String shopContentGet(Model model, int idx) {
		
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
		
		ArrayList<ShopReviewVO> reviewVOS = shopService.getReview(idx);
		Double reviewAvg = shopService.getReviewAverage(idx);
		
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
		return "shop/shopUpdate";
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
		return "shop/shopInput";
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
	
	@PostMapping("/shopBuy")
	public String shopBuyGet(int idx, String quantity, String totalPrice, 
			@RequestParam(name = "optionSelect", defaultValue = "", required = false) String optionSelect
	) {
		ShopVO vo = shopService.getShopContent(idx);
		System.out.println("vo : " + vo);
		System.out.println("quantity : " + quantity);
		System.out.println("totalPrice : " + totalPrice);
		System.out.println("optionSelect : " + optionSelect);
		return "redirect:/shop/shopContent?idx=" + idx;
	}
	
	@GetMapping("/shopReview")
	public String shopReviewGet(Model model, int idx) {
		ShopVO vo = shopService.getShopContent(idx);
		model.addAttribute("title", vo.getTitle() + "리뷰 등록 | Min's");
		model.addAttribute("vo", vo);
		return "shop/shopReview";
	}
	
	@PostMapping("/shopReviewInput")
	public String shopReviewInputPost(Model model, ShopReviewVO vo, int idx, String mid) {
		int res = shopService.setReviewInput(vo, idx, mid);
		shopService.setPointUp(mid, "10");
		model.addAttribute("idx", idx);
		if(res != 0) {
			return "redirect:/message/reviewInputOk";
		}
		else {
			return "redirect:/message/reviewInputNo";
		}
	}
	
	
}