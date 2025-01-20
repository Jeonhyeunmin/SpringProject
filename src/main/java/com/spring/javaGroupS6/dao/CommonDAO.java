package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface CommonDAO {

	MemberVO getMemberIdSearch(@Param("mid") String mid);

	int setMemberJoin(@Param("vo") MemberVO vo);

	PartnerVO getPartnerIdSearch(@Param("mid") String mid);

	PartnerVO getPartnerSearch(@Param("company") String company);

	int setpartnerJoin(@Param("vo") PartnerVO vo);

	MemberVO getMemberEmailSearch(@Param("email") String email);

	int setMemberUpdate(@Param("vo") MemberVO vo);

	void setLastDateUpdate(@Param("table") String table, @Param("today") String today, @Param("mid") String mid);

	void initializeVariables();

	ArrayList<ShopVO> getShopRankList(@Param("category1") String category1, @Param("category2") String category2, @Param("category3") String category3, @Param("category4") String category4, @Param("category5") String category5);

	ArrayList<String> getSubCategory();

	ArrayList<ShopVO> getNewShopList();

}
