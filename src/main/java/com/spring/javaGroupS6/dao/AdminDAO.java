package com.spring.javaGroupS6.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface AdminDAO {

	ArrayList<ShopVO> getShopList(@Param("accept") String accept, @Param("claim") String claim);

	ArrayList<ShopReviewVO> getReviewList(@Param("idx") int idx);

	ArrayList<ShopOrderVO> getOrderList();

	ArrayList<CouponVO> getCouponList();

	ArrayList<MemberVO> getCutomerList(@Param("userDel") String userDel);

	ArrayList<PartnerVO> getPartnerList(@Param("accept") String accept);

	ArrayList<ShopVO> getShopReviewList();

	ArrayList<ShopOrderVO> getMostUser();

	ArrayList<ShopOrderVO> getMostCompany();

	MemberVO getCustomerInfo(@Param("idx") int idx);

	int getCustomerDelete(@Param("idx") int idx);

	PartnerVO getPartnerInfo(@Param("idx") int idx);

	int setPartnerAllAccpet();

	int setSelectAccept(@Param("idx") int idx);

	int setCustomerDeleteAll();

	int setMemberLeaveCancel(@Param("idx") int idx);

	int setPartnerLeaveCancel(@Param("idx") int idx);

	ArrayList<ShopReviewVO> getReview();

	int setSelectNoPartnerAccept(@Param("idx") int idx);

	int setNoPartner(@Param("idx") int idx);

	int setPartnerYes(@Param("idx")int idx);

	int setAllAccept();

	int setSelectAcceptPost(@Param("idx") int idx);

	int setClaimAllDelete();

	int setSelectDelete(@Param("idx") int idx);

	int setShopClaimNo(@Param("idx") int idx);

	List<ShopOrderVO> filterOrders(@Param("keyword") String keyword, @Param("status") String status, @Param("date") String date);

	ShopOrderVO getOrderDetails(@Param("idx") int idx);

	List<MemberVO> searchUsers(@Param("keyword") String keyword);

	List<PartnerVO> searchPartners(@Param("keyword")String keyword);


}
