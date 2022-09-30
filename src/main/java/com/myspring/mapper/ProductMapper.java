package com.myspring.mapper;

import java.util.List;

import com.myspring.domain.ProductVO;

public interface ProductMapper {
	public int productInsert(ProductVO item);

	public List<ProductVO> productList();

	List<ProductVO> selectByPspec(String pspec);

	ProductVO selectByPnum(Integer pnum);
}
