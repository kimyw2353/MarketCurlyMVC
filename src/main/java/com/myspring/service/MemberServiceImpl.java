package com.myspring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.domain.MemberVO;
import com.myspring.mapper.MemberMapper;

@Service(value = "memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public int memberInsert(MemberVO member) {
		
		return this.memberMapper.memberInsert(member);
	}

	@Override
	public MemberVO loginCheck(MemberVO member) {
		MemberVO user = this.findMemberByUserid(member.getUserid());
		
		if(user!=null) {
			if(user.getPwd().equals(member.getPwd())) {
				return user;
			}
		}
		
		return null;
	}

	@Override
	public MemberVO findMemberByUserid(String userid) {
		
		return this.memberMapper.findMemberByUserid(userid);
	}

}





