package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;

public interface MemberService {

	ArrayList<CouponVO> getMyCoupon(String mid);

	int setMemberUpdate(MultipartFile file, MemberVO vo, HttpSession session);

	int setUserLeave(String mid);

	void setPwdChange(String pwd, String mid);

	void setPointUpdate(int addPoint, int usePoint, String mid);

	ArrayList<ShopOrderVO> getMyOrder(String mid);

	int setBuyDecide(int idx);

	int setorderExchange(int idx);


}
