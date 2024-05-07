package com.aka.app.util;

import java.io.IOException;
import java.util.Base64;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileToPhotoEncoder {

	public String encoderFPTS( MultipartFile img) throws IOException {
		
		byte[] blob_img = Base64.getEncoder().encode(img.getBytes()); //사진파일 byte로 변환
	
		String photo =  "data:image/png;base64,";// 사진출력용 접두사		
	
		String stamp_Img = new String(blob_img,"UTF-8");// 파일을 스트링으로 변환
		
		String result =  photo +  stamp_Img; //  접두사 접미사 붙인 사진파일 저장
		
		
		return result; // 반환 
	}
	
}
