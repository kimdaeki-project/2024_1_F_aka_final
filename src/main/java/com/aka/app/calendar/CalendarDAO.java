package com.aka.app.calendar;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	
	public int create(CalendarVO calendarVO); 
}
