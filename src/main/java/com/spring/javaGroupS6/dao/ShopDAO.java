package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.ShopVO;

public interface ShopDAO {

	ArrayList<ShopVO> getShopList(@Param("category") String category);

	ArrayList<ShopVO> getMainShopList(@Param("mainCategory") String mainCategory);

	ArrayList<Integer> getSubCateCnt(@Param("mainCategory") String mainCategory);

}
