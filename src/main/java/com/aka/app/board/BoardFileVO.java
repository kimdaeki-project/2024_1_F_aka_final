package com.aka.app.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardFileVO {

	private Long boardfile_num;
	private Long board_num;
	private Long member_id;
	private String filename;
	private String orifilename;
}
