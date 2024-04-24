package com.aka.app.member;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.schedule.ScheduleVO;

@Mapper
public interface MemberDAO {
	    
	public MemberVO getDetail(MemberVO memberVO) throws Exception;
	
	public int add(MemberVO memberVO) throws Exception;
	
	public int updatePw(MemberVO memberVO) throws Exception;
	
	public int getFindUser(MemberVO memberVO)throws Exception;
	
	public int createCheck(ScheduleVO scheduleVO)throws Exception;
}
