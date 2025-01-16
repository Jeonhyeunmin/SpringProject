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
	public ArrayList<ShopOrderVO> getOrderList(String mid, String status) {
		return partnerDAO.getOrderList(mid, status);
	}

	@Override
	public ArrayList<ShopVO> getShopList(String mid) {
		return partnerDAO.getShopList(mid);
	}

	@Override
	public int setDeliveryStart(int idx) {
		return partnerDAO.setDeliveryStart(idx);
	}
	
	@Override
	public int setDeliveryAll(String mid) {
		return partnerDAO.setDeliveryAll(mid);
	}
	
	@Override
	public int setSelectDelivery(String idx, String mid) {
		return partnerDAO.setSelectDelivery(idx, mid);
	}

	@Override
	public ShopOrderVO getOrderDetail(int idx) {
		return partnerDAO.getOrderDetail(idx);
	}
	
	@Override
	public int setDeliveryEnd(int idx) {
		return partnerDAO.setDeliveryEnd(idx);
	}

	@Override
	public int setDeliveryFinish(String mid) {
		return partnerDAO.setDeliveryFinish(mid);
	}
	
	@Override
	public int setAdjustment(int idx) {
		return partnerDAO.setAdjustment(idx);
	}
	
	@Override
	public ArrayList<ShopVO> getClaimPostList(String mid) {
		return partnerDAO.getClaimPostList(mid);
	}
	
}
