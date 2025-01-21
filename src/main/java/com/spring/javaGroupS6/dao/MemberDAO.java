package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;

public interface MemberDAO {

	ArrayList<CouponVO> getMyCoupon(@Param("mid") String mid);

	int setMemberUpdate(@Param("vo") MemberVO vo);

	int setUserLeave(@Param("mid") String mid);

	void setPwdChange(@Param("pwd") String pwd, @Param("mid") String mid);

	void setPointUpdate(@Param("addPoint") int addPoint, @Param("usePoint") int usePoint, @Param("mid") String mid);

	ArrayList<ShopOrderVO> getMyOrder(@Param("mid") String mid);

	int setBuyDecide(@Param("idx") int idx);

	int setorderExchange(@Param("idx") int idx);

	ArrayList<ShopReviewVO> getMyReviewList(@Param("mid") String mid);


}
