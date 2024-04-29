package com.aka.app.edms;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EdmsFileVO {

	private Long edms_Attech_file_No;
	private Long edms_No;
	private String edms_Attechfile_Name;
	private String edms_AttechfileOri_Name;	
	private MultipartFile[] file; 		
	
	
	
}
