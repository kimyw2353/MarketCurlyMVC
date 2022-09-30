package com.myspring.mapper;

import java.util.List;

import com.myspring.domain.CategoryVO;
import com.myspring.domain.OrderVO;
import com.myspring.domain.PagingVO;
import com.myspring.domain.ProductVO;
import com.myspring.domain.SumVO;

public interface AdminMapper {
	/** ī�װ� ��� �������� */
	List<CategoryVO> getCategoryList();

	public int categoryAdd(CategoryVO cvo);

	public int categoryDelete(int cg_num);

	/** [������ ���]- ��ǰ ���� ����ϱ� */
	public int productInsert(ProductVO prod);

	public List<ProductVO> productList(PagingVO page);

	public ProductVO selectByPnum(int pnum);

	// ��ǰ ����
	public int productEdit(ProductVO prod);

	// ��ǰ ����
	public int productDel(int pnum);

	// [������ ���]=>��ۻ���, ���һ��¸� �����ϴ� �޼ҵ�
	void manageOrder(String onum, String colName, String colVal);

	// [������ ���]=>���� �ֹ� ��� ��������
	List<OrderVO> getOrderListByMonth(String month);

	// [������ ���]=>������ ���� ��� ���ϱ�
	List<SumVO> getSumByYear();

	// [������ ���]=>�ش� �⵵ ���� ������� ���ϱ�
	List<SumVO> getSumByMonth(String month);
	
	public int getFindTotalCount(PagingVO page);

}
