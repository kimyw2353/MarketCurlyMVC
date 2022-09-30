package com.myspring.mapper;

import java.util.List;

import com.myspring.domain.OrderVO;
import com.myspring.domain.ProductVO;

public interface OrderMapper {
	// �ֹ� ���������� insert�ϴ� �޼ҵ�
		int orderDescInsert(OrderVO ovo);

		// �ֹ� ��ǰ���� insert
		int orderProductInsert(ProductVO prod);

		// ������ ���� insert
		int receiverInsert(OrderVO ovo);

		List<OrderVO> getOrderDesc(String onum);

		List<OrderVO> getUserOrderList(int midx_fk);

}
