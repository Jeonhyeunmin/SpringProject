package com.spring.javaGroupS6.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.dao.CommonDAO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	CommonDAO commonDAO;
	
	@Autowired
	JavaProvide provide;
	
	@Override
	public MemberVO getMemberIdSearch(String mid) {
		return commonDAO.getMemberIdSearch(mid);
	}

	@Override
	public int setMemberJoin(MemberVO vo) {
		
		String year = vo.getResident().substring(0,2);  
		String month = vo.getResident().substring(2,4);  
		String day = vo.getResident().substring(4,6);  
		if(vo.getResident() != null) {
			
			
			if(vo.getGender().equals("3") || vo.getGender().equals("4")) {
				year = "20" + year;
			}
			else {
				year = "19" + year;
			}
			
			
			if(vo.getGender().equals("1") || vo.getGender().equals("3")) {
				vo.setGender("남자");
			}
			else {
				vo.setGender("여자");
			}
		}
		
		vo.setResident(year + "-" + month + "-" + day);
		vo.setLevel(1);
		vo.setPhoto("noimage.png");
		
		if(vo.getPhoto() == null) {
		}
		
		return commonDAO.setMemberJoin(vo);
	}

	@Override
	public PartnerVO getPartnerIdSearch(String mid) {
		return commonDAO.getPartnerIdSearch(mid);
	}
	
	@Override
	public PartnerVO getPartnerSearch(String company) {
		return commonDAO.getPartnerSearch(company);
	}
	
	@Override
	public int setpartnerJoin(MultipartFile file, PartnerVO vo) {
		try {
		
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			
			String oFileName = file.getOriginalFilename();
			String sFileName = sdf.format(date) + "_" + oFileName;
			
			provide.WriteFile(file, sFileName, "partner/logo");
			
			if(file.getOriginalFilename() == null || file.getOriginalFilename().equals("")) {
				vo.setLogo("noimage.png");
			}
			
			vo.setLogo(sFileName);
			vo.setLevel(2);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return commonDAO.setpartnerJoin(vo);
	}

	@Override
	public MemberVO getMemberEmailSearch(String email) {
		return commonDAO.getMemberEmailSearch(email);
	}
	@Override
	public int setMemberUpdate(MemberVO vo) {
		return commonDAO.setMemberUpdate(vo);
	}

	@Override
	public void setLastDateUpdate(String table, String today, String mid) {
		commonDAO.setLastDateUpdate(table, today, mid);
	}

	@Override
	public ArrayList<ShopVO> getShopRankList(String category1, String category2, String category3, String category4, String category5) {
		commonDAO.initializeVariables();
		return commonDAO.getShopRankList(category1, category2, category3, category4, category5);
	}
	
	@Override
	public ArrayList<String> getSubCategory() {
		return commonDAO.getSubCategory();
	}
	
	@Override
	public ArrayList<ShopVO> getNewShopList() {
		return commonDAO.getNewShopList();
	}
}
