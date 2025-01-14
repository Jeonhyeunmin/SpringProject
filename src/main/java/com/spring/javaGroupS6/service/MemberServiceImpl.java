package com.spring.javaGroupS6.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.dao.MemberDAO;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	JavaProvide provide;
	
	@Autowired
	CommonService commonService;

	@Override
	public ArrayList<CouponVO> getMyCoupon(String mid) {
		return memberDAO.getMyCoupon(mid);
	}
	
	@Override
	public int setMemberUpdate(MultipartFile file, MemberVO vo, HttpSession session) {
		if(vo.getGender().equals("male")) {
			vo.setGender("남자");
		}
		else {
			vo.setGender("여자");
		}
		
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			
			String oFileName = file.getOriginalFilename();
			String sFileName = sdf.format(date) + "_" + oFileName;
		
			provide.WriteFile(file, sFileName, "member");
			
			String realPath = session.getServletContext().getRealPath("/resources/data/member/");
			MemberVO memVO = commonService.getMemberIdSearch(vo.getMid());
			if(file.getOriginalFilename() == null || file.getOriginalFilename().equals("")) {
				vo.setPhoto(memVO.getPhoto());
			}
			else {
				if(!memVO.getPhoto().equals("noimage.png")) {
					provide.fileDelete(realPath + memVO.getPhoto());
				}
				vo.setPhoto(sFileName);
			}
			
		} catch (IOException e) {e.printStackTrace();}
		
		return memberDAO.setMemberUpdate(vo);
	}
	
	@Override
	public int setUserLeave(String mid) {
		return memberDAO.setUserLeave(mid);
	}
	
	@Override
	public void setPwdChange(String pwd, String mid) {
		 memberDAO.setPwdChange(pwd, mid);
	}

	@Override
	public void setPointUpdate(int addPoint, int usePoint, String mid) {
		memberDAO.setPointUpdate(addPoint, usePoint, mid);
	}
}
