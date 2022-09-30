package com.myspring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.domain.CartVO;
import com.myspring.domain.ProductVO;
import com.myspring.mapper.CartMapper;
import com.myspring.mapper.ProductMapper;

@Service("shopServiceImpl")
public class ShopServiceImpl implements ShopService {
	
	
	@Inject
	private ProductMapper prodMapper;
	@Inject
	private CartMapper cartMapper;
	

	@Override
	public List<ProductVO> selectByPspec(String pspec) {
		
		return prodMapper.selectByPspec(pspec);
	}

	@Override
	public List<ProductVO> selectByCategory(int cg_num) {
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductVO selectByPnum(int pnum) {
		return prodMapper.selectByPnum(pnum);
	}

	@Override
	public int addCart(CartVO cartVo) {
		//[1]장바구니번호로  cart테이블에잇는 상품개수 가져오기
		int count=cartMapper.selectCartByPnum(cartVo);
		System.out.println("count:"+count);
		
		int n=0;
		if(count>0) {
			//[2]해당상품이 이미 장바구니에 존재한다면 수량만 수정
			n=cartMapper.updateCartOqty(cartVo);
		}else {
			//[3]해당 상품이 장바구니에 없다면 insert
			n=cartMapper.addCart(cartVo);
		}
		//return cartMapper.addCart(cartVo);
		return n;
	}

	@Override
	public int updateCartQty(CartVO cartVo) {
		
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editCart(CartVO cartVo) {
		//수량에 따라 다르게 로직처리함
		int qty=cartVo.getOqty();
		if(qty==0) {//수량이 0이면 삭제처리
			return this.delCart(cartVo.getCartNum());
		}else if(qty<0) {//음수
			throw new NumberFormatException("수량에 음수를 입력할 수 없습니다.");
			//익셉션 처리 1.cart컨트롤러에서 처리
			//			=> @ExceptionHandler(NumberFormatException.class)
		}else {//양수
			return this.cartMapper.editCart(cartVo);
		}
	}

	@Override
	public List<CartVO> selectCartView(int idx_fk) {
		
		// TODO Auto-generated method stub
		return this.cartMapper.selectCartView(idx_fk);
				//this.은 자기가 가진 메소드나 변수를 나타내기 위함
	}

	@Override
	public int delCart(int cartNum) {
		
		return this.cartMapper.delCart(cartNum);
	}

	@Override
	public int delCartAll(CartVO cartVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delCartOrder(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCartCountByIdx(CartVO cartVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CartVO getCartTotal(int midx_fk) {
		
		return this.cartMapper.getCartTotal(midx_fk);
	}

	@Override
	public void delCartByOrder(int midx_fk, int pnum) {
		Map<String, Integer> map=new HashMap<>();
		map.put("idx_fk", midx_fk);
		map.put("pnum_fk", pnum);		
		this.cartMapper.delCartByOrder(map);

	}

}
