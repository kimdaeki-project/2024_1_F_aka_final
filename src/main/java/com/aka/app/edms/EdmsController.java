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
import com.aka.app.util.Pager;


@Controller
@RequestMapping("/edms/*")
public class EdmsController {
	
	@Autowired
	private EdmsService edmsService;
	
	
	
	@ModelAttribute("edms")
	public String edmsIng() {		
		return "결재"; 
	}	
	
	
	
	@GetMapping("pro/list")
	public String getProlist(@AuthenticationPrincipal MemberVO memberVO, EdmsVO edmsVO, Model model, Pager pager) throws Exception {
			
	
	Map<String, Object> titles = new HashMap<>();
	
	titles.put("theme", "결재진행목록");
	titles.put("no1","번호");
	titles.put("no2", "제목");
	titles.put("no3","내용");
	titles.put("no4", "생성일");
	titles.put("no5", "결재상태");
		
	//리스트 내용 불러오기	
	List<EdmsVO> edmsList = edmsService.getEdmsList(pager,memberVO);
	System.out.println(edmsList);	
	model.addAttribute("titles", titles);
	model.addAttribute("list",edmsList);
	
	
	
	
	return "EDMS/list";
		 
	}
	
	/*
	 * @GetMapping("form") public String getform(Model model) {
	 * model.addAttribute("path","form"); return "EDMS/prolist";
	 * 
	 * }
	 */
	
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
		

		model.addAttribute("member", memberVO);
		model.addAttribute("deptName", deptName);
		model.addAttribute("list",result);		
		model.addAttribute("checkType","create");
		
//		System.out.println(model);
		
		return "EDMS/form";
		
	}
	
	public void getEdmsDetail(Long edms_no) {
		
		
		
		
	}
	
	@ResponseBody
	@PostMapping("apply")	//check 1=문서저장 2= 임시문서저장
	public Map<String, Object> apply(Integer[] appAr, EdmsVO edmsVO, Model model, MultipartFile[] file, int check) throws Exception {		
		
		Map<String, Object> map = new HashMap<String, Object>();
		 
		
		// 기안서 내용을 저장.		
		int result = edmsService.createEdms(edmsVO, appAr, check, file);
		
		String msg = "결재가 정상적으로 전송되었습니다.";
		String path = "pro/list";
		
		if(check==2) {
			msg="임시저장되었습니다.";			
			map.put("path", "pro/list");
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
		 
//		 System.out.println(result);
		
		
		 
		return result;		
		
		
	}
	
	
	
	
	//직원목록 불러오기
	
	
	
}
