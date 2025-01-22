package com.spring.javaGroupS6.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.ReviewLikesVO;
import com.spring.javaGroupS6.vo.ShopCartVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;
import com.spring.javaGroupS6.vo.SubCategoryVO;

public interface ShopService {

	ArrayList<ShopVO> getShopList(String category, String mainCategory, String subCategory, String accept, String company);

	ArrayList<Integer> getSubCateCnt(String category, String mainCategory);

	ArrayList<Integer> getBrandCateCnt(String category, String mainCategory, String subCategory);

	ShopVO getShopContent(int idx);

	ArrayList<ShopVO> getList();

	int setShopUpdate(ShopVO vo, MultipartHttpServletRequest titleImg, HttpServletRequest request);

	int shopInput(ShopVO vo, MultipartRequest titleImg, HttpServletRequest request);

	int getPostCount(String mid);

	int setShopDelete(int idx, HttpSession session);

	ArrayList<MainCategoryVO> getMainCategoryList(String category);

	ArrayList<SubCategoryVO> getSubCategoryList(String category, String mainCategory);

	Double getReviewAverage(int idx);

	ArrayList<ShopReviewVO> getReview(int idx, String user);

	int setReviewInput(ShopReviewVO vo, int idx, String mid);

	void setPointUp(String mid, String point);

	void setReviewGoodCheck(int idx);

	int setReviewGoodInput(int idx, int reviewIdx, String mid);

	ReviewLikesVO getReviewLikeInfo(int idx, String mid);

	ArrayList<Integer> getMyLikes(int idx, String mid);

	int setReviewClaim(int idx);

	int setReviewDelete(int idx);
	
	ShopReviewVO getMyReview(int idx);

	int setReviewUpdate(ShopReviewVO vo);

	ShopCartVO getMyCartSearch(int shopIdx, String optionSelect, String mid);

	void setCartQuantityUpdate(int idx, int quantity, int totalPrice);

	int setCartInput(ShopCartVO vo);

	ArrayList<ShopCartVO> getMyCart(String mid);

	ShopOrderVO getIdxCart(String idx);

	ShopOrderVO getOneOrder(int idx);

	int setCartDelete(int idx);

	CouponVO getCouponInfo(int idx);

	void setShopOrder(ShopOrderVO vo);

	void setCartDeleteAll(int cartIdx);

	void setUseCoupon(ShopOrderVO vo);

	void setReviewOk(int idx);

	ArrayList<ShopVO> getPartnerShopList(String mid);

	ArrayList<ShopVO> getSearch(String query);

	ArrayList<ShopVO> getBestShopTop3();

	ArrayList<ShopVO> getdateShopTop3();

	ArrayList<ShopVO> getNewShop();

	List<ShopVO> filterProducts(String search, String category, String price);

}
