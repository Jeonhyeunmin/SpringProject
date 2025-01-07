package com.spring.javaGroupS6.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.dao.CommonDAO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;

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
		
		if(vo.getResident() != null) {
			String year = vo.getResident().substring(0,2);  
			String month = vo.getResident().substring(2,4);  
			String day = vo.getResident().substring(4,6);  
			
			
			if(Integer.parseInt(year) >= 00 && Integer.parseInt(year) < 50) {
				year = "20" + year;
			}
			else if(Integer.parseInt(year) >= 50 && Integer.parseInt(year) <= 99) {
				year = "19" + year;
			}
			
			vo.setResident(year + "-" + month + "-" + day);
			
			if(vo.getGender().equals("1") || vo.getGender().equals("3")) {
				vo.setGender("남자");
			}
			else {
				vo.setGender("여자");
			}
		}
		
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
}
