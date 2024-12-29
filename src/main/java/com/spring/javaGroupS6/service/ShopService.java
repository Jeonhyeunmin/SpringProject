package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import com.spring.javaGroupS6.vo.ShopVO;

public interface ShopService {

	ArrayList<ShopVO> getShopList(String category);

	ArrayList<ShopVO> getMainShopList(String mainCategory);

	ArrayList<Integer> getSubCateCnt(String mainCategory);

}
