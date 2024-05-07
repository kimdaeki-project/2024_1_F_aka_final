package com.aka.app.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aka.app.schedule.ScheduleVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member**")
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("")
	public String loginCheck() {
		return "member/first";
	}
	
	@GetMapping("/login")
	public String memberLogin(@ModelAttribute MemberVO memberVO, HttpSession session, Model model)throws Exception {
		
		Object obj=session.getAttribute("SPRING_SECURITY_CONTEXT");
		
		log.info("=====getName : {}=======",memberVO.getName());
		if(obj == null) {
			return "member/memberLogin";
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/register")
	public String register(@ModelAttribute MemberVO memberVO) throws Exception{
		if(memberVO.getUser_id() != null) {
			return "redirect:/";
		}
		return "member/memberRegister";
	}
	
	@PostMapping("/register")
	public String register(@Validated MemberVO memberVO, BindingResult bindingResult, Model model)throws Exception{
		
		int result = memberService.add(memberVO);
	    
	    String msg = "가입 실패";
	    String path = "./join";

	    if (result > 0) {
	        msg = "가입 성공";
	        path = "../";
	    }

	    model.addAttribute("msg", msg);
	    model.addAttribute("path", path);
	    
		return "commons/result";
	}
	
	@GetMapping("/mypage")
//	@Validated(MemberUpdateGroup.class) MemberVO memberVO, 
	public String update(HttpSession session, Model model) throws Exception{
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl securityContextImpl = (SecurityContextImpl)obj;
		log.info("SecurityContextImpl === {}",securityContextImpl.getAuthentication().getPrincipal());
		MemberVO memberVO = (MemberVO)securityContextImpl.getAuthentication().getPrincipal();
		ScheduleVO scheduleVO = memberService.getSchedule(memberVO);
		log.info("mypage scheduleVO : {}", scheduleVO);
		model.addAttribute("member", securityContextImpl.getAuthentication().getPrincipal());
		model.addAttribute("schedule", scheduleVO);
		return "member/mypage";
	}
	
	@PostMapping("/mypage")
	@ResponseBody
	public ResponseEntity<?> update(@RequestBody MemberVO memberVO)throws Exception{
		memberService.updateMyinfo(memberVO);
		return ResponseEntity.ok().build();
	}
	
	@GetMapping("/findPw")
	public String findPw() throws Exception{
		return "member/findPw";
	}
	
	@PostMapping("/findPw")
	public String findPw(Model model,@RequestParam("email")String email, @RequestParam("user_id")String user_id) throws Exception{
		
		String msg = "일치하는 정보가 없습니다.";
		String path = "./findPw";
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setUser_id(user_id);
		
		if(memberService.updateMail(memberVO) > 0) {
			msg = "임시비밀번호가 메일로 전송되었습니다.";
			path = "./login";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path",path);
		
		return "commons/result";
	}
	// 출근누르고 퇴근으로 버튼 변하게하기
	// 퇴근시간은 update로 그날이 지나지않으면 버튼안보이는걸로
	// 출,퇴근 시간 jsp출력
	@PostMapping("/mypage/schedule")
	public String createCheck(ScheduleVO scheduleVO, Model model)throws Exception{
		int result = memberService.createCheck(scheduleVO);
		
		String msg = "";
		String path="";
		
		if(result > 0) {
			msg = "출근.";
			path = "/member/mypage";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path",path);
		
		return "commons/result";
	}
	
	@PostMapping("/mypage/scheduleout")
	public String updateEndDate(Model model, MemberVO memberVO) throws Exception{
		int result = memberService.updateEndDate(memberVO);
		
		String msg = "";
		String path = "";
		
		if(result > 0) {
			msg = "퇴근";
			path="/member/mypage";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("path",path);
		
		return "commons/result";
	}
}

