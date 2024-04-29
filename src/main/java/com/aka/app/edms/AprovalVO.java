package com.aka.app.edms;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class AprovalVO {

	private Long APPROVAL_NO;	
	private Long EDMS_NO;	
	private Long MEMBER_ID;	
	private Long APPROVAL_RANK;	
	private Long APRROVAL_RESULT;	
	private String APRROVAL_COMENT;	
	private Date APPROVAL_DATE;	
	private String USERNAME;
	private Long READ;
	private String POSITION_NAME;
	
	
	
}
