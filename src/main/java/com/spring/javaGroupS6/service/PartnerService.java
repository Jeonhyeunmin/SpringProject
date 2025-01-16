package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import com.spring.javaGroupS6.vo.ShopOrderVO;
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



}
