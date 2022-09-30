package com.myspring.mapper;

import com.myspring.domain.MemberVO;

public interface MemberMapper {
	int memberInsert(MemberVO member);
	
	MemberVO loginCheck(MemberVO member);
	
	MemberVO findMemberByUserid(String userid);

}
