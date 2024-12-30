package com.spring.javaGroupS6.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.dao.ShopDAO;
import com.spring.javaGroupS6.vo.ShopVO;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDAO shopDAO;
	
	@Autowired
	JavaProvide provide;

	@Override
	public ArrayList<ShopVO> getShopList(String category) {
		return shopDAO.getShopList(category);
	}

	@Override
	public ArrayList<ShopVO> getMainShopList(String mainCategory) {
		return shopDAO.getMainShopList(mainCategory);
	}

	@Override
	public ArrayList<Integer> getSubCateCnt(String mainCategory) {
		return shopDAO.getSubCateCnt(mainCategory);
	}

	@Override
	public ArrayList<ShopVO> getSubShopAllList(String subCategory) {
		return shopDAO.getSubShopAllList(subCategory);
	}

	@Override
	public ArrayList<Integer> getBrandCateCnt(String subCategory) {
		return shopDAO.getBrandCateCnt(subCategory);
	}

	@Override
	public ArrayList<ShopVO> getSubShopList(String subCategory, String company) {
		return shopDAO.getSubShopList(subCategory, company);
	}

	@Override
	public ShopVO getShopContent(int idx) {
		return shopDAO.getShopContent(idx);
	}
	
	@Override
	public ArrayList<ShopVO> getList() {
		return shopDAO.getList();
	}

	@Override
	public int setShopUpdate(ShopVO vo, MultipartHttpServletRequest titleImg, HttpServletRequest request) {
		ShopVO originVO = shopDAO.getShopContent(vo.getIdx());
		if(!originVO.getContent().equals(vo.getContent())) {
			if(originVO.getContent().contains("src=\"/")) {
				provide.imgDelete(originVO.getContent(), "category");
			}
			if(vo.getContent().contains("src=\"/")) {
				provide.imgCheck(vo.getContent(), "category");
				
				vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/category/"));
			}
		}
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
			try {
				List<MultipartFile> fileList = titleImg.getFiles("file");
				String oFileNames = "";
				String sFileNames = "";
				int fileSizes = 0;
				
				for(MultipartFile file : fileList) {
					String oFileName = file.getOriginalFilename();
					String sFileName = sdf.format(date) + "_" + oFileName;
					provide.WriteFile(file, sFileName, "category");
					
					oFileNames += oFileName + "/";
					sFileNames += sFileName + "/";
					fileSizes += file.getSize(); 
				}
				oFileNames = oFileNames.substring(0, oFileNames.length()-1);
				sFileNames = sFileNames.substring(0, sFileNames.length()-1);
				
				String realPath = request.getSession().getServletContext().getRealPath("/resources/data/category/");
				MultipartFile thumbnailImg = fileList.get(0);
				File oFile = new File(realPath + thumbnailImg.getOriginalFilename());
				
				thumbnailImg.transferTo(oFile);
				
				File tFile = new File(realPath + "s_" + thumbnailImg.getOriginalFilename());
				
				int width = 160;
				int height = width / 4 * 3;
				
				Thumbnailator.createThumbnail(oFile, tFile, width, height);
				
				vo.setTitleImg(sFileNames);
				vo.setFSize(fileSizes);
				vo.setThumbnail("s_" + thumbnailImg.getOriginalFilename());
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		return shopDAO.setShopUpdate(vo);
	}
}
