package com.aka.app.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class BoardVO {
	//공지사항 번호
	private Long board_num;
	//공지사항 작성자 사원 번호
	private Long member_id;
	//작성자 이름
	private String board_writer;
	@NotBlank(message = "공지사항 제목을 입력해 주세요")
	//공지사항 제목
	private String board_head;
	@NotEmpty(message = "공지사항 내용을 입력해 주세요")
	//공지사항 내용
	private String board_contents;
	//공지사항 작성 날짜
	private String board_date;
	//공지사항 첨부 파일들
	private List<BoardFileVO> boardFileVO;
}
