package com.spring.javaGroupS6.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaGroupS6.service.PartnerService;

@RequestMapping("/partner")
@Controller
public class PartnerContoller {
	@Autowired
	PartnerService partnerService;
	

}
