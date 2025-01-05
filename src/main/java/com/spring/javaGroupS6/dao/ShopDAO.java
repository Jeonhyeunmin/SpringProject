package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.ShopVO;

public interface ShopDAO {

	ArrayList<ShopVO> getShopList(@Param("category") String category, @Param("column") String column, @Param("accept") String accept, @Param("company") String company);

	ArrayList<Integer> getSubCateCnt(@Param("mainCategory") String mainCategory);

	ArrayList<Integer> getBrandCateCnt(@Param("subCategory") String subCategory);

	ShopVO getShopContent(@Param("idx") int idx);

	ArrayList<ShopVO> getList();

	int setShopUpdate(@Param("vo") ShopVO vo);

	int shopInput(@Param("vo") ShopVO vo);

	int getPostCount(@Param("mid") String mid);

	int setShopDelete(@Param("idx") int idx);

}
