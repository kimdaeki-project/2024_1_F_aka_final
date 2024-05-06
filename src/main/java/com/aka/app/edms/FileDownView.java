package com.aka.app.edms;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component("fileDownView")
@Slf4j
public class FileDownView extends AbstractView {
	@Value("${app.upload.edms}")
	private String base;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			log.info("=========  FILE DOWN VIEW =========");
			log.info("===== {} ====", model);
			log.info("===== {}==== ", request.getRequestURI());
			
			EdmsFileVO fileVO = (EdmsFileVO)model.get("fileVO");
			
			String uri = request.getRequestURI();
			//폴더명 notice/
			uri = uri.substring(1, uri.lastIndexOf("/")+1);
			
			File file = new File(base+uri, fileVO.getEdms_Attechfile_Name());
			
			//응답시 한글 처리
			response.setCharacterEncoding("UTF-8");
			
			
			//총 파일 크기
			response.setContentLengthLong(file.length());
			
			//한글파일명 인코딩
			String oriName = URLEncoder.encode(fileVO.getEdms_Attechfile_Ori_Name(), "UTF-8");
			
			//Header 설정
			response.setHeader("Content-Disposition", "attachment;fileName=\""+oriName+"\"");
			response.setHeader("Content-Transfer-Encoding", "binary");
			
			//Server 의 HDD에서 파일을 읽어 오는 작업
			FileInputStream fi = new FileInputStream(file);
			
			//읽어 온 파일을 client로 전송
			OutputStream os = response.getOutputStream();
			
			//전송
			FileCopyUtils.copy(fi, os);
			
			//자원 해제
			
			os.close();
			fi.close();
			
		
	}

}
