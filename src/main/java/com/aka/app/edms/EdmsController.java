package com.aka.app.edms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
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
	//temp : 임시저장	
	//done : 결재완료	
		
	Map<String, String> titles = chart.titles(check);
	List<EdmsVO> edmsList = new ArrayList<>();
			
	//리스트 내용 불러오기
			
	edmsList = edmsService.getEdmsList(pager,memberVO, check);	
	
	model.addAttribute("check",check);
	model.addAttribute("titles", titles);
	model.addAttribute("list",edmsList);
	
	return "EDMS/list";
		 
	}
	
	@GetMapping("getDetail")
	public String getEdmsDetail(Model model, EdmsVO edmsVO, String check) throws Exception{
		Map<String, Object> map = edmsService.getDetail(edmsVO, check);	
		AprovalVO[] appline = edmsService.getApplineList(edmsVO, check);	
		//EDMS_STATUS
		//0=결재서상신
		//1=수신결재
		//2=결재중
		//3=결재반려
		//4= 임시저장
		//5= 결재완료		
						
		Long type =(Long) map.get("EDMS_STATUS");		
		
		String checkType = "get";
		
		if(type==4) {			
			checkType = "create";			
		}

		model.addAttribute("appline", appline);
		model.addAttribute("edms", map);
		model.addAttribute("checkType",checkType);	
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	//jstree
	@GetMapping("api/chart")
	@ResponseBody
	public List<Map<String, Object>> getMethodName() throws Exception {		
//		 List<ChartVO> result =edmsService.getDeptList();
		 List<Map<String, Object>> result =edmsService.getDeptChart();
		 List<Map<String, Object>> temp = edmsService.getMemberChart();
		 
		 	 
				  
		 for(Map<String, Object> m : temp) {			 
				 
			 m.replace("parent", "0", "#");
			 m.put("type", "member");
					
		 }
		 	 
		 
		 for(Map<String, Object> a : result) {			 
				 
			 a.replace("parent", "0", "#");
			 a.put("type", "dept");
				
		 }
		 
		 result.addAll(temp);		 	
		 
		return result;		
		
		
	}
		
	
	
	//직원목록 불러오기
	
	
	
}
