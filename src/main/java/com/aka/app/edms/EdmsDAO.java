package com.aka.app.edms;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.member.MemberVO;
import com.aka.app.util.StampVO;


@Mapper
public interface EdmsDAO {
	
	
	//문서
	//문서저장
	public int createEdms(EdmsVO edmsVO) throws Exception;
	//결재선 저장
	public int createApproval( List<Map<String, Object>>  list) throws Exception;
	//파일저장
	public int createEdmsAttchFile(List<Object> list) throws Exception;	
	//문서불러오기
	public Map<String, Object> getDetail(EdmsVO edmsVO) throws Exception;
	//결재자리스트 가져오기
	public AprovalVO[] getApplineList(EdmsVO edmsVO) throws Exception;
	//결재하기
	//다음결재자 불러오기
	public AprovalVO getNextAproval(AprovalVO aprovalVO) throws Exception;
	//결재자 불러오기
	public AprovalVO getAprovalInfo(AprovalVO aprovalVO) throws Exception;
	//결재상태 변경
	public int updateAproval(AprovalVO aprovalVO) throws Exception;
	//문서의 상태를 변경
	public int updateEdms(EdmsVO edmsVO) throws Exception;
	//다음결재자 상태 변경
	public int updateNextAproval(AprovalVO aprovalVO) throws Exception;
	//파일 불러오기
	public EdmsFileVO[] fileList(EdmsVO edmsVO) throws Exception;
	//파일 상세 조회
	public EdmsFileVO getFileDetail(EdmsFileVO edmsFileVO) throws Exception;
 	
	//상신
		//결재진행목록 불러오기
		public List<EdmsVO> getEdmsList(Map<String, Object> map) throws Exception;
		//총 글 갯수 가져오기 
		public Long getEdmsTotalCount(Map<String, Object> map) throws Exception;
		//결재완료목록 불러오기
		public List<EdmsVO> getEdmsDoneList(Map<String, Object> map) throws Exception;
		public Long getEdmsDoneTotalCount(Map<String,Object> map) throws Exception;
	
	//수신		
		//결재완료목록 불러오기
		public List<EdmsVO> getReciveEdmsList(Map<String, Object> map) throws Exception;
		public Long getReciveEdmsTotalCount(Map<String,Object> map) throws Exception;
		//결재목록 불러오기
		public List<EdmsVO> getAprovedEdmsList(Map<String, Object> map) throws Exception;
		public Long getAprovedEdmsTotalCount(Map<String,Object> map) throws Exception;
		
	
	//임시문서
	//임시문서 삭제
	public int delectTempEdms(EdmsVO edmsVO) throws Exception;  
	//임시문서저장
	public int createTempEdms(EdmsVO edmsVO) throws Exception;
		//임시문서 업데이트
		public int updateTempEdms(EdmsVO edmsVO) throws Exception;
	
	//임시 결재선 저장
	public int createTempApproval(List<Map<String, Object>>  list) throws Exception;
	//임시 파일 저장
	public int createTempEdmsAttchFile(List<Object> list) throws Exception;
	//결재진행목록 불러오기
	public List<EdmsVO> getTempEdmsList(Map<String, Object> map) throws Exception;
	//총 글 갯수 가져오기 
	public Long getTempEdmsTotalCount(Map<String, Object> map) throws Exception;
	//문서불러오기
	public Map<String, Object> getTempDetail(EdmsVO edmsVO) throws Exception;	
	//파일불러오기
	public EdmsFileVO[] tempFileList(EdmsVO edmsVO) throws Exception;
	
	//임시문서 삭제
	
 	
	
	//도장
	//도장저장
	public int createStamp(StampVO stampVO) throws Exception;
	//도장유무 확인
	public int stampCount(StampVO stampVO) throws Exception;
	//도장변경
	public int stampUpdate(StampVO stampVO) throws Exception;
	
	
	
	
	
	
	
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
