package com.spring.javaGroupS6.service;

import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;

public interface CommonService {
	
	MemberVO getMemberIdSearch(String mid);

	int setMemberJoin(MemberVO vo);

	PartnerVO getPartnerIdSearch(String mid);

	PartnerVO getPartnerSearch(String company);

}
