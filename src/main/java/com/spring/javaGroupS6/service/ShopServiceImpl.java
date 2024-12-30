package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.ShopDAO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDAO shopDAO;

	@Override
	public ArrayList<ShopVO> getShopList(String category) {
		return shopDAO.getShopList(category);
	}

	@Override
	public ArrayList<ShopVO> getMainShopList(String mainCategory) {
		return shopDAO.getMainShopList(mainCategory);
	}

	@Override
	public ArrayList<Integer> getSubCateCnt(String mainCategory) {
		return shopDAO.getSubCateCnt(mainCategory);
	}

	@Override
	public ArrayList<ShopVO> getSubShopAllList(String subCategory) {
		return shopDAO.getSubShopAllList(subCategory);
	}

	@Override
	public ArrayList<Integer> getBrandCateCnt(String subCategory) {
		return shopDAO.getBrandCateCnt(subCategory);
	}

	@Override
	public ArrayList<ShopVO> getSubShopList(String subCategory, String company) {
		return shopDAO.getSubShopList(subCategory, company);
	}

	@Override
	public ShopVO getShopContent(int idx) {
		return shopDAO.getShopContent(idx);
	}
	
	@Override
	public ArrayList<ShopVO> getList() {
		return shopDAO.getList();
	}
}
