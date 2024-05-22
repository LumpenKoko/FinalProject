package com.kh.mng.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.member.model.dao.MemberDao;
import com.kh.mng.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
}
