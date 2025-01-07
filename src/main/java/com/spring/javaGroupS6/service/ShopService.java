package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.ReviewLikesVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
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

	Double getReviewAverage(int idx);

	ArrayList<ShopReviewVO> getReview(int idx);

	int setReviewInput(ShopReviewVO vo, int idx, String mid);


	void setPointUp(String mid, String point);

	void setReviewGoodCheck(int idx);

	int setReviewGoodInput(int idx, int reviewIdx, String mid);

	ReviewLikesVO getReviewLikeInfo(int idx, String mid);

	ArrayList<Integer> getMyLikes(int idx, String mid);
}
