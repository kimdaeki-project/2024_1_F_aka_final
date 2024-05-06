package com.aka.app.student;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

@Mapper
public interface  StudentDAO {

	//학생 리스트
	public List<MemberVO> getStudentList(Pager pager)throws Exception;
	//학생 리스트 페이징 총 갯수
	public Long getTotalCount(Pager pager)throws Exception;
	//학생 삭제
	public int deleteStudent(MemberVO memberVO)throws Exception;
	//학생 상세
	public MemberVO getStudentDetail(MemberVO memberVO)throws Exception;
	//학생 수정
	public int updateStudent(MemberVO memberVO)throws Exception;
}
