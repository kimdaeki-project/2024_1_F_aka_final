package com.aka.app.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	
	@GetMapping("urDetail")
	public String calendar() throws Exception{
		return "calendar/calendar";
	}
	
	@GetMapping("drDetail")
	public String drCalendar() throws Exception{
		return "calendar/calendar";
	}
	
	@GetMapping("create")
	public String createCalendar()throws Exception{
		return "calendar/createSchedule";
	}
}
