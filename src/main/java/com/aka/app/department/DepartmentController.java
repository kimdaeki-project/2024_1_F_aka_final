package com.aka.app.department;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aka.app.calendar.CalendarVO;
import com.aka.app.member.MemberVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/department/*")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService; 
	
	
	//부서별 캘린더
	@ResponseBody
	@GetMapping("calendar")
	public List<CalendarVO> departmentCalendar(HttpSession session) throws Exception {
		return departmentService.departmentCalendar(session);
	}
	
	//부서소속 사원리스트
	@GetMapping("member")
	public String getDepartmentMemberList(DepartmentVO departmentVO,Model model)throws Exception {
		System.out.println(departmentVO.getDepartment_id());
		List<MemberVO> mlist = departmentService.getDepartmentMemberList(departmentVO);
		model.addAttribute("mlist",mlist);
		return "department/member";
	}
	//부서 페이지
	@GetMapping("list")
	public void getDepartmentList(Model model)throws Exception {
	}
	
	//부서 리스트
	@ResponseBody
	@GetMapping("jstreeList")
	public List<Map<String,Object>> getDepartmentListTree()throws Exception{
		List<Map<String,Object>>list =  departmentService.getDepartmentList();
		return list;
	}
	
	
}
