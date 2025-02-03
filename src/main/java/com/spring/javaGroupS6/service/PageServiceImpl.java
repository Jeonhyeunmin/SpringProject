package com.spring.javaGroupS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaGroupS6.dao.PageDAO;

@Service
public class PageServiceImpl implements PageService {

	@Autowired
	PageDAO pageDAO;
	
	@Override
	public int getTotRecCnt(String type, String user, String condition) {
		return pageDAO.getTotRecCnt(type, user, condition);
	}

	@Override
	public <T> List<T> List(String type, int startIndexNo, int pageSize, String user, String condition) {
		return pageDAO.List(type, startIndexNo, pageSize, user, condition);
	}
}
