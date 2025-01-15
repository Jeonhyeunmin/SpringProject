package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopVO;

public interface PartnerDAO {

	int setPartnerLeave(@Param("mid") String mid);

	ArrayList<ShopOrderVO> getOrderList(@Param("mid") String mid);

	ArrayList<ShopVO> getShopList(@Param("mid") String mid);

}
