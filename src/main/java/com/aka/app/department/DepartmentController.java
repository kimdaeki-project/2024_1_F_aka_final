package com.aka.app.department;

import java.util.List;
import java.util.Map;

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
	
	
	@GetMapping("member")
	public String getDepartmentMemberList(DepartmentVO departmentVO,Model model)throws Exception {
		System.out.println(departmentVO.getDepartment_id());
		List<MemberVO> mlist = departmentService.getDepartmentMemberList(departmentVO);
		model.addAttribute("mlist",mlist);
		return "department/member";
	}

	@GetMapping("list")
	public void getDepartmentList(Model model)throws Exception {
	}
	
	@ResponseBody
	@GetMapping("jstreeList")
	public List<Map<String,Object>> getDepartmentListTree()throws Exception{
		List<Map<String,Object>>list =  departmentService.getDepartmentList();
		return list;
	}
	
	
}
