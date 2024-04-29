package com.aka.app.edms;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.member.MemberVO;
import com.aka.app.util.FileManager;
import com.aka.app.util.Pager;


@Service
public class EdmsService {
		
	@Autowired
	private EdmsDAO edmsDAO;
	@Autowired
	private FileManager fileManager;
	@Value("${app.upload.edms}")
	private String edmsFileUploadPath;
	@Value("${app.upload.edmsTemp}")
	private String edmsTempFileUploadPath;
	
	
	
	
	
	//문서 조회
	@Transactional
	public Map<String, Object> getDetail(EdmsVO edmsVO, String check) throws Exception{		
		
		Map<String, Object> edmsDetail = new HashMap<>();
		
		if(check.equals("pro")) {			
		
			edmsDetail.putAll(edmsDAO.getDetail(edmsVO));			
			
		}
		if(check.equals("temp")) {

			edmsDetail.putAll(edmsDAO.getTempDetail(edmsVO));			
		
		}
		if(check.equals("done")) {
			
			edmsDetail.putAll(edmsDAO.getDetail(edmsVO));
		}
		if(check.equals("recive")) {

			edmsDetail.putAll(edmsDAO.getDetail(edmsVO));			
		
		}
		return edmsDetail;
		
	}
	
	//목록 불러오기
	public List<EdmsVO> getEdmsList(Pager pager, MemberVO memberVO, String check) throws Exception {
		
		List<EdmsVO> result = getPages(pager, memberVO, check);			
		
		
		return result;
		
		
		
	}
	
	
	
	//페이징 처리
	public List<EdmsVO> getPages(Pager pager, MemberVO memberVO, String check) throws Exception{
		
		
		List<EdmsVO> result = new ArrayList<>();		
		
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
		
		if(check.equals("approved")) {
			
			totalCount=edmsDAO.getReciveEdmsTotalCount(map);
			pager.makeNum(totalCount);
			map.put("Pager", pager);
			result=edmsDAO.getReciveEdmsList(map);
			
		}
		
		
		return result;
		
	}

	
	
	
	
	//전자문서 저장
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
			//임시저장문서 삭제
			if(status==4) {							
				result = edmsDAO.delectTempEdms(edmsVO);				
			}
			
			result = edmsDAO.createEdms(edmsVO);
	
		}
		
		if(type == 2) {
			
			//임시저장문서 업데이트
			if(status==4) {							
				result = edmsDAO.updateTempEdms(edmsVO);
				
			}else {
				
				result = edmsDAO.createTempEdms(edmsVO);
			}
		}
		
		Long edmsNum = edmsVO.getEdms_No();
		int i = 0;		
		int count = appAr.length-1;
		List<Map<String, Object>> list = new ArrayList<>();
		System.out.println(count);
		
				
		//결재선 저장
		//셜재선 순서 지정 (0번이 최종결재자가 됨)
		while (count>=0) {
			
			System.out.println(appAr[count]);
			Map<String, Object> member = new HashMap<String, Object>();
			member.put("MEMBER_ID", appAr[count]);
			member.put("APPROVAL_RANK", i);
			member.put("EDMS_NO", edmsNum);
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
				edmsFileVO.setEdms_AttechfileOri_Name(f.getOriginalFilename());
				fileList.add(edmsFileVO);
			}
			int fileResult = 0;			
			if(type==1) fileResult = edmsDAO.createEdmsAttchFile(fileList);
			if(type==2) fileResult = edmsDAO.createTempEdmsAttchFile(fileList);
					
		}
	
		
			
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
