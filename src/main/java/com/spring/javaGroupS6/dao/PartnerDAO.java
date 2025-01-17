package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface PartnerDAO {

	int setPartnerLeave(@Param("mid") String mid);

	ArrayList<ShopOrderVO> getOrderList(@Param("mid") String mid, @Param("status") String status);

	ArrayList<ShopVO> getShopList(@Param("mid") String mid);

	int setDeliveryStart(@Param("idx") int idx);

	int setDeliveryAll(@Param("mid") String mid);

	int setSelectDelivery(@Param("idx") String idx, @Param("mid") String mid);

	ShopOrderVO getOrderDetail(@Param("idx") int idx);

	int setDeliveryEnd(@Param("idx") int idx);

	int setDeliveryFinish(@Param("mid") String mid);

	int setAdjustment(@Param("idx") int idx);

	ArrayList<ShopVO> getClaimPostList(@Param("mid") String mid);

	void setPartnerPwdChange(@Param("pwd") String pwd, @Param("mid") String mid);

	int setPartnerUpdate(@Param("vo") PartnerVO vo);


}
