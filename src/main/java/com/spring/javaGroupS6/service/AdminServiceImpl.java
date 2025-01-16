package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.AdminDAO;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public ArrayList<ShopVO> getShopList() {
		return adminDAO.getShopList();
	}

	@Override
	public ArrayList<ShopReviewVO> getReviewList(int idx) {
		return adminDAO.getReviewList(idx);
	}

	@Override
	public ArrayList<ShopOrderVO> getOrderList() {
		return adminDAO.getOrderList();
	}

	@Override
	public ArrayList<CouponVO> getCouponList() {
		return adminDAO.getCouponList();
	}

	@Override
	public ArrayList<MemberVO> getCutomerList() {
		return adminDAO.getCutomerList();
	}

	@Override
	public ArrayList<MemberVO> getPartnerList() {
		return adminDAO.getPartnerList();
	}
	
	@Override
	public ArrayList<ShopVO> getShopReviewList() {
		return adminDAO.getShopReviewList();
	}
	
	@Override
	public ArrayList<ShopOrderVO> getVIP() {
		return adminDAO.getVIP();
	}
}
