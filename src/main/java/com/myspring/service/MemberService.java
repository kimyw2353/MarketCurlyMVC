package com.myspring.service;

import com.myspring.domain.MemberVO;

public interface MemberService {

	int memberInsert(MemberVO member);
	
	MemberVO loginCheck(MemberVO member);
	
	MemberVO findMemberByUserid(String userid);
	
}
