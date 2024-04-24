package com.aka.app.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;

@Mapper
public interface  DepartmentDAO {
	
	public List<DepartmentVO> getDepartmentList()throws Exception;
	
	public List<MemberVO> getDepartmentMemberList(DepartmentVO departmentVO)throws Exception;
}
