package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import com.spring.javaGroupS6.vo.CouponVO;

public interface MemberService {

	ArrayList<CouponVO> getMyCoupon(String mid);


}
