package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.PartnerDAO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class PartnerServiceImpl implements PartnerService {
	
	@Autowired
	PartnerDAO partnerDAO;

	@Override
	public int setPartnerLeave(String mid) {
		return partnerDAO.setPartnerLeave(mid);
	}

	@Override
	public ArrayList<ShopOrderVO> getOrderList(String mid) {
		return partnerDAO.getOrderList(mid);
	}

	@Override
	public ArrayList<ShopVO> getShopList(String mid) {
		return partnerDAO.getShopList(mid);
	}
}
