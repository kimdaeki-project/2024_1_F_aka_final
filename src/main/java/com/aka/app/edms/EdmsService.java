package com.aka.app.edms;

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
	
	
	
	
	
	
	
	public List<EdmsVO> getEdmsList(Pager pager, MemberVO memberVO) throws Exception {
		
		Map<String, Object> map = new HashMap<>();		
		pager.makeIndex();		
		map.put("Pager", pager);
		map.put("MemberVO", memberVO);		
		System.out.println("service MAP" + map.get("memberVO"));
		
		Long totalCount = edmsDAO.getEdmsTotalCount(map);
		pager.makeNum(totalCount);
		map.put("Pager", pager);
		
		
		System.out.println("service MAP---------------------------------" + map);
		return edmsDAO.getEdmsList(map);
		
	}
	
	
	
	//전자문서 저장
	public int createEdms(EdmsVO edmsVO, Integer[] appAr, int check, MultipartFile[] files) throws Exception {
		
		System.out.println("service 16    "+ appAr.length);
		//매개변수 int 1=저장 2=임시저장
		int result = SaveEDMS(edmsVO, appAr, check, files);
		
		
		return result;
		
	}
	
		
	 
	//전자문서 저장	
	//매개변수 int 1=저장 2=임시저장
	@Transactional
	public int SaveEDMS(EdmsVO edmsVO, Integer[] appAr, int check, MultipartFile[] files) throws Exception{				
		
		int result = 0;
		
		//전자문서 저장
		if(check == 1) {			
			result = edmsDAO.createEdms(edmsVO);
	
		}
		
		if(check == 2) {
			result = edmsDAO.createTempEdms(edmsVO);
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
			
		
		if(check ==1 ) {
			
			result = edmsDAO.createApproval(list);
			if (result>1) result=1;
		}
	
		if(check == 2) {
			
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
			if(check==1) fileResult = edmsDAO.createEdmsAttchFile(fileList);
			if(check==2) fileResult = edmsDAO.createTempEdmsAttchFile(fileList);
					
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
