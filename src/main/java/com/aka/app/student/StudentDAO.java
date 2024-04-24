package com.aka.app.student;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

@Mapper
public interface  StudentDAO {

	public List<MemberVO> getStudentList(Pager pager)throws Exception;
	
	public Long getTotalCount(Pager pager)throws Exception;
	
	public int deleteStudent(MemberVO memberVO)throws Exception;
	
	public MemberVO getStudentDetail(MemberVO memberVO)throws Exception;
	
	public int updateStudent(MemberVO memberVO)throws Exception;
}
