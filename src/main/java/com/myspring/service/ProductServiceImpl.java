package com.myspring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.domain.ProductVO;
import com.myspring.mapper.CartMapper;
import com.myspring.mapper.ProductMapper;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductMapper prodMapper;
	@Inject
	private CartMapper cartMapper;

	@Override
	public int productInsert(ProductVO item) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductVO> productList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> selectByPspec(String pspec) {
		// TODO Auto-generated method stub
		return prodMapper.selectByPspec(pspec);
	}

	@Override
	public ProductVO selectByPnum(Integer pnum) {
		// TODO Auto-generated method stub
		return prodMapper.selectByPnum(pnum);
	}

}
