package com.myspring.service;

import java.util.List;

import com.myspring.domain.ProductVO;

public interface ProductService {

	int productInsert(ProductVO item);

	List<ProductVO> productList();

	List<ProductVO> selectByPspec(String pspec);

	ProductVO selectByPnum(Integer pnum);

}
