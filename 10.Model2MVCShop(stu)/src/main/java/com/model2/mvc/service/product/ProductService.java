package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

//상품관리를 추상화 캡슐화한 ProductService Interface
public interface ProductService {
	
	//판매상품등록
	public void addProduct(Product product) throws Exception;
	
	//상품상세조회
	public Product getProduct(int prodNo) throws Exception;
	
	//상품 목록조회 / 상품 관리
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	//상품정보수정
	public void updateProduct(Product product) throws Exception;
	
	//autocomplete
	public List<String> autocomplete() throws Exception;
}
