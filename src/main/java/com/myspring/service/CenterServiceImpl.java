package com.myspring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.domain.CenterVO;
import com.myspring.mapper.CenterMapper;

@Service
public class CenterServiceImpl implements CenterService{

	@Inject
	private CenterMapper centerMapper;
	
	// 작성 
		@Override
		public void write(CenterVO vo) throws Exception {
			centerMapper.write(vo);		
		}
		
		// 조회
		@Override
		public CenterVO read(int bno) throws Exception {
			return centerMapper.read(bno);
		}
		
		// 수정 
		@Override
		public void update(CenterVO vo) throws Exception {
			centerMapper.update(vo);
		}

		// 삭제
		@Override
		public void delete(int bno) throws Exception {
			centerMapper.delete(bno);		
		}
		
		// 목록
		@Override
		public List<CenterVO> list() throws Exception{
			return centerMapper.list();
		}

		
}
