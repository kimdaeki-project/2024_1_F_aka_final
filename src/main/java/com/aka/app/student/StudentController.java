package com.aka.app.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aka.app.board.BoardVO;
import com.aka.app.member.MemberService;
import com.aka.app.member.MemberVO;
import com.aka.app.util.Pager;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/student/*")
public class StudentController {
	@Autowired
	private  MemberService memberService;
	@Autowired
	private StudentService studentService;
	
	
	@GetMapping("update")
	public ModelAndView updateStudent(MemberVO memberVO,ModelAndView mv) throws Exception {
		memberVO = studentService.getStudentDetail(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("student/update");
		return mv;
	}
	@PostMapping("update")
	public String updateStudent(MemberVO memberVO,Model model) throws Exception {
		int result=0;
		String msg = "수강생 수정 실패";
		if(memberVO.getMember_id() != null) {		
			result = studentService.updateStudent(memberVO);
			if(result == 1) msg = "수강생 수정 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/student/list");				
		return "commons/result";
	}
	
	@PostMapping("delete")
	public String deleteStudent(MemberVO memberVO,Model model) throws Exception {
		int result=0;
		String msg = "수강생 삭제 실패";
		if(memberVO.getMember_id() != null) {		
			result = studentService.deleteStudent(memberVO);
			if(result == 1) msg = "수강생 삭제 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/student/list");				
		return "commons/result";
	}
	
	@GetMapping("create")
	public void createStudent(@ModelAttribute MemberVO memberVO) throws Exception {	
	}
	
	@PostMapping("create")
	public String createStudent(@Valid MemberVO memberVO,BindingResult bindingResult,Model model) throws Exception {
		if(bindingResult.hasErrors()) {
			return "student/create";
		}
		memberVO.setDepartment_id(15L);
		memberService.add(memberVO);
		return "student/list";
	}
	
	@GetMapping("list")
	public String getStudentList(Pager pager,Model model) throws Exception {
		List<MemberVO>list = studentService.getStudentList(pager);
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "student/list";
	}
}
