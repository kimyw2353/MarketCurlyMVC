package com.myspring.service;

import java.util.List;

import com.myspring.domain.CenterVO;

public interface CenterService {
	
	/*고객센터 작성*/
	public void write(CenterVO vo) throws Exception;
	
	/*고객센터 조회*/
	public CenterVO read(int cno) throws Exception;

	/*고객센터 수정*/
	public void update(CenterVO vo) throws Exception;
	
	/*고객센터 삭제*/
	public void delete(int cno) throws Exception;

	/*고객센터 목록 조회*/
	public List<CenterVO> list() throws Exception;

}
