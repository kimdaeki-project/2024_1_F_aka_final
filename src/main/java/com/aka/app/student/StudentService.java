package com.aka.app.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.aka.app.member.MemberDAO;
import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

@Service
public class StudentService {

	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	//학생 추가
	public int createStudent(MemberVO memberVO)throws Exception{
		memberVO.setDepartment_id(5L);   //수강생 부서
		memberVO.setRole_id(5L);		 //수강생 권한
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		memberVO.setCustomer_key("TEST_customer1234abc-"+System.currentTimeMillis());
		int result = memberDAO.add(memberVO);
		return result; 
	}
	
	//학생 수정
	public int updateStudent(MemberVO memberVO) throws Exception {
		return studentDAO.updateStudent(memberVO);
	}
	
	//학생 상세
	public MemberVO getStudentDetail(MemberVO memberVO) throws Exception {
		return studentDAO.getStudentDetail(memberVO);
	}
	
	//학생 삭제
	public int deleteStudent(MemberVO memberVO) throws Exception {
		return studentDAO.deleteStudent(memberVO);
	}
	
	//학생 목록
	public List<MemberVO> getStudentList(Pager pager)throws Exception{
		pager.makeIndex();
		Long totalCount = studentDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		List<MemberVO> list = studentDAO.getStudentList(pager);
		return list;
	}
}
