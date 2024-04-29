package com.aka.app.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aka.app.equipment.EquipmentVO;
import com.aka.app.util.Pager;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.val;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("filedown")
	public ModelAndView filedown(ModelAndView mv,BoardFileVO boardFileVO) throws Exception {
		boardFileVO = boardService.getBoardFileDetail(boardFileVO);
		mv.addObject("vo",boardFileVO);
		mv.setViewName("BoardCustomView");
		return mv;
	}
	
	@PostMapping("delete")
	public String deleteBoard(BoardVO boardVO,Model model) throws Exception {
		int result=0;
		String msg = "비품 삭제 실패";
		if(boardVO.getBoard_num() != null) {
			boardVO = boardService.getBoardDetail(boardVO);
			result = boardService.deleteBoard(boardVO);
			if(result == 1) msg = "비품 삭제 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/board/list");				
		return "commons/result";
	}
	
	@PostMapping("update")
	public ModelAndView updateBoard(BoardVO boardVO,ModelAndView mv) throws Exception {
		int result=0;
		String msg = "공지사항 수정 실패";
		if(boardVO.getBoard_num() != null) {				
			result = boardService.updateBoard(boardVO);
			if(result == 1) msg = "공지사항 수정 성공";
		}
		mv.addObject("msg",msg);
		mv.addObject("path","/board/list");				
		mv.setViewName("commons/result");
		return mv;
	}
	
	@GetMapping("update")
	public String updateBoard(BoardVO boardVO,Model model) throws Exception {
		boardVO = boardService.getBoardDetail(boardVO);
		model.addAttribute("vo",boardVO);
		return "board/update";
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(BoardVO boardVO,ModelAndView mv)throws Exception{
		boardVO = boardService.getBoardDetail(boardVO);
		mv.addObject("vo",boardVO);
		mv.setViewName("board/detail");
		return mv;
	}
	
	@GetMapping("list")
	public String getBoardList(BoardVO boardVO,Pager pager,Model model)throws Exception{
		List<BoardVO>list = boardService.getBoardList(pager);
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "board/list";
	}
	
	@GetMapping("create")
	public void createBoard(@ModelAttribute BoardVO boardVO) throws Exception {
	}
	
	@PostMapping("create")
	public String createBoard(@Valid BoardVO boardVO,BindingResult bindingResult,Model model,HttpSession session) throws Exception {
		int result=0;
		String msg = "공지사항 추가 실패";
		if(bindingResult.hasErrors()) {
			//form 검증 실패시 
			return "board/create";
		}
		result = boardService.createBoard(boardVO,session);
		if(result ==1) msg = "공지사항 추가 성공";
		model.addAttribute("msg", msg);
		model.addAttribute("path", "/board/list");
		return"commons/result";
	}
}
