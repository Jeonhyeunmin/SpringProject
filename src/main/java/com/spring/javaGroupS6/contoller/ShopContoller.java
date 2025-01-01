package com.spring.javaGroupS6.contoller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.spring.javaGroupS6.service.ShopService;
import com.spring.javaGroupS6.vo.ShopVO;

@Controller
@RequestMapping("/shop")
public class ShopContoller {
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	JavaProvide provide;
	

	@GetMapping("/shopList")
	public String shopListGet(Model model, HttpServletRequest request, String category) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/images/shop/" + category + "/");
		String files[] = new File(realPath).list();
		
		model.addAttribute("files", files);
		
		ArrayList<ShopVO> vos = shopService.getShopList(category);
		ArrayList<String> mainCategory = new ArrayList<String>();
		ArrayList<ShopVO> products = new ArrayList<ShopVO>();
		ArrayList<String> brands = new ArrayList<String>();
		for(int i = 0; i < 5; i++) {
			brands.add(vos.get(i).getCompany());
		}
		
		
		for(int i = 0; i < vos.size(); i++) {
			if(!mainCategory.contains(vos.get(i).getMainCategory())) {
				mainCategory.add(vos.get(i).getMainCategory());
			}
			products.add(vos.get(i));
		}
		
		model.addAttribute("title", category + " | Min's");
		model.addAttribute("category", category);
		model.addAttribute("mainCategoryList", mainCategory);
		model.addAttribute("vos", vos);
		model.addAttribute("products", products);
		model.addAttribute("brands", brands);
		
		return "shop/shopList";
	}
	
	@GetMapping("/shopMainList")
	public String shopMainListGet(Model model, String mainCategory) {
		
		ArrayList<ShopVO> vos = shopService.getMainShopList(mainCategory);
		ArrayList<String> subCategory = new ArrayList<String>();
		ArrayList<Integer> subCateCnt = shopService.getSubCateCnt(mainCategory);
		String category = "";
		
		for(int i = 0; i < vos.size(); i++) {
			if(!subCategory.contains(vos.get(i).getSubCategory())) {
				subCategory.add(vos.get(i).getSubCategory());
				category = vos.get(i).getCategory();
			}
		}
		
		model.addAttribute("title", mainCategory + " | Min's");
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
		ArrayList<ShopVO> allList = shopService.getSubShopAllList(subCategory);
		ArrayList<ShopVO> vos = shopService.getSubShopList(subCategory, company);
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
		
		model.addAttribute("title", subCategory + " | Min's");
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
		
		
		model.addAttribute("titleImgs", titleImgs);
		model.addAttribute("vo", vo);
		return "shop/shopContent";
	}
	
	@ResponseBody
	@PostMapping("/mainCategoryLoad")
	public ArrayList<String> mainCategoryLoadPost(String category) {
		
		ArrayList<ShopVO> vos = shopService.getShopList(category);
		ArrayList<String> mainCategoryList = new ArrayList<String>();
		
		for(int i = 0; i < vos.size(); i++) {
			if(!mainCategoryList.contains(vos.get(i).getMainCategory())) {
				mainCategoryList.add(vos.get(i).getMainCategory());
			}
		}
		
		return mainCategoryList;
	}
	
	@ResponseBody
	@PostMapping("/subCategoryLoad")
	public ArrayList<String> subCategoryLoadPost(String mainCategory) {
		
		ArrayList<ShopVO> vos = shopService.getMainShopList(mainCategory);
		ArrayList<String> subCategoryList = new ArrayList<String>();
		for(int i = 0; i < vos.size(); i++) {
			if(!subCategoryList.contains(vos.get(i).getSubCategory())) {
				subCategoryList.add(vos.get(i).getSubCategory());
			}
		}
		return subCategoryList;
	}
	
	@GetMapping("/shopUpdate")
	public String shopUpdateGet(Model model, int idx) {
		ShopVO vo = shopService.getShopContent(idx);
		
		if(vo.getContent().contains("src=\"/")) {
			provide.imgBackup(vo.getContent(), "category");
		}
		provide.titleImgBackup(vo.getTitleImg(), "category");
		
		ArrayList<ShopVO> vos = shopService.getList();
		ArrayList<String> categoryList = new ArrayList<String>();
		
		for(int i = 0; i < vos.size(); i++) {
			if(!categoryList.contains(vos.get(i).getCategory())) {
				categoryList.add(vos.get(i).getCategory());
			}
		}
		
		model.addAttribute("categoryList", categoryList);
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
	
	
}