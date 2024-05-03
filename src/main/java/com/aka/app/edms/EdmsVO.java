package com.aka.app.edms;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
@Data
public class EdmsVO {

	private Long edms_No;
	private String edms_From_No;
	private Long edms_Creator;
	private String edms_Title;	
	private String edms_Content;
	private Long edms_Status;
	private Date edms_Apploval_Date;
	private Date edms_Create_Date;
	private Date edms_Exp_Date;
	private Integer edms_use;
	private Date edms_Extra_Date1;
	private Date edms_Extra_Date2;
	private String edms_Extra_Content;
	private Long edms_Extra_Number;
	private String edms_Creator_Position;	
	
	
	private List<EdmsFileVO> fileVOs; 
	
}
	
