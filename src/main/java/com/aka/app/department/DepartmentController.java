package com.aka.app.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aka.app.member.MemberVO;

@Controller
@RequestMapping("/department/*")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService; 
	
	@ResponseBody
	@GetMapping("member")
	public String getDepartmentMemberList(DepartmentVO departmentVO,Model model)throws Exception {
		List<MemberVO> list = departmentService.getDepartmentMemberList(departmentVO);
		model.addAttribute("list",list);
		return "department/member";
	}
	
	@GetMapping("list")
	public void getDepartmentList(Model model)throws Exception {
		List<DepartmentVO> list = departmentService.getDepartmentList();
		model.addAttribute("list",list);
	}
}
