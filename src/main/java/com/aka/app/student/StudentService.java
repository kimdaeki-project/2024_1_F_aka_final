package com.aka.app.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

@Service
public class StudentService {

	@Autowired
	private StudentDAO studentDAO;
	
	public int updateStudent(MemberVO memberVO) throws Exception {
		return studentDAO.updateStudent(memberVO);
	}
	
	public MemberVO getStudentDetail(MemberVO memberVO) throws Exception {
		return studentDAO.getStudentDetail(memberVO);
	}
	
	public int deleteStudent(MemberVO memberVO) throws Exception {
		return studentDAO.deleteStudent(memberVO);
	}
	
	public List<MemberVO> getStudentList(Pager pager)throws Exception{
		pager.makeIndex();
		Long totalCount = studentDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		List<MemberVO> list = studentDAO.getStudentList(pager);
		return list;
	}
}
