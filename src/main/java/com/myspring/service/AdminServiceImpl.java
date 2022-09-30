package com.myspring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.domain.CategoryVO;
import com.myspring.domain.OrderVO;
import com.myspring.domain.PagingVO;
import com.myspring.domain.ProductVO;
import com.myspring.domain.SumVO;
import com.myspring.mapper.AdminMapper;

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminMapper adminMapper;
	
	@Override
	public List<CategoryVO> getCategoryList() {
		return this.adminMapper.getCategoryList();
	}

	@Override
	public int categoryAdd(CategoryVO cvo) {
		return 0;
	}

	@Override
	public int categoryDelete(int cg_num) {
		return 0;
	}

	@Override
	public int productInsert(ProductVO prod) {
		return this.adminMapper.productInsert(prod);
	}

	@Override
	public List<ProductVO> productList(PagingVO page) {
		return this.adminMapper.productList(page);
	}

	@Override
	public void manageOrder(String onum, String colName, String colVal) {
	}

	@Override
	public List<OrderVO> getOrderListByMonth(String month) {
		return null;
	}

	@Override
	public List<SumVO> getSumByYear() {
		return null;
	}

	@Override
	public List<SumVO> getSumByMonth(String month) {
		return null;
	}

	@Override
	public int productEdit(ProductVO prod) {
		return this.adminMapper.productEdit(prod);
	}

	@Override
	public int productDel(int pnum) {
		return this.adminMapper.productDel(pnum);
	}

	@Override
	public ProductVO selectByPnum(int pnum) {
		return this.adminMapper.selectByPnum(pnum);
	}

	@Override
	public int getFindTotalCount(PagingVO page) {
		return this.adminMapper.getFindTotalCount(page);
	}

}
