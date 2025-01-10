package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.EventVO;

public interface EventDAO {

	int setEventInput(@Param("vo") EventVO vo);

	ArrayList<EventVO> getEventList();

	EventVO getEvent(@Param("idx") int idx);

	CouponVO getEventCoupon(@Param("idx") int idx);

	int setCoupon(@Param("vo") CouponVO vo);

	CouponVO getCouponDuplication(@Param("eventIdx") int eventIdx);


}
