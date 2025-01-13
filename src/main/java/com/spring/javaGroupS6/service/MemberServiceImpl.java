package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.MemberDAO;
import com.spring.javaGroupS6.vo.CouponVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public ArrayList<CouponVO> getMyCoupon(String mid) {
		return memberDAO.getMyCoupon(mid);
	}
}
