package com.spring.javaGroupS6.contoller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaGroupS6.service.ShopService;
import com.spring.javaGroupS6.vo.ShopVO;

@Controller
@RequestMapping("/shop")
public class ShopContoller {
	
	@Autowired
	ShopService shopService;

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
		if(vo.getContent().contains("/")) {
			String titleImgArr[] = vo.getTitle().split("/");
			for(int i = 0; i < titleImgArr.length; i++) {
				titleImgs.add(titleImgArr[i]);
			}
			
		}
		
		model.addAttribute("titleImgs", titleImgs);
		model.addAttribute("vo", vo);
		return "shop/shopContent";
	}
}