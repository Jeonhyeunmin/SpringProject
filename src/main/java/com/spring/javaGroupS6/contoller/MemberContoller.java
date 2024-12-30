package com.spring.javaGroupS6.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaGroupS6.common.JavaProvide;
import com.spring.javaGroupS6.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	@Autowired
	JavaProvide provide;
	
	@Autowired
	MemberService memberservice;
	
	
}
