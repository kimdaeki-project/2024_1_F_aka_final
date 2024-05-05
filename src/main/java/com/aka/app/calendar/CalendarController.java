package com.aka.app.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aka.app.member.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/calendar**")
@Slf4j
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	   @GetMapping("")
	   public String drCalendar(HttpSession session, Model model) throws Exception{
		   Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		   SecurityContextImpl securityContextImpl = (SecurityContextImpl)obj;
		   MemberVO memberVO = (MemberVO)securityContextImpl.getAuthentication().getPrincipal();
		   
		   List<CalendarVO> calendarVOs = calendarService.getCalendar(memberVO);
		   log.info(securityContextImpl.getAuthentication().getPrincipal().toString());
		   
		   model.addAttribute("calendarList",calendarVOs);
		   model.addAttribute("member",memberVO);
		   return "calendar/calendar";
	   }
	
	  
	  @GetMapping("/prDetail")
	  @ResponseBody 
	  public List<CalendarVO> getCalendar(HttpSession session)throws Exception{
		  Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		  SecurityContextImpl securityContextImpl = (SecurityContextImpl)obj;
		  MemberVO memberVO = (MemberVO)securityContextImpl.getAuthentication().getPrincipal();
		  log.info("controller member : {}",memberVO);
		  List<CalendarVO> calendarVOs = calendarService.getCalendar(memberVO);
		  return calendarVOs;
	  }
	  
	  @GetMapping("/drDetail")
	  @ResponseBody 
	  public List<CalendarVO> getDrCalendar(HttpSession session)throws Exception{
		  Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		  SecurityContextImpl securityContextImpl = (SecurityContextImpl)obj;
		  MemberVO memberVO = (MemberVO)securityContextImpl.getAuthentication().getPrincipal();
		  List<CalendarVO> calendarVOs = calendarService.getCalendar(memberVO);
		  return calendarVOs;
	  }
	  
	  
	
	  @PostMapping("/create")
	  @ResponseBody
	  public ResponseEntity<?> createCalendar(CalendarVO calendarVO)throws Exception{
		  calendarService.create(calendarVO);
		  return ResponseEntity.ok().build();
	  }
}
