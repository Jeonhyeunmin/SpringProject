package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.CouponVO;

public interface MemberDAO {

	ArrayList<CouponVO> getMyCoupon(@Param("mid") String mid);


}
