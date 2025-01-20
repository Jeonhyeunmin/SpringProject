package com.spring.javaGroupS6.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.EventVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface AdminService {

	ArrayList<ShopVO> getShopList(String accept, String claim);

	ArrayList<ShopReviewVO> getReviewList(int idx);

	ArrayList<ShopOrderVO> getOrderList();

	ArrayList<CouponVO> getCouponList();

	ArrayList<MemberVO> getCutomerList(String userDel);

	ArrayList<PartnerVO> getPartnerList(String accept);

	ArrayList<ShopVO> getShopReviewList();

	ArrayList<ShopOrderVO> getMostUser();

	ArrayList<ShopOrderVO> getMostCompany();

	MemberVO getCustomerInfo(int idx);

	int getCustomerDelete(int idx);

	PartnerVO getPartnerInfo(int idx);

	int setPartnerAllAccpet();

	int setSelectAccept(int idx);

	int setCustomerDeleteAll();

	int setMemberLeaveCancel(int idx);

	int setPartnerLeaveCancel(int idx);

	ArrayList<ShopReviewVO> getReview();

	int setSelectNoPartnerAccept(int idx);

	int setNoPartner(int idx);

	int setPartnerYes(int idx);

	int setAllAccept();

	int setSelectAcceptPost(int idx);

	int setClaimAllDelete();

	int setSelectDelete(int idx);

	int setShopClaimNo(int idx);

	List<ShopOrderVO> filterOrders(String keyword, String status, String date);

	ShopOrderVO getOrderDetails(int idx);

	List<MemberVO> searchUsers(String keyword);

	List<PartnerVO> searchPartners(String keyword);

	int setAllAdjustment();

	int setSelectAdjustment(int idx);

	ArrayList<ShopOrderVO> getAdjustMentList();

	List<ShopOrderVO> searchOrders(String keyword);

	ArrayList<EventVO> getEventList();

	int setActiveEvent(int idx);

	int setDeActiveEvent(int idx);

	List<EventVO> getFilterEvents(String keyword, String status);

	List<CouponVO> searchCoupons(String startDate, String endDate, String keyword);


}
