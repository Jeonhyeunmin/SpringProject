package com.spring.javaGroupS6.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;

public interface CommonDAO {

	MemberVO getMemberIdSearch(@Param("mid") String mid);

	int setMemberJoin(@Param("vo") MemberVO vo);

	PartnerVO getPartnerIdSearch(@Param("mid") String mid);

	PartnerVO getPartnerSearch(@Param("company") String company);

	int setpartnerJoin(@Param("vo") PartnerVO vo);

	MemberVO getMemberEmailSearch(@Param("email") String email);

}
