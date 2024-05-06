package com.aka.app.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aka.app.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CalendarService {
	@Autowired
	private CalendarDAO calendarDAO;
	
	public int create(CalendarVO calendarVO) throws Exception{
		int result = calendarDAO.create(calendarVO);
		return result;
	}
	
	// 모든일정
	public List<MemberVO> getAll(MemberVO memberVO)throws Exception{
		List<MemberVO> memberVOs = calendarDAO.getAll(memberVO);
		return memberVOs;
	}
	
	//개인일정
	public List<MemberVO> getPersonal(MemberVO memberVO)throws Exception{
		List<MemberVO> memberVOs = calendarDAO.getPersonal(memberVO);
		return memberVOs;
	}
	//부서일정
	public List<MemberVO> getDepartment(MemberVO memberVO) throws Exception{
		List<MemberVO> memberVOs = calendarDAO.getDepartment(memberVO);
		return memberVOs;
	}
}
