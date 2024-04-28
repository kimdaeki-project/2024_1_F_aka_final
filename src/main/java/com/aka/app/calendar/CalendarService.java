package com.aka.app.calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	@Autowired
	private CalendarDAO calendarDAO;
	
	public int create(CalendarVO calendarVO) throws Exception{
		int result = calendarDAO.create(calendarVO);
		return result;
	}
}
