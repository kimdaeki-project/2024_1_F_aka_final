package com.aka.app.edms;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.member.MemberVO;
import com.aka.app.util.FileManager;
import com.aka.app.util.FileToPhotoEncoder;
import com.aka.app.util.Pager;
import com.aka.app.util.StampVO;


@Service
public class EdmsService {
		
	@Autowired
	private EdmsDAO edmsDAO;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FileToPhotoEncoder fileToPhotoEncoder; 
	@Value("${app.upload.edms}")
	private String edmsFileUploadPath;

	
	
	
	
	
	//문서 조회
	@Transactional
	public Map<String, Object> getDetail(EdmsVO edmsVO, String check) throws Exception{		
		
		Map<String, Object> edmsDetail = new HashMap<>();	

		if(check.equals("temp")) {
			
			edmsDetail.putAll(edmsDAO.getTempDetail(edmsVO));		
			return edmsDetail;
			
		}
		edmsDetail.putAll(edmsDAO.getDetail(edmsVO));			
		
		
		
		return edmsDetail;
		
	}

	
	//파일 불러오기
	public EdmsFileVO[] getFileList(EdmsVO edmsVO, String check) throws Exception {
		
		EdmsFileVO[] fileVO = null;
		
		if(check.equals("temp")) {
			
			fileVO = edmsDAO.tempFileList(edmsVO);		
			
			return fileVO;
			
		}
		
		fileVO = edmsDAO.fileList(edmsVO);
		return fileVO;
	}
	
	
	//파일 상세 조회
	public EdmsFileVO getFileDetail(EdmsFileVO edmsFileVO) throws Exception {
		
		return edmsDAO.getFileDetail(edmsFileVO);
	}
	
	//결재선 조회
	public AprovalVO[] getApplineList(EdmsVO edmsVO, String check) throws Exception{
		
		AprovalVO[] appline = null ;							
		
		if(check.equals("temp")){
			
			appline = edmsDAO.getTempApplineList(edmsVO);

			return appline;
			
		}
		
			appline = edmsDAO.getApplineList(edmsVO);			
			
	
		return appline;
		
	}
	
	//목록 불러오기
	public List<Map<String,Object>> getEdmsList(Pager pager, MemberVO memberVO, String check) throws Exception {
		
		List<Map<String,Object>> result = getPages(pager, memberVO, check);					
		
		return result;	
		
		
	}
	
	
	
	//페이징 처리
	public List<Map<String,Object>> getPages(Pager pager, MemberVO memberVO, String check) throws Exception{
		
		
		List<Map<String,Object>> result = new ArrayList<>();		
		
		Map<String, Object> map = new HashMap<>();		
		pager.makeIndex();		
		map.put("Pager", pager);
		map.put("MemberVO", memberVO);
		
		
		
		Long totalCount = 0L;
		
		if(check.equals("pro")) {
			
			totalCount=edmsDAO.getEdmsTotalCount(map);
			pager.makeNum(totalCount);
			map.put("Pager", pager);
			result=edmsDAO.getEdmsList(map);	
			
		}
		
		if(check.equals("temp")) {
			
			totalCount=edmsDAO.getTempEdmsTotalCount(map);
			pager.makeNum(totalCount);
			map.put("Pager", pager);
			result=edmsDAO.getTempEdmsList(map);
		}	
		
		if(check.equals("done")) {
			
			totalCount=edmsDAO.getEdmsDoneTotalCount(map);
			pager.makeNum(totalCount);
			map.put("Pager", pager);
			result=edmsDAO.getEdmsDoneList(map);
			
		}
		
		if(check.equals("recive")) {
			
			totalCount=edmsDAO.getReciveEdmsTotalCount(map);
			pager.makeNum(totalCount);
			map.put("Pager", pager);
			result=edmsDAO.getReciveEdmsList(map);
			
		}
		
		if(check.equals("aproved")) {
			
			totalCount=edmsDAO.getAprovedEdmsTotalCount(map);
			pager.makeNum(totalCount);
			map.put("Pager", pager);
			result=edmsDAO.getAprovedEdmsList(map);
			
		}
		
		
		return result;
		
	}

		
	
	
	//전자문서 저장
	@Transactional
	public int createEdms(EdmsVO edmsVO, Integer[] appAr, int check, MultipartFile[] files) throws Exception {
		
		//매개변수 int 1=저장 2=임시저장
		int result = SaveEDMS(edmsVO, appAr, check, files);		
		
		return result;
		
	}
	
		
	 
	//전자문서 저장	
	//매개변수 int 1=저장 2=임시저장
	@Transactional
	public int SaveEDMS(EdmsVO edmsVO, Integer[] appAr, int type, MultipartFile[] files) throws Exception{				
		
		int result = 0;
		Long status = 0L;
		if(edmsVO.getEdms_Status()!=null) {
			
			status = edmsVO.getEdms_Status();
			
		}
		
		//전자문서 저장
		if(type == 1) {
			//파이리추가후 
			//임시저장문서 삭제
			
			if(status==4) {						
				
				EdmsFileVO[] fileVO = edmsDAO.tempFileList(edmsVO);
				List<Object> fileTansfer = new ArrayList<>();
				
				for(EdmsFileVO f: fileVO) {
					
					fileTansfer.add(f);
					
				}
				

				result = edmsDAO.createEdmsAttchFile(fileTansfer);					
				
				result = edmsDAO.deleteTempEdms(edmsVO);				
			}
			
			result = edmsDAO.createEdms(edmsVO);
	
		}
		
		if(type == 2) {
			
			//임시저장문서 업데이트
			if(status==4) {							
				result = edmsDAO.updateTempEdms(edmsVO);
				
				return result;
			}else {
				edmsVO.setEdms_Status(4L);
				result = edmsDAO.createTempEdms(edmsVO);
			}
		}
		
		Long edmsNum = edmsVO.getEdms_No();
		if(edmsNum==null) {
			edmsNum=1L;
		}
		int i = 0;		
		int count = appAr.length-1;
		List<Map<String, Object>> list = new ArrayList<>();
	
				
		//결재선 저장
		//셜재선 순서 지정 (0번이 최종결재자가 됨)
		while (count>=0) {
			
			
			Map<String, Object> member = new HashMap<String, Object>();
			member.put("MEMBER_ID", appAr[count]);
			member.put("APPROVAL_RANK", i);
			member.put("EDMS_NO", edmsNum);
			member.put("APRROVAL_RESULT",0);
			if((appAr.length-1)==i) {
				member.replace("APRROVAL_RESULT", 1);
			}
			
			count--;
			i++;

			list.add(member);
			
		}
			
		
		if(type ==1 ) {
			
			result = edmsDAO.createApproval(list);
			if (result>1) result=1;
		}
	
		if(type == 2) {
			
			result = edmsDAO.createTempApproval(list);
			if (result>1) result=1;
		}
		
		//file저장
		
		if(files!=null) {
			List<Object> fileList = new ArrayList<>();
			
			for(MultipartFile f : files) {
				
				String edmsAttechfileName = fileManager.fileSave(edmsFileUploadPath, f);
				EdmsFileVO edmsFileVO = new EdmsFileVO();
				edmsFileVO.setEdms_No(edmsNum);
				edmsFileVO.setEdms_Attechfile_Name(edmsAttechfileName);
				edmsFileVO.setEdms_Attechfile_Ori_Name(f.getOriginalFilename());
				fileList.add(edmsFileVO);
			}
			int fileResult = 0;			
 			if(type==1) fileResult = edmsDAO.createEdmsAttchFile(fileList);
 			if(type==2) fileResult = edmsDAO.createTempEdmsAttchFile(fileList);
					
		}			
		return result;
								
	}
	
	
	//1승인
	//3최종승인
	@Transactional
	public int edmsSubmit(AprovalVO aprovalVO, EdmsVO edmsVO, int tipo) throws Exception {	
		AprovalVO temp = edmsDAO.getAprovalInfo(aprovalVO);
		aprovalVO.setMEMBER_ID(temp.getMEMBER_ID());
		aprovalVO.setAPPROVAL_RANK(temp.getAPPROVAL_RANK());
		Long rank = aprovalVO.getAPPROVAL_RANK();
		
		int result = 0;
		
		//반려
		if(tipo==5) {
			
			aprovalVO.setAPRROVAL_RESULT(5L);
			edmsVO.setEdms_Status(5L);
			edmsDAO.updateAproval(aprovalVO);
			result = edmsDAO.updateEdmsFinal(edmsVO);
			return 5;
			
		}
		
		
		aprovalVO.setAPRROVAL_RESULT(3L);//결재한사람 결재상태 변경 //3이 승인
		edmsVO.setEdms_Status(1L); //문서상태를 결재 진행중으로 변경
		result = edmsDAO.updateAproval(aprovalVO);
		
		if(rank==0) {			
			//최종결재	
			
			edmsVO.setEdms_Status(3L);			
			result = edmsDAO.updateEdmsFinal(edmsVO);
			return 3;			
		}
		edmsVO.setEdms_Status(1L); //문서상태를 결재 진행중으로 변경
		edmsDAO.updateEdms(edmsVO);
		
		 Long nextRank= rank-1;//다음결재자 선택 
		AprovalVO nextAprovalVO = new AprovalVO();
		nextAprovalVO.setAPPROVAL_RANK(nextRank);
		nextAprovalVO.setEDMS_NO(aprovalVO.getEDMS_NO());	
		nextAprovalVO = edmsDAO.getNextAproval(nextAprovalVO); //다음 결재자 소환
		
		nextAprovalVO.setAPRROVAL_RESULT(1L); // 결재차례로 만듬		
		
		result = edmsDAO.updateNextAproval(nextAprovalVO);//결재차례로 변경
		
		
		return result;
		
		
	}		
	
	
	private Date Date(long timeMillis) {
		// TODO Auto-generated method stub
		return null;
	}

	//임시문서 삭제
	public int deleteTempEdms(EdmsVO edmsVO) throws Exception {
		
		return edmsDAO.deleteTempEdms(edmsVO);
		
	}
	
	
	
	//도장
	
	//도장저장
	
	public int createStamp(StampVO stampVO, MultipartFile img)  throws Exception{
		
				
		if(img.isEmpty()) {
			return 0;
		}//서명이없으면 false		//서명사진이 없으면 실패
		String img_result = fileToPhotoEncoder.encoderFPTS(img); // 파일을 BOLB로 변환		
		stampVO.setStamp_Img(img_result);				//VO에 서명저장
		
		
		
		int result = stampCount(stampVO); // 서명유무 확인
		
	
		
		if(result == 1 ) {
			
			edmsDAO.stampUpdate(stampVO); 
			
			result = 3;
			return result; // 3 = 서명변경 
			
		}
	
		result = edmsDAO.createStamp(stampVO);		//1= 최초 서명 저장 확인
		
		
		return result;
		
		
	}
	
	//도장유무 확인
	public int stampCount(StampVO stampVO) throws Exception {
		
		//0 없음
		//1 있음
		int result = edmsDAO.stampCount(stampVO);
		
		return result; 
		
	}
	
	
	
	
	//부서이름 조회
	
	public Map<String, Object> getDeptName(MemberVO memberVO) throws Exception{	
		
	
		return edmsDAO.getDeptName(memberVO);
		
	}
	
	//직원목록 불러오기
	public List<Map<String, String>> getMemberList()throws Exception{
		
				
		return edmsDAO.getMemberList(); 
		
	}
	
	
	
	// 차트 불러오기
	//부서
	public List<Map<String, Object>> getDeptChart() throws Exception{
		
		return edmsDAO.getDeptChart();
	}
	
	//사원
	public List<Map<String, Object>> getMemberChart() throws Exception{
		
		return edmsDAO.getMemberChart();
	}
}
