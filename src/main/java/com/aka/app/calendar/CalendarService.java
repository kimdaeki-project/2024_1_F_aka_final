package com.aka.app.calendar;

import java.util.List;

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
	
	public List<CalendarVO> getCalendar()throws Exception{
		List<CalendarVO> calendarVOs = calendarDAO.getCalendar();
		return calendarVOs;
	}
}
