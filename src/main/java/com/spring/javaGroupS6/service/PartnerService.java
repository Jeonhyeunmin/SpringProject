package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface PartnerService {

	int setPartnerLeave(String mid);

	ArrayList<ShopOrderVO> getOrderList(String mid, String status);

	ArrayList<ShopVO> getShopList(String mid);

	int setDeliveryStart(int idx);

	int setDeliveryAll(String mid);

	int setSelectDelivery(String idx, String mid);

	ShopOrderVO getOrderDetail(int idx);

	int setDeliveryEnd(int idx);

	int setDeliveryFinish(String mid);

	int setAdjustment(int idx);

	ArrayList<ShopVO> getClaimPostList(String mid);

	void setPartnerPwdChange(String pwd, String mid);

	int setPartnerUpdate(MultipartFile file, PartnerVO vo, HttpSession session);

	int setAllApplication(String mid);

	ArrayList<ShopVO> getShopReviewList(String mid);

	ArrayList<ShopReviewVO> getReview(String mid);



}
