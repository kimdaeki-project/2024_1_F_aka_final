package com.aka.app.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;

@Mapper
public interface CalendarDAO {
	
	// 일정추가
	public int create(CalendarVO calendarVO); 
	
	// 모든일정 가져오기
	public List<MemberVO> getAll(MemberVO memberVO);
	// 달력 개인 일정들 가져오기
	public List<MemberVO> getPersonal(MemberVO memberVO);
	// 달력 부서 일정 가져오기
	public List<MemberVO> getDepartment(MemberVO memberVO);
	
}
