package com.spring.javaGroupS6.contoller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.vo.ShopVO;

@Controller
public class HomeController {
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<String> subCategory = commonService.getSubCategory();
		ArrayList<ShopVO> bestVOS = commonService.getShopRankList(subCategory.get(0), subCategory.get(1), subCategory.get(2), subCategory.get(3), subCategory.get(4));
		ArrayList<ShopVO> shopVOS = commonService.getNewShopList();
		
		model.addAttribute("shopVOS", shopVOS);
		model.addAttribute("bestVOS", bestVOS);
		model.addAttribute("subCategory", subCategory);
		
		
		return "home";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void imageUpload(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		String oFileName = upload.getOriginalFilename();

//		파일명 중복 방지를 위한 이름 설정
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		oFileName = sdf.format(date) + "_" + oFileName;
		
//		파일 서버로 업로드
		byte bytes[] = upload.getBytes();
//		File file = new File(realPath, oFileName);
//		FileOutputStream fos = new FileOutputStream(file);
		FileOutputStream fos = new FileOutputStream(new File(realPath, oFileName));
		fos.write(bytes);
		
//		브라우저에 서버에 전송된 그림을 표시시켜주기
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/" + oFileName;
		out.println("{\"originalFilename\":\"" + oFileName + "\",\"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
		
		out.flush();
		fos.close();
		
	}
	
}
