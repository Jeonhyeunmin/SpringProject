package com.spring.javaGroupS6.contoller;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.service.EventService;
import com.spring.javaGroupS6.vo.CouponVO;
import com.spring.javaGroupS6.vo.EventVO;
import com.spring.javaGroupS6.vo.MemberVO;

@Controller
@RequestMapping("/event")
public class EventContoller {
	@Autowired
	EventService eventService;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping("/event")
	public String eventGet(Model model) {
		ArrayList<EventVO> vos = eventService.getEventList();
		model.addAttribute("vos", vos);
		model.addAttribute("title", "이벤트");
		return "event/event";
	}
	
	@GetMapping("/eventInput")
	public String eventInputGet(Model model) {
		model.addAttribute("title", "이벤트 등록");
		return "event/eventInput";
	}
	
	@PostMapping("/eventInput")
	public String eventInputPost(HttpServletRequest request, MultipartFile file, EventVO vo) {
		int res = eventService.setEventInput(request, file, vo);
		if(res != 0) {
			return "redirect:/message/eventInputOk";
		}
		else {
			return "redirect:/message/eventInputNo";
		}
	}
	
	@GetMapping("/eventContent")
	public String eventContentGet(Model model, int idx) {
		EventVO vo = eventService.getEvent(idx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("title", vo.getTitle());
		return "event/eventContent";
	}
	
	@ResponseBody
	@PostMapping("/downCoupon")
	public int downCouponGet(HttpServletRequest request, Model model, int idx) {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		CouponVO vo = eventService.getEventCoupon(idx);
		MemberVO userInfo = commonService.getMemberIdSearch(mid);
		int res = 0;
		
		vo.setMid(mid);
		vo.setEventIdx(idx);
		CouponVO couponVO = eventService.getCouponDuplication(idx, mid);
		model.addAttribute("idx", idx);
		if(couponVO != null) {
			return 3;
		}
		else if(userInfo.getEmail() == null) {
			return 2;
		}
		res = eventService.setCoupon(request, vo, userInfo);
		return res;
	}
	
}
