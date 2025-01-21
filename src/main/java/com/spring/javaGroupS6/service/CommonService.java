package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface CommonService {
	
	MemberVO getMemberIdSearch(String mid);

	int setMemberJoin(MemberVO vo);

	PartnerVO getPartnerIdSearch(String mid);

	PartnerVO getPartnerSearch(String company);

	int setpartnerJoin(MultipartFile logo, PartnerVO vo);

	MemberVO getMemberEmailSearch(String email);

	int setMemberUpdate(MemberVO vo);

	void setLastDateUpdate(String table, String today, String mid);

	ArrayList<ShopVO> getShopRankList(String category1, String category2, String category3, String category4, String category5);

	ArrayList<String> getSubCategory();

	ArrayList<ShopVO> getNewShopList();


}
