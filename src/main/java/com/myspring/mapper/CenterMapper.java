package com.myspring.mapper;

import java.util.List;

import com.myspring.domain.CenterVO;

public interface CenterMapper {

	// 고객센터 글 작성
	public void write(CenterVO vo) throws Exception;

	// 고객센터 글 조회
	public CenterVO read(int cno) throws Exception;

	// 고객센터 글 수정
	public void update(CenterVO vo) throws Exception;

	// 고객센터 글 삭제
	public void delete(int cno) throws Exception;

	// 고객센터 글 목록
	public List<CenterVO> list() throws Exception;

}
