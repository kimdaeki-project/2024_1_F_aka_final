package com.aka.app.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardFileVO {
	//공지사항 파일 번호
	private Long boardfile_num;
	//공지사항 번호
	private Long board_num;
	//작성자 사원 번호
	private Long member_id;
	//저장된 파일이름
	private String filename;
	//원본 파일 이름
	private String orifilename;
}
