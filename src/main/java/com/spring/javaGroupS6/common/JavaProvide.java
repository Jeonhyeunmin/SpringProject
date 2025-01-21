package com.spring.javaGroupS6.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;


@Component
public class JavaProvide {
	
	@Autowired
	JavaMailSender mailSender;
	
	// 메일 전송하기(이메일 주소, 제목, 내용)
//	@SuppressWarnings("unused")
//	public void mailSend(HttpServletRequest request, String toMail, String title, String mailFlag) throws MessagingException {
//		String content = "";
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//			
//			messageHelper.setTo(toMail);			// 받는 사람의 메일주소
//			messageHelper.setSubject(title);	// 메일 제목
//			messageHelper.setText(content);		// 메일 내용
//			
//			content += "<br><hr><h3>"+mailFlag+"</h3><hr><br>";
////			content += "<p><img src=\"cid:main.jsp\" width='500px'/></p>";
//			content += "<p>방문하기 : <a href='http://49.142.157.251:9090/cjgreen'>JavaGroup</a></p>";
//			content += "<hr>";
//			content = content.replace("\n", "<br>");
//			
//			messageHelper.setText(content, true);
//			
////			FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/main.jpg"));
////			messageHelper.addInline("main.jsp", file);
//			
//			// 메일 전송하기
//			mailSender.send(message);
//	}
	
  public void mailSend(HttpServletRequest request, String toMail, String title, String mailFlag, String imageName) throws MessagingException {
    String content = "";
    
    // 메일 전송을 위한 객체 : MimeMessage(), MimeMessageHelper()
    MimeMessage message = mailSender.createMimeMessage();
    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    
    messageHelper.setTo(toMail);         // 받는 사람의 메일주소
    messageHelper.setSubject(title);   // 메일 제목
    messageHelper.setText(content);      // 메일 내용
    
    content = content.replace("\n", "<br>");
    content += "<br>"+mailFlag+"<br>";
    messageHelper.setText(content, true);
    
       FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/login/login.jpg"));
       messageHelper.addInline("login.jpg", file);
    
    
    // 메일 전송하기
    mailSender.send(message);
 }
  
  public void couponSend(HttpServletRequest request, String toMail, String title, String mailFlag, String imageName) throws MessagingException {
  	String content = "";
  	
  	// 메일 전송을 위한 객체 : MimeMessage(), MimeMessageHelper()
  	MimeMessage message = mailSender.createMimeMessage();
  	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
  	
  	messageHelper.setTo(toMail);         // 받는 사람의 메일주소
  	messageHelper.setSubject(title);   // 메일 제목
  	messageHelper.setText(content);      // 메일 내용
  	content = content.replace("\n", "<br>");
  	content += "<br>"+mailFlag+"<br>";
  	messageHelper.setText(content, true);
  	
  	FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/data/coupon/"+imageName));
  	messageHelper.addInline(imageName, file);
  	
  	
  	// 메일 전송하기
  	mailSender.send(message);
  }
	
	public void imgCheck(String content, String folderName) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		String imgs[] = content.split("<img ");
		ArrayList<String> img = new ArrayList<String>();
		
		for(int i = 0; i< imgs.length; i++) {
			if(imgs[i].contains("src")) {
				imgs[i] = imgs[i].substring(imgs[i].indexOf("src=\""));	// src="/javaGroupS/data/ckeditor/241213145233_파일명.jpg" style="height:225px; width:225px" /></p>\r\n
				imgs[i] = imgs[i].substring(0, imgs[i].lastIndexOf("\"")); // src="/javaGroupS/data/ckeditor/241213145233_파일명.jpg" style="height:225px; width:225px" />
				
				String temp1 = imgs[i].substring(0, imgs[i].lastIndexOf(".")); // src="/javaGroupS/data/ckeditor/241213145233_파일명
				temp1 = temp1.substring(temp1.lastIndexOf("/")+1);  //  241213145233_파일명
				
				String temp2 = imgs[i].substring(imgs[i].lastIndexOf("."));  // .jpg" style="height:225px; width:225px" /></p>
				temp2 = temp2.substring(0, temp2.indexOf("\""));  // .jpg
				
				img.add(temp1 + temp2);  // 241213145233_파일명 + .jpg
				
			}
		}
		
		for(int i = 0; i < img.size(); i++) {
			String origFilePath = realPath + "ckeditor/" + img.get(i);
			String copyFilePath = realPath +  folderName + "/" + img.get(i);
			fileCopyCheck(origFilePath, copyFilePath);
		}
	}
	
//	이미지 삭제
	public void imgDelete(String content, String folderName) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		String imgs[] = content.split("<img ");
		ArrayList<String> img = new ArrayList<String>();
		
		for(int i = 0; i< imgs.length; i++) {
			if(imgs[i].contains("src")) {
				imgs[i] = imgs[i].substring(imgs[i].indexOf("src"));	// src="/javaGroupS/data/ckeditor/241213145233_파일명.jpg" style="height:225px; width:225px" /></p>\r\n
				imgs[i] = imgs[i].substring(0, imgs[i].lastIndexOf("/>")); // src="/javaGroupS/data/ckeditor/241213145233_파일명.jpg" style="height:225px; width:225px" />
				
				String temp1 = imgs[i].substring(0, imgs[i].lastIndexOf(".")); // src="/javaGroupS/data/ckeditor/241213145233_파일명
				temp1 = temp1.substring(temp1.lastIndexOf("/")+1);  //  241213145233_파일명
				
				String temp2 = imgs[i].substring(imgs[i].lastIndexOf("."));  // .jpg" style="height:225px; width:225px" /></p>
				temp2 = temp2.substring(0, temp2.indexOf("\""));  // .jpg
				
				img.add(temp1 + temp2);  // 241213145233_파일명 + .jpg
				
			}
		}
		
		for(int i = 0; i < img.size(); i++) {
			String origFilePath = realPath +  folderName + "/" + img.get(i);
			System.out.println("origFilePath : " + origFilePath);
			fileDelete(origFilePath);
		}
	}
	
	// 파일 복사처리
	private void fileCopyCheck(String origFilePath, String copyFilePath) {
		try {
			FileInputStream fis = new FileInputStream(new File(origFilePath));
			FileOutputStream fos = new FileOutputStream(new File(copyFilePath));
			
			byte[] bytes = new byte[2048];
			int cnt = 0;
			while((cnt=fis.read(bytes)) != -1) {
				fos.write(bytes, 0, cnt);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	서버에 존재하는 파일을 삭제처리
	public void fileDelete(String origFilePath) {
		File delFile = new File(origFilePath);
		
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
//	이미지 백업
	public void imgBackup(String content, String folderName) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		String imgs[] = content.split("<img ");
		ArrayList<String> img = new ArrayList<String>();
		
		for(int i = 0; i< imgs.length; i++) {
			if(imgs[i].contains("src")) {
				imgs[i] = imgs[i].substring(imgs[i].indexOf("src"));	// src="/javaGroupS/data/ckeditor/241213145233_파일명.jpg" style="height:225px; width:225px" /></p>\r\n
				imgs[i] = imgs[i].substring(0, imgs[i].lastIndexOf("/>")); // src="/javaGroupS/data/ckeditor/241213145233_파일명.jpg" style="height:225px; width:225px" />
				
				String temp1 = imgs[i].substring(0, imgs[i].lastIndexOf(".")); // src="/javaGroupS/data/ckeditor/241213145233_파일명
				temp1 = temp1.substring(temp1.lastIndexOf("/")+1);  //  241213145233_파일명
				
				String temp2 = imgs[i].substring(imgs[i].lastIndexOf("."));  // .jpg" style="height:225px; width:225px" /></p>
				temp2 = temp2.substring(0, temp2.indexOf("\""));  // .jpg
				
				img.add(temp1 + temp2);  // 241213145233_파일명 + .jpg
				
			}
		}
		
		for(int i = 0; i < img.size(); i++) {
			String origFilePath = realPath +  folderName + "/" + img.get(i);
			String copyFilePath = realPath + "ckeditor/" + img.get(i);
			fileCopyCheck(origFilePath, copyFilePath);
		}
	}
	
	public void titleImgBackup(String titleImg, String folderName) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		
		String origFilePath = realPath +  folderName + "/" + titleImg;
		String copyFilePath = realPath + "ckeditor/" + titleImg;
		fileCopyCheck(origFilePath, copyFilePath);
	}
	
	
	
	public void WriteFile(MultipartFile fName, String sFileName, String folder) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/" + folder + "/");
		
		FileOutputStream fos = new FileOutputStream(realPath + sFileName);
		if(fName.getBytes().length != -1) {
			fos.write(fName.getBytes());
		}
		fos.flush();
		fos.close();
	}
	
	public void fileDownAction(HttpServletRequest request, HttpServletResponse response , String path, String file) throws IOException {
		if(path.equals("pds")) {
			path += "/temp/";
		}
		String realPathFile = request.getSession().getServletContext().getRealPath("/resources/data/" + path) + file;
		
		File downFile = new File(realPathFile);
		
		String downFileName = new String(file.getBytes("UTF-8"), "8859_1");
		
		response.setHeader("Content-Disposition", "attachment;filename=" + downFileName);
		
		FileInputStream fis = new FileInputStream(downFile);
		
		ServletOutputStream sos = response.getOutputStream();
		
		byte bytes[] = new byte[2048];
		int data = 0;
		
		while((data = fis.read(bytes, 0, bytes.length)) != -1) {
			sos.write(bytes, 0, data);
		}
		sos.flush();
		sos.close();
		fis.close();
		
//		다운로드 완료 후에 서버에 저장된 zip 파일을 삭제처리한다.
		downFile.delete();
	}


}
