package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaGroupS6.vo.ShopVO;

public interface ShopService {

	ArrayList<ShopVO> getShopList(String category);

	ArrayList<ShopVO> getMainShopList(String mainCategory);

	ArrayList<Integer> getSubCateCnt(String mainCategory);

	ArrayList<ShopVO> getSubShopAllList(String subCategory);

	ArrayList<Integer> getBrandCateCnt(String subCategory);

	ArrayList<ShopVO> getSubShopList(String subCategory, String company);

	ShopVO getShopContent(int idx);

	ArrayList<ShopVO> getList();

	int setShopUpdate(ShopVO vo, MultipartHttpServletRequest titleImg, HttpServletRequest request);

}
