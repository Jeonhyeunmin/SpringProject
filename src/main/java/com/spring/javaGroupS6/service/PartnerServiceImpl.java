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
import com.spring.javaGroupS6.dao.PartnerDAO;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopVO;

@Service
public class PartnerServiceImpl implements PartnerService {
	
	@Autowired
	PartnerDAO partnerDAO;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	JavaProvide provide;

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
	
	@Override
	public void setPartnerPwdChange(String pwd, String mid) {
		partnerDAO.setPartnerPwdChange(pwd, mid);
	}
	
	@Override
	public int setPartnerUpdate(MultipartFile file, PartnerVO vo, HttpSession session) {
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			
			String oFileName = file.getOriginalFilename();
			String sFileName = sdf.format(date) + "_" + oFileName;
		
			provide.WriteFile(file, sFileName, "partner/logo");
			
			String realPath = session.getServletContext().getRealPath("/resources/data/partner/logo/");
			PartnerVO parVO = commonService.getPartnerIdSearch(vo.getMid());
			if(file.getOriginalFilename() == null || file.getOriginalFilename().equals("")) {
				vo.setLogo(parVO.getLogo());
			}
			else {
				if(!parVO.getLogo().equals("noimage.png")) {
					provide.fileDelete(realPath + parVO.getLogo());
				}
				vo.setLogo(sFileName);
			}
			
		} catch (IOException e) {e.printStackTrace();}
		return partnerDAO.setPartnerUpdate(vo);
	}
	
	@Override
	public int setAllApplication(String mid) {
		return partnerDAO.setAllApplication(mid);
	}
	
}
