package com.aka.app.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.util.Pager;

@Mapper
public interface  BoardDAO  {
	
	public int deleteBoard(BoardVO boardVO)throws Exception;
	
	public int updateBoard(BoardVO boardVO)throws Exception;
	
	public BoardVO getBoardDetail(BoardVO boardVO)throws Exception;
	
	public Long getTotalCount(Pager pager)throws Exception;
	
	public List<BoardVO> getBoardList(Pager pager)throws Exception;

	public int createBoard(BoardVO boardVO)throws Exception;
	
	public int createBoardFiles(BoardFileVO boardFileVO)throws Exception;
	
}
