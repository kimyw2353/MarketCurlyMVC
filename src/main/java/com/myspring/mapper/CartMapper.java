package com.myspring.mapper;

import java.util.List;
import java.util.Map;



import com.myspring.domain.CartVO;
//���Ӽ� ������ �������̽�(XXXMapper)�� �����ؼ� ������ ������
//�������̽��� ��ӹ޴� Ŭ������ �������� �ڵ����� ������ش�.==> Proxy��ü
//�׷����� ������ �ؾ� �Ѵ�. datasource-context.xml�� �����ؾ� �Ѵ�.

public interface CartMapper {

	int selectCartByPnum(CartVO cartVo);

	int updateCartOqty(CartVO cartVo);

	int addCart(CartVO cartVo);

	List<CartVO> selectCartView(int midx);

	CartVO getCartTotal(int midx_fk);

	int delCart(int cartNum);

	int editCart(CartVO cartVo);

	void delCartByOrder(Map<String, Integer> map);

}
