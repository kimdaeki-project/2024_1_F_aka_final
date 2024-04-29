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
	
	private Long board_num;
	private Long member_id;
	private String board_writer;
	@NotBlank(message = "공지사항 제목을 입력해 주세요")
	private String board_head;
	@NotEmpty(message = "공지사항 내용을 입력해 주세요")
	private String board_contents;
	private String board_date;
	private List<MultipartFile> boardFile;
	private List<BoardFileVO> boardFileVO;
}
