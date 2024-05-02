package com.aka.app.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDAO {
	
	
	
	//상품 삭제
	public int deleteProduct(ProductVO productVO) throws Exception;
	//상품 수정
	public int updateProduct (ProductVO productVO) throws Exception ;
	//상품 상세
	public ProductVO getProductDetail (ProductVO productVO)throws Exception;
	//상품 목록
	public List<ProductVO> getProductList (ProductVO productVo) throws Exception;
	//상품 생성
	public int createProduct (ProductVO producVO) throws Exception;
	public Long getProductCount()throws Exception;

}
