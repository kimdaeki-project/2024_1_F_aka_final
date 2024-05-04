package com.aka.app.department;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;

import com.aka.app.calendar.CalendarVO;
import com.aka.app.member.MemberVO;

import jakarta.servlet.http.HttpSession;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentDAO departmentDAO;
	
	
	//부서별 캘린더
	public List<CalendarVO>departmentCalendar(HttpSession session)throws Exception{
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal(); //컨택스트에서 유저 객체 꺼내기
		return departmentDAO.departmentCalendar(memberVO);
	}
	
	//사원 리스트
	public List<MemberVO>getDepartmentMemberList(DepartmentVO departmentVO)throws Exception{
		return departmentDAO.getDepartmentMemberList(departmentVO);
	}
	//부서 리스트
	public List<Map<String,Object>> getDepartmentList()throws Exception {
		List<Map<String,Object>> dlist = departmentDAO.getDepartmentList();
		for(Map<String,Object> a: dlist) {
			a.replace("parent","0","#");  // jstree 상위 번호 # 변경
		}
		return dlist;
	}
}
