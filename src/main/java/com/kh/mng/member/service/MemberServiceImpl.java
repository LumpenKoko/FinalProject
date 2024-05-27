package com.kh.mng.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.location.model.vo.Location;
import com.kh.mng.member.model.dao.MemberDao;
import com.kh.mng.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int checkMemberId(String userId) {
		return memberDao.checkMemberId(sqlSession, userId);
	}

	@Override
	public int insertCommonMember(Member m) {
		return memberDao.insertCommonMember(sqlSession, m);
	}

	@Override
	public int insertBossMember(Member m, Location loc) {
		int result1 = memberDao.insertBossMember(sqlSession, m);
		int result2 = 1;
		int userNo = 0;
		
		if (result1 == 1) {
			userNo = memberDao.selectUserNo(sqlSession);
			
			if (userNo != 0) {
				loc.setUserNo(userNo);
				result2 = memberDao.insertLocation(sqlSession, loc);
			} 
		} else {
			result1 = 0;
		}
		
		return result1 * result2;
	}


}
