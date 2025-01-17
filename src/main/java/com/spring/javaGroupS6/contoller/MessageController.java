package com.spring.javaGroupS6.contoller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String getMessage(Model model, HttpSession session, 
			@PathVariable String msgFlag,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="idx", defaultValue = "0", required = false) int idx
		) {
		
		String company = (String)session.getAttribute("sCompany");
		String name = (String)session.getAttribute("sName");
		int level = session.getAttribute("sLevel") == null ? 999 : (int)session.getAttribute("sLevel");
		String pwdChange = session.getAttribute("sPwdChange") == null ? "yes" : (String)session.getAttribute("sPwdChange");
		
		if(pwdChange.equals("no") && msgFlag.equals("loginOk") && level == 1) {
			model.addAttribute("message", "임시비밀번호 발급 후 비밀번호를 변경하지 않으셨습니다");
			model.addAttribute("url", "");
		}
		else if((level == 1 || level == 0) && msgFlag.equals("loginOk")) {
			model.addAttribute("message", name + "님 반갑습니다.");
			model.addAttribute("url", "/");
		}
		else if((level == 2 || level == 3) && msgFlag.equals("loginOk")) {
			model.addAttribute("message", company + "님 반갑습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("loginNo")) {
			model.addAttribute("message", "회원님 로그인 실패");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("joinOk")) {
			model.addAttribute("message", "회원가입 성공 다시 로그인해주세요");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("joinNo")) {
			model.addAttribute("message", "회원가입 실패");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("partnerJoinOk")) {
			model.addAttribute("message", "파트너 신청이 완료되었습니다 관리자 승인 후 게시물 등록 가능합니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("partnerJoinNo")) {
			model.addAttribute("message", "신청 실패");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("myPageNo")) {
			model.addAttribute("message", "로그인 후 이용해주세요.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("shopUpdateOk")) {
			model.addAttribute("message", "게시물 업데이트 완료");
			model.addAttribute("url", "shop/shopContent?idx=" + idx);
		}
		else if(msgFlag.equals("shopUpdateNo")) {
			model.addAttribute("message", "게시물 업데이트 실패");
			model.addAttribute("url", "shop/shopUpdate?idx=" + idx);
		}
		else if(msgFlag.equals("shopInputOk")) {
			model.addAttribute("message", "게시물 등록이 완료되었습니다. 관리자 승인 후 게시물이 노출됩니다.");
			model.addAttribute("top", "on");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("logout")) {
			model.addAttribute("url", "");
			model.addAttribute("top", "on");
		}
		else if(msgFlag.equals("shopInputOk")) {
			model.addAttribute("message", "게시물 등록 실패");
			model.addAttribute("url", "shop/shopInput");
		}
		else if(msgFlag.equals("shopDeleteOk")) {
			model.addAttribute("message", "게시물 삭제 성공");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("shopDeleteNo")) {
			model.addAttribute("message", "실패");
			model.addAttribute("url", "shop/shopContent?idx=" + idx);
		}
		else if(msgFlag.equals("memberIdSameCheck")) {
			model.addAttribute("message", "동일 정보로 아이디가 이미 존재합니다");
			model.addAttribute("url", "common/idAccount");
		}
		else if(msgFlag.equals("findIdNo")) {
			model.addAttribute("message", "입력하신 정보로 조회된 아이디가 없습니다");
			model.addAttribute("url", "common/idAccount");
		}
		else if(msgFlag.equals("pwdChangeOk")) {
			model.addAttribute("message", "비밀번호 변경이 완료되었습니다");
			model.addAttribute("url", "common/myPage");
		}
		else if(msgFlag.equals("pwdChangeNo")) {
			model.addAttribute("message", "임시 비밀번호 발급 후 변경을 하시지 않으셨습니다.");
			model.addAttribute("url", "common/myPage");
		}
		else if(msgFlag.equals("reviewInputOk")) {
			model.addAttribute("message", "Min's 포인트가 10포인트가 지급되었습니다.");
			model.addAttribute("url", "common/myPage");
		}
		else if(msgFlag.equals("reviewInputNo")) {
			model.addAttribute("message", "등록 실패");
			model.addAttribute("url", "common/myPage");
		}
		else if(msgFlag.equals("loginError")) {
			model.addAttribute("message", "로그인 후 이용가능한 서비스 입니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("leaveUser")) {
			model.addAttribute("message", "탈퇴신청 회원입니다. 관리자에게 문의해주세요.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("leaveUser")) {
			model.addAttribute("message", "관리자 페이지입니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("eventInputOk")) {
			model.addAttribute("message", "이벤트를 등록하였습니다.");
			model.addAttribute("url", "event/event");
		}
		else if(msgFlag.equals("eventInputNo")) {
			model.addAttribute("message", "실패");
			model.addAttribute("url", "event/eventInput");
		}
		else if(msgFlag.equals("memberUpdateOk")) {
			model.addAttribute("message", "정보가 업데이트 되었습니다");
			model.addAttribute("url", "common/myPage");
		}
		else if(msgFlag.equals("memberUpdateNo")) {
			model.addAttribute("message", "정보가 업데이트 되었습니다");
			model.addAttribute("url", "member/memberUpdate");
		}
		else if(msgFlag.equals("memberUserLeaveOk")) {
			model.addAttribute("message", "회원 탈퇴가 신청되었습니다.");
			model.addAttribute("url", "common/logout");
		}
		else if(msgFlag.equals("memberUserLeaveNo")) {
			model.addAttribute("message", "탈퇴 신청 실패");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("partnerLeaveOk")) {
			model.addAttribute("message", "탈퇴 신청이 완료되었습니다.");
			model.addAttribute("url", "common/logout");
		}
		else if(msgFlag.equals("partnerLeaveNo")) {
			model.addAttribute("message", "탈퇴 신청 실패");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("memberPwdCheckNo")) {
			model.addAttribute("message", "비밀번호를 다시 확인해주세요.");
			model.addAttribute("url", "member/memberUpdate");
		}
		else if(msgFlag.equals("partnerPwdCheckNo")) {
			model.addAttribute("message", "비밀번호를 다시 확인해주세요.");
			model.addAttribute("url", "partner/partnerUpdate");
		}
		else if(msgFlag.equals("partnerPwdCheckNo")) {
			model.addAttribute("message", "비밀번호를 다시 확인해주세요.");
			model.addAttribute("url", "partner/memberPwdCheck");
		}
		else if(msgFlag.equals("paymentResult")) {
			model.addAttribute("message", "결제가 완료되었습니다");
			model.addAttribute("url", "shop/shopOrderOk");
		}
		else if(msgFlag.equals("notAdmin")) {
			model.addAttribute("message", "관리자만 접근 가능한 페이지입니다.");
			model.addAttribute("url", "");
		}
		return "include/message";
	}
	
}
