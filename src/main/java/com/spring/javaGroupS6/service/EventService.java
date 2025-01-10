package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.EventVO;
import com.spring.javaGroupS6.vo.MemberVO;

public interface EventService {

int setEventInput(HttpServletRequest request, MultipartFile file, EventVO vo);

ArrayList<EventVO> getEventList();

EventVO getEvent(int idx);

CouponVO getEventCoupon(int idx);

int setCoupon(HttpServletRequest request, CouponVO vo, MemberVO userInfo);

CouponVO getCouponDuplication(int idx);

}
