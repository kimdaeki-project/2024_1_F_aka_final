package com.aka.app.equipment;



import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EquipmentVO {
	
	//비품 번호
	private Long equipment_num;
	//사원 번호
	private Long member_id;
	@NotBlank(message = "비품 이름을 입력해 주세요")
	//비품 이름
	private String equipment_name;
	@NotEmpty(message = "비품 구매 날짜 입력해 주세요")
	//비품 날짜
	private String equipment_date;
	@NotNull(message = "비품 수량을 입력해 주세요")
	//비품 총갯수
	private Long equipment_ea;
	//비품 상세 설명
	private String equipment_contents;
	//비품 이름
	private String member_name;
	
	
	
}
