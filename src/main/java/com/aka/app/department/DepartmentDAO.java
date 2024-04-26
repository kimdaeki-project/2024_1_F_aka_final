package com.aka.app.department;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;

@Mapper
public interface  DepartmentDAO {
	
	public List<Map<String,Object>> getDepartmentList()throws Exception;
	
	public List<MemberVO> getDepartmentMemberList(DepartmentVO departmentVO)throws Exception;
}
