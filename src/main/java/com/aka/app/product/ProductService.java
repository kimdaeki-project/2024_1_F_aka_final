package com.aka.app.product;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.util.FileManager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;
	
	public int deleteProduct(ProductVO productVO) throws Exception {
		return productDAO.deleteProduct(productVO);
	}
	
	public int updateProduct(ProductVO productVO) throws Exception {
		return productDAO.updateProduct(productVO);
	}
	
	public ProductVO getProductDetail (ProductVO productVO) throws Exception {
		return productDAO.getProductDetail(productVO);
	}
	
	public int createProduct (ProductVO productVO,MultipartFile file) throws Exception {
		if(file.isEmpty()) {
			Random random = new Random();
				productVO.setProduct_photos("/assets/img/elements/"+random.nextInt(7)+".jpg");
		}else {
			String fileName = fileManager.fileSave("/", file);
			String oriName = file.getOriginalFilename();
		}	
		productVO.setMember_id(1L);
		return productDAO.createProduct(productVO);
	}
	
	public List<ProductVO> getProductList (ProductVO productVO) throws Exception {
		return  productDAO.getProductList(productVO);
	}
}
