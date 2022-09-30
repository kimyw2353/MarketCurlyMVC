package com.myspring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.domain.MemberVO;
import com.myspring.domain.NotMemberException;
import com.myspring.mapper.UserMapper;
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper userMapper;
	
	@Override
	public int insertMember(MemberVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO loginCheck(MemberVO user) throws NotMemberException {
			MemberVO dbUser=this.findMemberByUserid(user.getUserid());
			if(dbUser!=null) {
				//���̵� �ִٸ�
				if(! user.getPwd().equals(dbUser.getPwd())) {
					throw new NotMemberException("��й�ȣ�� ��ġ���� �ʾƿ�");
				}
				
			}
			return dbUser;
	}

	@Override
	public MemberVO findMemberByUserid(String userid) throws NotMemberException {
		
		MemberVO user= this.userMapper.findMemberByUserid(userid);
		if(user==null) {
			throw new NotMemberException("�������� �ʴ� ���̵��Դϴ�");
			
		}
		return user;
	}
	@Override
	public boolean idCheck(String userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberVO> getAllMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public MemberVO findMemberByIdx(Integer idx) {
		return userMapper.findMemberByIdx(idx);
	}

	@Override
	public List<MemberVO> findMember(String colType, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int editMember(MemberVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(Integer idx) {
		// TODO Auto-generated method stub
		return 0;
	}

}
