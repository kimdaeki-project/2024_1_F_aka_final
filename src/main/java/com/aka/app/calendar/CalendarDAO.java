package com.aka.app.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;

@Mapper
public interface CalendarDAO {
	
	// 일정추가
	public int create(CalendarVO calendarVO); 
	// 달력 일정들 가져오기
	public List<CalendarVO> getCalendar(MemberVO memberVO);
}
