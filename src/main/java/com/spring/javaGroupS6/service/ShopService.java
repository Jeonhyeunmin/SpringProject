package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.ShopVO;
import com.spring.javaGroupS6.vo.SubCategoryVO;

public interface ShopService {

	ArrayList<ShopVO> getShopList(String category, String column, String accept, String company);


	ArrayList<Integer> getSubCateCnt(String mainCategory);


	ArrayList<Integer> getBrandCateCnt(String subCategory);

	ShopVO getShopContent(int idx);

	ArrayList<ShopVO> getList();

	int setShopUpdate(ShopVO vo, MultipartHttpServletRequest titleImg, HttpServletRequest request);

	int shopInput(ShopVO vo, MultipartRequest titleImg, HttpServletRequest request);

	int getPostCount(String mid);

	int setShopDelete(int idx);


	ArrayList<MainCategoryVO> getMainCategoryList(String category);


	ArrayList<SubCategoryVO> getSubCategoryList(String mainCategory);

}
