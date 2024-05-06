package com.aka.app.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	//update 파일 삭제 비동기
	@GetMapping("fileDelete")
	@ResponseBody
	public int fileDelete(BoardFileVO boardFileVO)throws Exception {
		boardFileVO = boardService.getBoardFileDetail(boardFileVO);
		int result = 0;
		if(boardFileVO !=null) {
			result = boardService.fileDelete(boardFileVO);
			
		}
		return result;
	}
	//파일 다운로드
	@GetMapping("filedown")
	public ModelAndView filedown(ModelAndView mv,BoardFileVO boardFileVO) throws Exception {
		boardFileVO = boardService.getBoardFileDetail(boardFileVO);
		mv.addObject("vo",boardFileVO);
		mv.setViewName("BoardCustomView");
		return mv;
	}
	//공지사항 삭제
	@PostMapping("delete")
	public String deleteBoard(BoardVO boardVO,Model model) throws Exception {
		int result=0;
		String msg = "공지사항 삭제 실패";
		if(boardVO.getBoard_num() != null) {
			boardVO = boardService.getBoardDetail(boardVO);
			result = boardService.deleteBoard(boardVO);
			if(result == 1) msg = "공지사항 삭제 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/board/list");				
		return "commons/result";
	}
	
	//공지사항 수정
	@PostMapping("update")
	public ModelAndView updateBoard(BoardVO boardVO,ModelAndView mv,MultipartFile[]attach) throws Exception {
		int result=0;
		String msg = "공지사항 수정 실패";
		if(boardVO.getBoard_num() != null) {				
			result = boardService.updateBoard(boardVO,attach);
			if(result == 1) msg = "공지사항 수정 성공";
		}
		mv.addObject("msg",msg);
		mv.addObject("path","/board/list");				
		mv.setViewName("commons/result");
		return mv;
	}
	
	//공지사항 수정 페이지
	@GetMapping("update")
	public String updateBoard(BoardVO boardVO,Model model) throws Exception {
		boardVO = boardService.getBoardDetail(boardVO);
		model.addAttribute("vo",boardVO);
		return "board/update";
	}
	
	//공지사항 상세
	@GetMapping("detail")
	public ModelAndView getBoardDetail(BoardVO boardVO,ModelAndView mv)throws Exception{
		boardVO = boardService.getBoardDetail(boardVO);
		mv.addObject("vo",boardVO);
		mv.setViewName("board/detail");
		return mv;
	}
	
	//공지사항 목록
	@GetMapping("list")
	public String getBoardList(BoardVO boardVO,Pager pager,Model model)throws Exception{
		List<BoardVO>list = boardService.getBoardList(pager);
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "board/list";
	}
	
	//공지사항 생성 페이지
	@GetMapping("create")
	public void createBoard(@ModelAttribute BoardVO boardVO) throws Exception {
	}
	
	//공지사항 생성
	@PostMapping("create")
	public String createBoard(@Valid BoardVO boardVO,BindingResult bindingResult,Model model,HttpSession session,MultipartFile[]boardFile) throws Exception {
		int result=0;
		String msg = "공지사항 추가 실패";
		if(bindingResult.hasErrors()) {
			//form 검증 실패시 
			return "board/create";
		}
		result = boardService.createBoard(boardVO,session,boardFile);
		if(result ==1) msg = "공지사항 추가 성공";
		model.addAttribute("msg", msg);
		model.addAttribute("path", "/board/list");
		return"commons/result";
	}
}
