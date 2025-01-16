package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface AdminService {

	ArrayList<ShopVO> getShopList();

	ArrayList<ShopReviewVO> getReviewList(int idx);

	ArrayList<ShopOrderVO> getOrderList();

	ArrayList<CouponVO> getCouponList();

	ArrayList<MemberVO> getCutomerList();

	ArrayList<MemberVO> getPartnerList();

	ArrayList<ShopVO> getShopReviewList();

	ArrayList<ShopOrderVO> getVIP();

}
