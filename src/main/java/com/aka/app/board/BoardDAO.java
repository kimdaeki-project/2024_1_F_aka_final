package com.aka.app.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.util.Pager;

@Mapper
public interface  BoardDAO  {
	//공지사항 삭제
	public int deleteBoard(BoardVO boardVO)throws Exception;
	//공지사항 수정
	public int updateBoard(BoardVO boardVO)throws Exception;
	//공지사항 상세
	public BoardVO getBoardDetail(BoardVO boardVO)throws Exception;
	//페이징 총페이지수
	public Long getTotalCount(Pager pager)throws Exception;
	//공지사항 목록
	public List<BoardVO> getBoardList(Pager pager)throws Exception;
	//공지사항
	public int createBoard(BoardVO boardVO)throws Exception;
	//공지사항 첨부파일
	public int createBoardFiles(BoardFileVO boardFileVO)throws Exception;
	//첨푸파일 조회
	public BoardFileVO getBoardFileDetail(BoardFileVO boardFileVO)throws Exception;
}
