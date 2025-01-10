package com.spring.javaGroupS6.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.dao.EventDAO;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.EventVO;
import com.spring.javaGroupS6.vo.MemberVO;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	EventDAO eventDAO;
	
	@Autowired
	JavaProvide provide;

	@Override
	public int setEventInput(HttpServletRequest request, MultipartFile file, EventVO vo) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/event/");
		if(vo.getContent().contains("src=\"/")) {
			provide.imgCheck(vo.getContent(), "event");
		}
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/event/"));
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		String sFileName = sdf.format(date) + "_" + file.getOriginalFilename();
		try {
			provide.WriteFile(file, sFileName, "event");
		} catch (IOException e) {e.printStackTrace();}
		
		vo.setThumbnail(sFileName);
		
		return eventDAO.setEventInput(vo);
		
	}

	@Override
	public ArrayList<EventVO> getEventList() {
		return eventDAO.getEventList();
	}
	
	@Override
	public EventVO getEvent(int idx) {
		return eventDAO.getEvent(idx);
	}
	
	@Override
	public CouponVO getEventCoupon(int idx) {
		return eventDAO.getEventCoupon(idx);
	}
	
	@Override
	public int setCoupon(HttpServletRequest request, CouponVO vo, MemberVO userInfo) {
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/coupon/");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		String qrCodeImage = "";
		String qrCodeName = sdf.format(date) + "_" + vo.getCouponName() + ".png";
		qrCodeImage = "생성날짜 : " + qrCodeName.substring(0,4) + "년 / " + qrCodeName.substring(4,6) + "월 / " + qrCodeName.substring(6,8) + "일\n";
		qrCodeImage += "쿠폰번호 : " + vo.getIdx() + "\n";
		qrCodeImage += "쿠폰이름 : " + vo.getCouponName() + "\n";
		qrCodeImage += "할인 : " + vo.getDiscount() + vo.getSaleUnit() +"\n";
		qrCodeImage += "쿠폰 발급일 : " + vo.getCreateDate() + "\n";
		qrCodeImage += "쿠폰 기간: " + vo.getStartDate() + " ~ " + vo.getEndDate();
		
		try {
			qrCodeImage = new String(qrCodeImage.getBytes("UTF-8"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		try {
			QRCodeWriter qrcodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrcodeWriter.encode(qrCodeImage, BarcodeFormat.QR_CODE, 200, 200);
			
			int qrcodeColor = 0xFF000000;
			int qrcodeBackColor = 0xFFFFFFFF;
			
			MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, qrcodeBackColor);
			
			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);
			
			ImageIO.write(bufferedImage, "png", new File(realPath + qrCodeName));
		}
		catch (IOException e) {e.printStackTrace();}
		catch (WriterException e) {e.printStackTrace();}
		
		
		
		String title = vo.getCouponName() + "이 도착하였습니다!";
		String mailFlag = "<html>"
	       + "<body>"
	       + "<div style='font-family: Arial, sans-serif; line-height: 1.6;'>"
	       + "<h2 style='color: #f2d8b1;'>Min's 쿠폰이 발급되었습니다.</h2>"
	       + "<p><img src=\"cid:"+ qrCodeName +"\" style='max-width: 500px; height: auto; border-radius: 8px; margin-top: 20px;'/></p>"
	       + "<h3 style='background-color: #f0f0f0; width:200px; padding: 10px; color: #333; border-radius: 5px; text-align: center;'>"
	       + "<strong>" + vo.getCouponName() + "</strong>"
	       + "</h3>"
	       + "<p>현장 결제 시 QR CODE를 보여주시면 쿠폰이 적용됩니다.</p>"
	       + "<p>감사합니다.</p><br/>"
	       + "<hr>"
	       + "</div>"
	       + "</body>"
	       + "</html>";
		
		try {
			provide.couponSend(request, userInfo.getEmail(), title, mailFlag, qrCodeName);
		} catch (MessagingException e) {e.printStackTrace();}
		
		vo.setQrImage(qrCodeName);
		
		return eventDAO.setCoupon(vo);
	}
	
	@Override
	public CouponVO getCouponDuplication(int idx) {
		return eventDAO.getCouponDuplication(idx);
	}
	
}
