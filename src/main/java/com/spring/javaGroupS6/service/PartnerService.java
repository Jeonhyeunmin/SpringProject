package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface PartnerService {

	int setPartnerLeave(String mid);

	ArrayList<ShopOrderVO> getOrderList(String mid);

	ArrayList<ShopVO> getShopList(String mid);

}
