package com.spring.javaGroupS6.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.ShopDAO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDAO shopDAO;

	@Override
	public ArrayList<ShopVO> getShopList(String category) {
		return shopDAO.getShopList(category);
	}
}
