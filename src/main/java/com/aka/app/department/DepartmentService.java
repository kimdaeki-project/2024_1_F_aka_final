package com.aka.app.department;

import java.util.List;

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
	
	public List<DepartmentVO> getDepartmentList()throws Exception {
		return departmentDAO.getDepartmentList();
	}
}
