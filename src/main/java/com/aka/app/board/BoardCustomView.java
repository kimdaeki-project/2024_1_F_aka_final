package com.aka.app.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component("BoardCustomView")
public  class BoardCustomView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			BoardVO	boardVO = (BoardVO) model.get("vo");
			BoardFileVO boardFileVO = boardVO.getBoardFileVO();
			File file = new File("D:/upload/board/",boardFileVO.getFilename());
			response.setCharacterEncoding("UTF-8");
			response.setContentLengthLong(file.length());
			String oriName = URLEncoder.encode(boardFileVO.getOrifilename(),"UTF-8");
			response.setHeader("Content-Disposition","attachment;filename=\""+oriName+"\"");
			response.setHeader("Content-Transfer-Encoding", "binary");
			FileInputStream fi = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(fi,os);
			os.close();
			fi.close();
			response.encodeRedirectURL("/board/detail?board_num="+boardVO.getBoard_num());
	}
	
}
