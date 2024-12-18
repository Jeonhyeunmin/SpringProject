package com.spring.javaGroupS6.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.MemberDAO;
import com.spring.javaGroupS6.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemberIdSearch(String mid) {
		return memberDAO.getMemberIdSearch(mid);
	}
}
