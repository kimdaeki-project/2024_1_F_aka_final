package com.aka.app.member;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.schedule.ScheduleVO;

@Mapper
public interface MemberDAO {
	// 로그인
	public MemberVO getDetail(MemberVO memberVO) throws Exception;
	// 회원가입
	public int add(MemberVO memberVO) throws Exception;
	// 비밀번호찾기
	public int updatePw(MemberVO memberVO) throws Exception;
	// 마이페이지 정보변경
	public int updateMyinfo(MemberVO memberVO) throws Exception;
	// 비밀번호찾기 (아이디가 있는지)
	public int getFindUser(MemberVO memberVO)throws Exception;
	// 근태기록
	public int createCheck(ScheduleVO scheduleVO)throws Exception;
}
