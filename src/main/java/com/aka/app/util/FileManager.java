package com.aka.app.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	
	public Boolean fileDelete(String path,String fileName) throws Exception {
		File file = new File(path, fileName);
		return file.delete();
	}
	
	public String fileSave(String path,MultipartFile multipartFile) throws Exception {
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileName = UUID.randomUUID().toString();
		fileName =  fileName+"_"+multipartFile.getOriginalFilename();
		file = new File(file,fileName);
		multipartFile.transferTo(file);
		return fileName;
	}
	
}
