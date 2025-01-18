package com.spring.javaGroupS6.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.AdminDAO;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public ArrayList<ShopVO> getShopList(String accept, String claim) {
		return adminDAO.getShopList(accept, claim);
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
	public ArrayList<MemberVO> getCutomerList(String userDel) {
		return adminDAO.getCutomerList(userDel);
	}

	@Override
	public ArrayList<PartnerVO> getPartnerList(String accept) {
		return adminDAO.getPartnerList(accept);
	}
	
	@Override
	public ArrayList<ShopVO> getShopReviewList() {
		return adminDAO.getShopReviewList();
	}
	
	@Override
	public ArrayList<ShopOrderVO> getMostUser() {
		return adminDAO.getMostUser();
	}
	
	@Override
	public ArrayList<ShopOrderVO> getMostCompany() {
		return adminDAO.getMostCompany();
	}
	
	@Override
	public MemberVO getCustomerInfo(int idx) {
		return adminDAO.getCustomerInfo(idx);
	}
	
	@Override
	public int getCustomerDelete(int idx) {
		return adminDAO.getCustomerDelete(idx);
	}
	
	@Override
	public PartnerVO getPartnerInfo(int idx) {
		return adminDAO.getPartnerInfo(idx);
	}
	
	@Override
	public int setPartnerAllAccpet() {
		return adminDAO.setPartnerAllAccpet();
	}
	
	@Override
	public int setSelectAccept(int idx) {
		return adminDAO.setSelectAccept(idx);
	}
	
	@Override
	public int setCustomerDeleteAll() {
		return adminDAO.setCustomerDeleteAll();
	}
	
	@Override
	public int setMemberLeaveCancel(int idx) {
		return adminDAO.setMemberLeaveCancel(idx);
	}
	
	@Override
	public int setPartnerLeaveCancel(int idx) {
		return adminDAO.setPartnerLeaveCancel(idx);
	}

	@Override
	public ArrayList<ShopReviewVO> getReview() {
		return adminDAO.getReview();
	}
	
	@Override
	public int setSelectNoPartnerAccept(int idx) {
		return adminDAO.setSelectNoPartnerAccept(idx);
	}
	
	@Override
	public int setNoPartner(int idx) {
		return adminDAO.setNoPartner(idx);
	}
	
	@Override
	public int setPartnerYes(int idx) {
		return adminDAO.setPartnerYes(idx);
	}

	@Override
	public int setAllAccept() {
		return adminDAO.setAllAccept();
	}
	
	@Override
	public int setSelectAcceptPost(int idx) {
		return adminDAO.setSelectAcceptPost(idx);
	}

	@Override
	public int setClaimAllDelete() {
		return adminDAO.setClaimAllDelete();
	}
	
	@Override
	public int setSelectDelete(int idx) {
		return adminDAO.setSelectDelete(idx);
	}
	
	@Override
	public int setShopClaimNo(int idx) {
		return adminDAO.setShopClaimNo(idx);
	}
	
	@Override
	public List<ShopOrderVO> filterOrders(String keyword, String status, String date) {
		return adminDAO.filterOrders(keyword, status, date);
	}
	
	@Override
	public ShopOrderVO getOrderDetails(int idx) {
		return adminDAO.getOrderDetails(idx);
	}
	
	@Override
	public List<MemberVO> searchUsers(String keyword) {
		return adminDAO.searchUsers(keyword);
	}
	
	@Override
	public List<PartnerVO> searchPartners(String keyword) {
		return adminDAO.searchPartners(keyword);
	}
}
