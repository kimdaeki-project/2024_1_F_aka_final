package com.aka.app.board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.member.MemberVO;
import com.aka.app.util.FileManager;
import com.aka.app.util.Pager;

import jakarta.servlet.http.HttpSession;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private FileManager fileManager;
	@Value("${app.upload.board}")
	private String uploadPath;
	
	public int deleteBoard(BoardVO boardVO)throws Exception{
		return boardDAO.deleteBoard(boardVO);
	}
	
	public int updateBoard(BoardVO boardVO) throws Exception {
		return boardDAO.updateBoard(boardVO);
	}
	
	public BoardVO getBoardDetail(BoardVO boardVO) throws Exception {
		return boardDAO.getBoardDetail(boardVO);
	}
	
	public List<BoardVO> getBoardList(Pager pager)throws Exception{
		pager.makeIndex();
		Long totalCount = boardDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		return boardDAO.getBoardList(pager);
	}
	
	public int createBoard(BoardVO boardVO,HttpSession session,MultipartFile attach) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");  //세션에서 스프링 시큐리티 컨택스트 홀더 꺼내기
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;	   //홀더에서 컨텍스트 꺼내기
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal(); //컨택스트에서 유저 객체 꺼내기
		Date today = new Date();
		SimpleDateFormat dataformat = new SimpleDateFormat("yyyy.MM.dd"); // / HH:mm 시간 생략
		String date = dataformat.format(today);
		boardVO.setBoard_date(date);
		boardVO.setMember_id(memberVO.getMember_id());
		boardVO.setBoard_writer(memberVO.getUsername());
		int result = boardDAO.createBoard(boardVO);
		if(!attach.isEmpty()) {
			String fileName = fileManager.fileSave(uploadPath, attach);
			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setBoard_num(boardVO.getBoard_num());
			boardFileVO.setMember_id(memberVO.getMember_id());
			boardFileVO.setFilename(fileName);
			boardFileVO.setOrifilename(attach.getOriginalFilename());
			boardDAO.createBoardFiles(boardFileVO);
		}
		return result;
	}
}
