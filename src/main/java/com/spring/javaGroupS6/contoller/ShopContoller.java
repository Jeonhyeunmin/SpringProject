package com.spring.javaGroupS6.contoller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		for(int i = 0; i < vos.size(); i++) {
			if(!mainCategory.contains(vos.get(i).getMainCategory())) {
				mainCategory.add(vos.get(i).getMainCategory());
			}
		}
		model.addAttribute("title", category + " | Min's");
		model.addAttribute("category", category);
		model.addAttribute("mainCategoryList", mainCategory);
		model.addAttribute("vos", vos);
		
		return "shop/shopList";
	}
	
	@GetMapping("/shopMainList")
	public String shopMainListGet(Model model, HttpServletRequest request, String mainCategory) {
		
		ArrayList<ShopVO> vos = shopService.getShopList(mainCategory);
		ArrayList<String> subCategory = new ArrayList<String>();
		for(int i = 0; i < vos.size(); i++) {
			if(!mainCategory.contains(vos.get(i).getMainCategory())) {
				subCategory.add(vos.get(i).getMainCategory());
			}
		}
		model.addAttribute("title", subCategory + " | Min's");
		model.addAttribute("subCategory", subCategory);
		model.addAttribute("subCategoryList", subCategory);
		model.addAttribute("vos", vos);
		
		return "shop/shopMainList";
	}
}