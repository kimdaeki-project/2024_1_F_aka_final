package com.aka.app.department;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.calendar.CalendarVO;
import com.aka.app.member.MemberVO;

@Mapper
public interface  DepartmentDAO {
	//부서별 캘린더
	public List<CalendarVO>departmentCalendar(MemberVO memberVO)throws Exception;  
	//부서 리스트
	public List<Map<String,Object>> getDepartmentList()throws Exception;
	//사원 리스트
	public List<MemberVO> getDepartmentMemberList(DepartmentVO departmentVO)throws Exception;
}
