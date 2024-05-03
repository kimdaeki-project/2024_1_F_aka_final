package com.aka.app.equipment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aka.app.util.Pager;

@Mapper
public interface EquipmentDAO {
	//비품 삭제
	public int deleteEquipment (EquipmentVO equipmentVO) throws Exception;
	//비품 생성
	public int createEquiment (EquipmentVO equipmentVO)throws Exception;
	//비품 상세
	public EquipmentVO getEquimentDetail (EquipmentVO equipmentVO) throws Exception;
	//비품 리스트
	public List<EquipmentVO> getEquimentList (Pager pager)throws Exception;  
	//비품 페이징 총 갯수
	public Long getTotalCount (Pager pager)throws Exception;
	//비품 수정
	public int updateEquipment (EquipmentVO equipmentVO)throws Exception;
}
