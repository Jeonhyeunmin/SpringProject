package com.spring.javaGroupS6.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.dao.ShopDAO;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.ReviewLikesVO;
import com.spring.javaGroupS6.vo.ShopCartVO;
import com.spring.javaGroupS6.vo.ShopOrderVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;
import com.spring.javaGroupS6.vo.SubCategoryVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDAO shopDAO;
	
	@Autowired
	JavaProvide provide;

	@Override
	public ArrayList<ShopVO> getShopList(String category, String mainCategory, String subCategory, String accept, String company) {
		return shopDAO.getShopList(category, mainCategory, subCategory, accept, company);
	}


	@Override
	public ArrayList<Integer> getSubCateCnt(String category, String mainCategory) {
		return shopDAO.getSubCateCnt(category, mainCategory);
	}


	@Override
	public ArrayList<Integer> getBrandCateCnt(String category, String mainCategory, String subCategory) {
		return shopDAO.getBrandCateCnt(category, mainCategory, subCategory);
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
	public int setShopUpdate(ShopVO vo, @RequestParam("titleImg") MultipartHttpServletRequest titleImg, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/category/");
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
				String origFilePath = "";
				
				List<MultipartFile> fileList = titleImg.getFiles("file");
				
				String oFileNames = "";
				String sFileNames = originVO.getTitleImg();
				int fileSizes = 0;
				
				String tFile = originVO.getThumbnail();
				
				if(!fileList.get(0).isEmpty()) {
					String titImg[] = originVO.getTitleImg().split("/");
					for(int i = 0; i < titImg.length; i++) {
						origFilePath = realPath + titImg[i];
						provide.fileDelete(origFilePath);
					}
					
					sFileNames = "";
					
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
				
					String thumbImg = originVO.getThumbnail();
					origFilePath = realPath + thumbImg;
					provide.fileDelete(origFilePath);
					MultipartFile thumbnailImg = fileList.get(0);
					
					tFile = "s_" + sdf.format(date) + "_" +  thumbnailImg.getOriginalFilename();
					
					provide.WriteFile(thumbnailImg, tFile, "category");
				}
				
				vo.setTitleImg(sFileNames);
				vo.setFSize(fileSizes);
				vo.setThumbnail(tFile);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		return shopDAO.setShopUpdate(vo);
	}

	@Override
	public int shopInput(ShopVO vo, MultipartRequest titleImg, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/category/");
		if(vo.getContent().contains("src=\"/")) {
			provide.imgCheck(vo.getContent(), "category");
		}
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/category/"));
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		try {
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			String tFile = "";
			String origFilePath = "";
			
			List<MultipartFile> fileList = titleImg.getFiles("file");
			
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
			
			
			String thumbImg = "";
			origFilePath = realPath + thumbImg;
			provide.fileDelete(origFilePath);
			MultipartFile thumbnailImg = fileList.get(0);
			
			tFile = "s_" + sdf.format(date) + "_" +  thumbnailImg.getOriginalFilename();
			
			provide.WriteFile(thumbnailImg, tFile, "category");
			
			vo.setTitleImg(sFileNames);
			vo.setFSize(fileSizes);
			vo.setThumbnail(tFile);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return shopDAO.shopInput(vo);
	}
	
	@Override
	public int getPostCount(String mid) {
		return shopDAO.getPostCount(mid);
	}
	
	@Override
	public int setShopDelete(int idx, HttpSession session) {
		ShopVO vo = shopDAO.getShopContent(idx);
		String realPath = session.getServletContext().getRealPath("/resources/data/category/");
		provide.fileDelete(realPath + vo.getTitleImg());
		provide.fileDelete(realPath + vo.getThumbnail());
		if(vo.getContent().contains("<img")) {
			provide.imgDelete(vo.getContent(), "category");
		}
		
		return shopDAO.setShopDelete(idx);
	}

	@Override
	public ArrayList<MainCategoryVO> getMainCategoryList(String category) {
		return shopDAO.getMainCategoryList(category);
	}
	
	@Override
	public ArrayList<SubCategoryVO> getSubCategoryList(String category, String mainCategory) {
		return shopDAO.getSubCategoryList(category, mainCategory);
	}

	@Override
	public Double getReviewAverage(int idx) {
		return shopDAO.getReviewAverage(idx);
	}
	
	@Override
	public ArrayList<ShopReviewVO> getReview(int idx, String user) {
		return shopDAO.getReview(idx, user);
	}
	
	@Override
	public int setReviewInput(ShopReviewVO vo, int idx, String mid) {
		return shopDAO.setReviewInput(vo, idx, mid);
	}
	
	@Override
	public void setPointUp(String mid, String point) {
		shopDAO.setPointUp(mid, point);		
	}

	@Override
	public void setReviewGoodCheck(int idx) {
		shopDAO.setReviewGoodCheck(idx);		
	}
	
	@Override
	public int setReviewGoodInput(int idx,int reviewIdx, String mid) {
		return shopDAO.setReviewGoodInput(idx, reviewIdx, mid);	
	}
	
	@Override
	public ReviewLikesVO getReviewLikeInfo(int idx, String mid) {
		return shopDAO.getReviewLikeInfo(idx, mid);	
	}
	
	@Override
	public ArrayList<Integer> getMyLikes(int idx, String mid) {
		return shopDAO.getMyLikes(idx, mid);	
	}
	
	@Override
	public int setReviewClaim(int idx) {
		return shopDAO.setReviewClaim(idx);	
	}
	
	@Override
	public int setReviewDelete(int idx) {
		return shopDAO.setReviewDelete(idx);
	}
	
	@Override
	public ShopReviewVO getMyReview(int idx) {
		return shopDAO.getMyReview(idx);
	}
	
	@Override
	public int setReviewUpdate(ShopReviewVO vo) {
		return shopDAO.setReviewUpdate(vo);
	}
	
	@Override
	public ShopCartVO getMyCartSearch(int shopIdx, String optionSelect, String mid) {
		return shopDAO.getMyCartSearch(shopIdx, optionSelect, mid);
	}
	
	@Override
	public void setCartQuantityUpdate(int idx, int quantity, int totalPrice) {
		shopDAO.setCartQuantityUpdate(idx, quantity, totalPrice);
	}
	
	@Override
	public int setCartInput(ShopCartVO vo) {
		return shopDAO.setCartInput(vo);
	}
	
	@Override
	public ArrayList<ShopCartVO> getMyCart(String mid) {
		return shopDAO.getMyCart(mid);
	}

	@Override
	public ShopOrderVO getIdxCart(String idx) {
		return shopDAO.getIdxCart(idx);
	}
	
	@Override
	public ShopOrderVO getOneOrder(int idx) {
		return shopDAO.getOneOrder(idx);
	}
	
	@Override
	public int setCartDelete(int idx) {
		return shopDAO.setCartDelete(idx);
	}
	
	@Override
	public CouponVO getCouponInfo(int idx) {
		return shopDAO.getCouponInfo(idx);
	}
	
	@Override
	public void setShopOrder(ShopOrderVO vo) {
		shopDAO.setShopOrder(vo);
	}
	
	@Override
	public void setCartDeleteAll(int cartIdx) {
		shopDAO.setCartDeleteAll(cartIdx);
	}
	
	@Override
	public void setUseCoupon(ShopOrderVO vo) {
		shopDAO.setUseCoupon(vo);
	}
	
	@Override
	public void setReviewOk(int idx) {
		shopDAO.setReviewOk(idx);
	}

	@Override
	public ArrayList<ShopVO> getPartnerShopList(String mid) {
		return shopDAO.getPartnerShopList(mid);
	}
	
	@Override
	public ArrayList<ShopVO> getSearch(String query) {
		return shopDAO.getSearch(query);
	}
	
	@Override
	public ArrayList<ShopVO> getBestShopTop3() {
		return shopDAO.getBestShopTop3();
	}
	
	@Override
	public ArrayList<ShopVO> getdateShopTop3() {
		return shopDAO.getdateShopTop3();
	}
	
	@Override
	public ArrayList<ShopVO> getNewShop() {
		return shopDAO.getNewShop();
	}
	
	@Override
	public List<ShopVO> filterProducts(String search, String category, String price) {
    return shopDAO.filterProducts(search, category, price);
	}

}
