package com.aka.app;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.aka.app.member.MemberService;
import com.aka.app.member.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String test (Model model, MemberVO memberVO, HttpSession session) {
		
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl member = (SecurityContextImpl)obj;
		
		log.info("session : ==={}",member.getAuthentication().getPrincipal());
		MemberVO login = (MemberVO)member.getAuthentication().getPrincipal();
		log.info("main login user = {}",login);
		model.addAttribute("member",login);
		
		return "temp/sample";
	}
	
	@GetMapping("/test/test")
	public String test2(@ModelAttribute MemberVO member) {
		
		return "calendar/calendar";
	}
}
