package com.aka.app.department;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aka.app.member.MemberVO;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentDAO departmentDAO;
	
	public List<MemberVO>getDepartmentMemberList(DepartmentVO departmentVO)throws Exception{
		return departmentDAO.getDepartmentMemberList(departmentVO);
	}
	
	public List<Map<String,Object>> getDepartmentList()throws Exception {
		List<Map<String,Object>> dlist = departmentDAO.getDepartmentList();
		for(Map<String,Object> a: dlist) {
			a.replace("parent","0","#");
		}
		return dlist;
	}
}
