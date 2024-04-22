package com.aka.app.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public abstract class BoardCustomView extends AbstractView{

	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardVO boardVO = (BoardVO)model.get("vo");
		List<BoardFileVO> boardFileVOs = boardVO.getBoardFilesVO();
		for(BoardFileVO a : boardFileVOs) {
			File file = new File("/Users/seungkyun/workspace/upload/board/",a.getFilename());
			response.setCharacterEncoding("UTF-8");
			response.setContentLengthLong(file.length());
			String oriName = URLEncoder.encode(a.getOrifilename(),"UTF-8");
			response.setHeader("Content-Disposition","attachment;filename=\""+oriName+"\"");
			response.setHeader("Content-Transfer-Encoding", "binary");
			FileInputStream fi = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(fi,os);
			os.close();
			fi.close();
		}
		
	}
	
}
