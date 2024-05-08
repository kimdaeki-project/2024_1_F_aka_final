package com.aka.app.edms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.member.MemberVO;
import com.aka.app.util.Chart;
import com.aka.app.util.Pager;
import com.aka.app.util.StampVO;


@Controller
@RequestMapping("/edms/*")
public class EdmsController {
	
	@Autowired
	private EdmsService edmsService;
	
	@Autowired
	private Chart chart; 
	
	
	@ModelAttribute("edms")
	public String edmsIng() {		
		return "결재"; 
	}	
	
	
	@GetMapping("list")
	public String getlist(@AuthenticationPrincipal MemberVO memberVO, EdmsVO edmsVO, Model model, Pager pager, String check) throws Exception {
			
	//list : 결재진행목록
	//temp : 임시저장	0
	//done : 결재완료	
		
	Map<String, String> titles = chart.titles(check);
	List<Map<String,Object>> edmsList = new ArrayList<>();
			
	//리스트 내용 불러오기
			
	edmsList = edmsService.getEdmsList(pager,memberVO, check);	
	
	model.addAttribute("check",check);
	model.addAttribute("titles", titles);
	model.addAttribute("edmsList",edmsList);
	
	return "EDMS/list";
		 
	}
	
	@GetMapping("getDetail")
	public String getEdmsDetail(@AuthenticationPrincipal MemberVO memberVO, Model model, EdmsVO edmsVO, String check) throws Exception{
		Map<String, Object> map = edmsService.getDetail(edmsVO, check);	
		AprovalVO[] appline = edmsService.getApplineList(edmsVO, check);
		EdmsFileVO[] fileVOs = edmsService.getFileList(edmsVO, check);
		//EDMS_STATUS
		//0=결재서상신
		//1=수신결재
		//2=결재중
		//3=결재반려
		//4= 임시저장
		//5= 결재완료		
		int checkComent = 0;
		for(AprovalVO a : appline) {
			
			if(a.getAPRROVAL_COMENT()!=null) {
				
				checkComent = 1;
				
			}
			
		}
		
		Long type =(Long) map.get("EDMS_STATUS");		
		
		String checkType = "get";
		
		if(type==4) {			
			checkType = "create";			
		}
		
		model.addAttribute("dtype", type);
		model.addAttribute("fileVOs", fileVOs);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("document",check);
		model.addAttribute("appline", appline);
		model.addAttribute("edms", map);
		model.addAttribute("checkType",checkType);	
		model.addAttribute("checkComent", checkComent);
		
		return "EDMS/form";		
		
	}
	
	
	
	
	@GetMapping("form")
	public String getform(Model model) {
		
		return "EDMS/form";
		
	}
	
	@GetMapping("create")     //로그인한 유저 정보 불러오기
	public String createEdms(@AuthenticationPrincipal MemberVO memberVO,Model model) throws Exception {
		
		
		//부서이름, 직급 불러오기
		Map<String, Object> deptName = edmsService.getDeptName(memberVO);
		
		
		
		//직원목록 불러오기
		List<Map<String, String>> result = edmsService.getMemberList(); 
		

		model.addAttribute("member", memberVO); //로그인한 사용자 정보
		model.addAttribute("deptName", deptName);//부서이름, 
		model.addAttribute("list",result);		//직원목록 
		model.addAttribute("checkType","create");

		return "EDMS/form";
		
	}
	
	@ResponseBody
	@PostMapping("apply")	//type 1=문서저장 2= 임시문서저장 
	public Map<String, Object> apply(Integer[] appAr, EdmsVO edmsVO, Model model, MultipartFile[] file, int type, String check) throws Exception {		
		
		Map<String, Object> map = new HashMap<String, Object>();
		 
		
		// 기안서 내용을 저장.			
		int result = edmsService.createEdms(edmsVO, appAr, type, file);
		
		String msg = "결재가 정상적으로 전송되었습니다.";
		String path = "list?check="+check;
		
		if(type==2) {
			msg="임시저장되었습니다.";			
			map.put("path", "/list");
		}
		
		if(result!=1) {			
			msg = "실패";			
		}				
		
		map.put("msg", msg);
		map.put("path", path);		
		map.put("result", result);		
		
		return map; 		
	}
	
				
	@GetMapping("form/draft")
	
	public String getformDraft(Model model) {
		
		return "EDMS/form/draft";
		
	}
	
	
	
	
	
	@GetMapping("stamp")
	public String creatStemp(@AuthenticationPrincipal MemberVO memberVO, Model model) {
		
		model.addAttribute("member",memberVO);
		
		return"EDMS/stamp";
		
	}
	
	
	@PostMapping("crateStamp")
	@ResponseBody
	public Map<String, Object>  creatStemp(@AuthenticationPrincipal MemberVO memberVO, StampVO stampVO, MultipartFile img, Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		stampVO.setMember_Id(memberVO.getMember_id());
		
		int result =edmsService.createStamp(stampVO, img);
		 		
			
		
		String msg = "등록이 완료되었습니다.";
		String path = "/edms/list?check=recive";
		
		if(result==0) {
			 msg = "등록실패.";			 
		}
		if(result==3) {			
			msg = "변경되었습니다";
		}
		
		map.put("msg", msg);
		map.put("path", path);		
		map.put("result", result);
		
		return map;
		
		
	}
	
		
	
	//결재 승인
	@PostMapping("submit")
	@ResponseBody
	public Map<String, Object> edmsSubmit(@AuthenticationPrincipal MemberVO memberVO, EdmsVO edmsVO, AprovalVO aprovalVO, int tipo) throws Exception{	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		aprovalVO.setMEMBER_ID(memberVO.getMember_id());// 현재사용자 정보 입력 
		
		// 기안서 내용을 저장.		
		int result = edmsService.edmsSubmit(aprovalVO, edmsVO, tipo);
		
		String path = "list?check=aproved";
		String msg ="반려하였습니다.";
		
		
		if(result==3) {
			msg="최종결재하였습니다.";		
	
		}else if(result==1 ) {
			
			msg = "결재하였습니다.";
		}
		
		map.put("msg", msg);
		map.put("path", path);		
		map.put("result", result);		
		
		
		
		return map;
		
		
	}
	
	@GetMapping("importFrom")
	public String importFrom(int formNo) {
		
		
		if(formNo==2) {
			
			return "EDMS/form/approvalrequest";
			
		}
		
		return "";
	}
	
	
	@PostMapping("deleteTempEdms")
	@ResponseBody
	public Map<String, Object> deleteTempEdms(EdmsVO edmsVO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = edmsService.deleteTempEdms(edmsVO);		
		String msg = "삭제되었습니다.";
		String path = "list?check=temp";
		
		map.put("msg", msg);
		map.put("path", path);		
		map.put("result", result);			
		
		return map;
		
	}
	
	
	//jstree
	@GetMapping("api/chart")
	@ResponseBody
	public List<Map<String, Object>> getMethodName(@AuthenticationPrincipal MemberVO memberVO) throws Exception {		
//		 List<ChartVO> result =edmsService.getDeptList();
		 List<Map<String, Object>> result =edmsService.getDeptChart();
		 List<Map<String, Object>> empl = edmsService.getMemberChart();
		 List<Map<String, Object>> temp = new ArrayList<>();
		 Long mId = memberVO.getMember_id();
	
		 for(Map<String, Object> m : empl) {	 
			
			 		 		 
			 m.replace("parent", "0", "#");
			 m.put("type", "member");
			 
			 if(!m.get("MEMBER_ID").equals(mId)) { // 내 이름 제거
				
				 temp.add(m);				 
			 }
					
			
		 }
		 	 
		
		 for(Map<String, Object> a : result) {			 
				 
			 a.replace("parent", "0" , "#");
			 a.put("type", "dept");
				
		 }
		 
		 result.addAll(temp);			 
		 
		return result;		
		
		
	}
		
	
	
	//직원목록 불러오기
	
	
	
	@GetMapping("fileDown")
	public String fileDown(EdmsFileVO edmsFileVO, Model model)throws Exception{
		
		edmsFileVO = edmsService.getFileDetail(edmsFileVO);
		
		model.addAttribute("fileVO", edmsFileVO);
		
		return "fileDownView";
	}
	
	
}
