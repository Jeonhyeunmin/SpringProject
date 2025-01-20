package com.spring.javaGroupS6.contoller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.CommonService;
import com.spring.javaGroupS6.vo.MemberVO;
import com.spring.javaGroupS6.vo.PartnerVO;

@RequestMapping("/common")
@Controller
public class CommonContoller {
	@Autowired
	JavaProvide provide;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String loginGet(Model model, HttpServletRequest request) {
		Cookie cookies[] = request.getCookies();
		
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					cookies[i].setPath("/");
					cookies[i].setMaxAge(0);
					model.addAttribute("cMid", cookies[i].getValue());
					break;
				}
			}
		}
		
		return "common/login";
	}
	
	@PostMapping("/login")
	public String loginPost(Model model, HttpSession session, String mid, String pwd, 
			@RequestParam(name = "idSave", defaultValue = "off", required = false) String idSave, 
			HttpServletRequest request, HttpServletResponse response
	) {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		if(idSave.equals("on")) {
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			cookieMid.setMaxAge(60*60*24*7);
			response.addCookie(cookieMid);
		}
		else {
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setPath("/");
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
		}
		
		MemberVO memberVO = commonService.getMemberIdSearch(mid);
		PartnerVO partnerVO = commonService.getPartnerIdSearch(mid);
		int level = 0;
		
		if(memberVO != null && (memberVO.getMid().equals(mid) && passwordEncoder.matches(pwd, memberVO.getPwd()))) {
			level = memberVO.getLevel();
			String pwdChange = memberVO.getPwdChange();
			
			commonService.setLastDateUpdate("customer", sdf.format(date), memberVO.getMid());
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", memberVO.getLevel());
			session.setAttribute("sName", memberVO.getName());
			if(pwdChange.equals("no")) {
				return "redirect:/message/pwdChangeNo";
			}
			
			if(level == 99){
				return "redirect:/message/leaveUser";
			}
			return "redirect:/message/loginOk";
		}
		else if (partnerVO != null && (partnerVO.getMid().equals(mid) && passwordEncoder.matches(pwd, partnerVO.getPwd()))) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", partnerVO.getLevel());
			session.setAttribute("sCompany", partnerVO.getCompany());
			
			commonService.setLastDateUpdate("partner", sdf.format(date), partnerVO.getMid());
			
			return "redirect:/message/loginOk";
		}
		else {
			return "redirect:/message/loginNo";
		}
		
	}
	
	@GetMapping("/kakaoLoginForm")
	public String kakaoLoginFormGet() {
		return "common/kakaoLogin";
	}
	
	@GetMapping("/KakaoLogin")
	public String KakaoLoginGet(HttpSession session, HttpServletRequest request, String email, String nickName, String accessToken) throws MessagingException {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		
		session.setAttribute("sAccessToken", accessToken);
		session.setAttribute("sLogin", "kakao");
		
		MemberVO vo = commonService.getMemberEmailSearch(email);
		String mid = email.substring(0, email.indexOf("@"));
		if(vo == null) {
			
			MemberVO vo2 = commonService.getMemberIdSearch(mid);
			if(vo2 != null) {
				return "redirect:/message/memberIdSameCheck";
			}
			else {
				String pwd = UUID.randomUUID().toString().substring(0,8);
				String sTempPwd = pwd;
				MemberVO vo1 = new MemberVO();
				session.setAttribute("sTempPwd", sTempPwd);
				vo1.setMid(mid);
				vo1.setPwd(passwordEncoder.encode(pwd));
				vo1.setName(nickName);
				vo1.setPwdChange("no");
				vo1.setEmail(email);
				
				commonService.setMemberJoin(vo1);
				
				provide.mailSend(request, email, "카카오로그인 임시 비밀번호", sTempPwd, "login.jpg");
				
				vo = commonService.getMemberIdSearch(mid);
			}
		}
		session.setAttribute("sMid", vo.getMid());
		session.setAttribute("sName", vo.getName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sPwdChange", vo.getPwdChange());
		commonService.setLastDateUpdate("customer", sdf.format(date), vo.getMid());
		
		if(vo.getPwdChange().equals("no")) {
			return "redirect:/message/pwdChangeNo";
		}
		
		return "redirect:/message/loginOk";
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/message/logout";
	}
	
	@PostMapping("/join")
	public String joinGet(MemberVO vo) {
		MemberVO vo2 = commonService.getMemberEmailSearch(vo.getEmail());
		if(vo2 != null) {
			return "redirect:/message/memberIdSameCheck";
		}
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		vo.setPwdChange("yes");
		int res = commonService.setMemberJoin(vo);
		if(res != 0) {
			return "redirect:/message/joinOk";
		}
		else {
			return "redirect:/message/joinNo";
		}
	}
	
	@ResponseBody
	@PostMapping("/memberEmailCheck")
	public String memberEmailCheckPost(HttpSession session ,String email, HttpServletRequest request) throws MessagingException {
		String emailKey = UUID.randomUUID().toString().substring(0, 8);
		session.setAttribute("sEmailKey", emailKey);
		 String mailFlag="";
     mailFlag = "<html>"
       + "<body>"
       + "<div style='font-family: Arial, sans-serif; line-height: 1.6;'>"
       + "<img src='cid:login.jpg' style='max-width: 500px; height: auto; border-radius: 8px; margin-top: 20px;'>"
       + "<h2 style='color: #f2d8b1;'>Min's 회원가입 인증 번호</h2>"
       + "<p>안녕하세요,</p>"
       + "<p>Min's 회원가입을 위한 인증 번호는 다음과 같습니다.</p>"
       + "<h3 style='background-color: #f0f0f0; width:200px; padding: 10px; color: #333; border-radius: 5px; text-align: center;'>"
       + "<strong>" + emailKey + "</strong>"
       + "</h3>"
       + "<p>위의 인증 번호를 인증 페이지에 입력하여 이메일을 인증해주세요.</p>"
       + "<p>감사합니다.</p><br/>"
       + "<hr>"
       + "<p style='font-size: 0.9em; color: #555;'>본 메일은 자동으로 발송된 메일입니다.</p>"
       + "</div>"
       + "</body>"
       + "</html>";

		provide.mailSend(request, email, "이메일 인증키 입니다.", mailFlag, "login.jpg");
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberEmailCheckOk", method = RequestMethod.POST)
	public String memberEmailCheckOkPost(HttpSession session ,String checkKey) throws MessagingException {
		String emailKey = (String) session.getAttribute("sEmailKey");
		if(emailKey.equals(checkKey)) {
			return "1";
		}
		else {
			return "2";
			
		}
	}
	
	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.GET)
	public String memberIdCheckGet(Model model, String mid) throws MessagingException {
		MemberVO memberVO = commonService.getMemberIdSearch(mid);
		PartnerVO partnerVO = commonService.getPartnerIdSearch(mid); 
		if(memberVO == null && partnerVO == null) {
			model.addAttribute("midCheck", "Yes");
			model.addAttribute("mid", mid);
		}
		else {
			model.addAttribute("midCheck", "No");
			model.addAttribute("mid", mid);
		}
		return "common/memberIdCheck";
	}
	
	@RequestMapping(value = "/companyCheck", method = RequestMethod.GET)
	public String companyCheckGet(Model model, String company) throws MessagingException {
		PartnerVO partnerVO = commonService.getPartnerSearch(company); 
		if(partnerVO == null) {
			model.addAttribute("companyCheck", "Yes");
			model.addAttribute("company", company);
		}
		else {
			model.addAttribute("companyCheck", "No");
			model.addAttribute("mid", company);
		}
		return "common/companyCheck";
	}
	
	@GetMapping("/partnerJoin")
	public String partnerJoinGet() {
		return "common/partnerJoin";
	}
	
	@PostMapping("/partnerJoin")
	public String partnerJoinPost(MultipartFile file, PartnerVO vo) {
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		int res = commonService.setpartnerJoin(file, vo);
		if(res != 0) return "redirect:/message/partnerJoinOk";
		else return "redirect:/message/partnerJoinNo";
	}
	
	@GetMapping("/myPage")
	public String myPageGet(Model model, HttpSession session) {
		int level = session.getAttribute("sLevel") == null ? 0 : (int)session.getAttribute("sLevel");
		if(level == 1 || level == 0) {
			return "redirect:/member/myPage";
		}
		else if(level == 2) {
			return "redirect:/partner/myPage";
		}
		else {
			return "redirect:/message/myPageNo";
		}
	}
	
	@GetMapping("/idAccount")
	public String idFindGet() {
		return "common/idAccount";
	}
	
	@PostMapping("/findId")
	public String findIdPost(Model model, String name, String email) {
		
		MemberVO memberVO = commonService.getMemberEmailSearch(email);
		
		if(memberVO != null) {
			model.addAttribute("vo", memberVO);
			return "common/idFind";
		}
		else {
			return "redirect:/message/findIdNo";
		}
		
	}
	
	@PostMapping("/findPassword")
	public String findPasswordPost(Model model, String mid, String name, String email) {
		
		MemberVO memberVO = commonService.getMemberEmailSearch(email);
		
		if(memberVO.getMid().equals(mid)) {
			model.addAttribute("vo", memberVO);
			return "common/pwdFind";
		}
		else {
			return "redirect:/message/findIdNo";
		}
	}
	@PostMapping("pwdFind")
	public String pwdFindPost(String mid, String pwd, String pwd2) {
		MemberVO vo = commonService.getMemberIdSearch(mid);
		vo.setPwd(passwordEncoder.encode(pwd));
		int res = commonService.setMemberUpdate(vo);
		if(res != 0) {
			return "redirect:/message/pwdChangeOk";
		}
		else {
			return "redirect:/message/pwdChangeNo";
		}
	}
	
	@GetMapping("/mobieLogin")
	public String mobieLogin(HttpServletRequest request, Model model) {
		Cookie cookies[] = request.getCookies();
		
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					cookies[i].setPath("/");
					cookies[i].setMaxAge(0);
					model.addAttribute("cMid", cookies[i].getValue());
					break;
				}
			}
		}
		
		return "common/mobieLogin";
	}
	
	@ResponseBody
	@PostMapping("/windowLogin")
	public String windowLoginPost(Model model, HttpSession session, String mid, String pwd, 
			@RequestParam(name = "idSave", defaultValue = "off", required = false) String idSave, 
			HttpServletRequest request, HttpServletResponse response
	) {
		
		String res = "";
		if(idSave.equals("on")) {
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			cookieMid.setMaxAge(60*60*24*7);
			response.addCookie(cookieMid);
		}
		else {
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setPath("/");
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
		}
		
		MemberVO memberVO = commonService.getMemberIdSearch(mid);
		PartnerVO partnerVO = commonService.getPartnerIdSearch(mid);
		if(memberVO != null && (memberVO.getMid().equals(mid) && passwordEncoder.matches(pwd, memberVO.getPwd()))) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", memberVO.getLevel());
			session.setAttribute("sName", memberVO.getName());
			res = "1";
		}
		else if (partnerVO != null && (partnerVO.getMid().equals(mid) && passwordEncoder.matches(pwd, partnerVO.getPwd()))) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", partnerVO.getLevel());
			session.setAttribute("sCompany", partnerVO.getCompany());
			res = "1";
		}
		return res;
	}
	
	@GetMapping("/info")
	public String infoGet() {
		return "common/info";
	}
}
