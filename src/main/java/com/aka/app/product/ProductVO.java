package com.aka.app.product;



import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	//상품 번호
	private Long product_num;
	//상품 작성자 
	private Long member_id;
	//상품 이름
	@NotEmpty(message = "상품 이름을 입력하세요")
	private String product_name;
	//상품 가격
	@NotNull(message="상품 가격을 입력하세요")
	private Long product_price;
	//상품 날짜
	@Min(value=1L,message ="상품 기간을 입력하세요")
	private Long product_date;
	//상품 상세
	private String product_detail;
	//상품 번호
	private String product_photos;
	//상품 첨부 파일
	private MultipartFile files;
	private Long start=1L;
	private Long last;
	
	
	
	public Long getLast() {
		if(this.last==null || this.last<1) {
			this.last=1L;
		}
		return this.last;
	}
}
