package com.spring.javaGroupS6.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.spring.javaGroupS6.service.PageService;

@Component
public class PageProcess {
	
	@Autowired
	PageService pageService;
	
	public <T> void totRecCnt(Model model, int pag, int pageSize, String type, String user, String condition) {
		
		int totRecCnt = pageService.getTotRecCnt(type, user, condition);
		int startIndexNo = (pag - 1) * pageSize;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		int curScrStartNo = totRecCnt - startIndexNo;
		int lastBlock = (totPage - 1) / blockSize;
		
		List<T> vos = pageService.List(type, startIndexNo, pageSize, user, condition);
		model.addAttribute("vos", vos);	
		model.addAttribute("pag", pag);	
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totRecCnt", totRecCnt);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		
	}

}