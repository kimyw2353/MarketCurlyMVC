package com.myspring.mapper;

import java.util.List;

import com.myspring.domain.CenterVO;

public interface CenterMapper {

	// ������ �� �ۼ�
	public void write(CenterVO vo) throws Exception;

	// ������ �� ��ȸ
	public CenterVO read(int cno) throws Exception;

	// ������ �� ����
	public void update(CenterVO vo) throws Exception;

	// ������ �� ����
	public void delete(int cno) throws Exception;

	// ������ �� ���
	public List<CenterVO> list() throws Exception;

}
