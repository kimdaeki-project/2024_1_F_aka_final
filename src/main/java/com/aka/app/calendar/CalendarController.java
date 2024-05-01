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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/calendar**")
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	@GetMapping("")
	public String drCalendar(HttpSession session, Model model) throws Exception{
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl securityContextImpl = (SecurityContextImpl)obj;
		
		List<CalendarVO> calendarVOs = calendarService.getCalendar();
		
		model.addAttribute("calendarList",calendarVOs);
		model.addAttribute("member",securityContextImpl.getAuthentication().getPrincipal());
		return "calendar/calendar";
	}
	
	
	  @GetMapping("/getSchedule")
	  @ResponseBody 
	  public List<CalendarVO> getCalendar()throws Exception{
		  List<CalendarVO> calendarVOs = calendarService.getCalendar();
		  return calendarVOs;
	  }
	 
	
	@PostMapping("/create")
	@ResponseBody
	public ResponseEntity<?> createCalendar(CalendarVO calendarVO, Model model)throws Exception{
		calendarService.create(calendarVO);
		return ResponseEntity.ok().build();
	}
}
