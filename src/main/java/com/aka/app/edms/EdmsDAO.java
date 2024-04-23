package com.aka.app.edms;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;

@Mapper
public interface EdmsDAO {

	//문서저장
	public int createEdms(EdmsVO edmsVO) throws Exception;
	//결재선 저장
	public int createApproval( List<Map<String, Object>>  list) throws Exception;
	
	
	
	
	
	
	//부서이름 조회
	public Map<String, Object> getDeptName(MemberVO memberVO)throws Exception;
	
	//직원목록 불러오기
	public List<Map<String, String>> getMemberList() throws Exception;		
	//부서목록 가져오기 차트
//	public List<ChartVO> getDeptList() throws Exception;
	public List<Map<String, Object>> getDeptChart() throws Exception;
	//직원목록 가져오기 차트
	public List<Map<String, Object>> getMemberChart() throws Exception;
	
	
	
}
