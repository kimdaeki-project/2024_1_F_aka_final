package com.aka.app.product;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aka.app.util.FileManager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;
	@Value("${app.upload.product}")
	private String uploadPath;
	
	public int deleteProduct(ProductVO productVO) throws Exception {
		return productDAO.deleteProduct(productVO);
	}
	
	public int updateProduct(ProductVO productVO,MultipartFile attach) throws Exception {
		if(!attach.isEmpty()) {
			String fileName = fileManager.fileSave(uploadPath, attach);
			productVO.setProduct_photos(fileName);
		}
		int result = productDAO.updateProduct(productVO);
		return result;
	}
	
	public ProductVO getProductDetail (ProductVO productVO) throws Exception {
		return productDAO.getProductDetail(productVO);
	}
	
	public int createProduct (ProductVO productVO,MultipartFile attach) throws Exception {
		if(attach.isEmpty()) {
			Random random = new Random();
				productVO.setProduct_photos("/assets/img/elements/"+random.nextInt(7)+".jpg");
		}else {
			String fileName = fileManager.fileSave(uploadPath, attach);
			productVO.setProduct_photos(fileName);
		}	
		productVO.setMember_id(1L);
		return productDAO.createProduct(productVO);
	}
	
	public List<ProductVO> getProductList (ProductVO productVO) throws Exception {
		return  productDAO.getProductList(productVO);
	}
}
