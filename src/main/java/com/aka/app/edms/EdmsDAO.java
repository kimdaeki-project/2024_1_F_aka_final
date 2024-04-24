package com.aka.app.edms;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

@Mapper
public interface EdmsDAO {
	
	
	//문서
	//문서저장
	public int createEdms(EdmsVO edmsVO) throws Exception;
	//결재선 저장
	public int createApproval( List<Map<String, Object>>  list) throws Exception;
	//파일저장
	public int createEdmsAttchFile(List<Object> list) throws Exception;
	//결재진행목록 불러오기
	public List<EdmsVO> getEdmsList(Map<String, Object> map) throws Exception;
	//총 글 갯수 가져오기 
	public Long getEdmsTotalCount(Map<String, Object> map) throws Exception;
	
	
	//임시문서
	//임시문서저장
	public int createTempEdms(EdmsVO edmsVO) throws Exception;
	//임시 결재선 저장
	public int createTempApproval(List<Map<String, Object>>  list) throws Exception;
	//임시 파일 저장
	public int createTempEdmsAttchFile(List<Object> list) throws Exception;
	//임시문서 삭제
	
	
	
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
