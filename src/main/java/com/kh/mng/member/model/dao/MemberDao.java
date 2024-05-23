package com.kh.mng.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.member.model.vo.Member;

@Repository
public class MemberDao {
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int checkMemberId(SqlSessionTemplate sqlSession, String checkId) {
//		Member m = new Member();
//		m.setUserId(userId);
//		userId는 이미 Member의 result값으로 받겠다고 하니까 userId로 동일하게 넣으면 파라미터 값이 없다고 오류가 뜨는 것 같다
//		SELECT USER_ID 하면 자료형이 String이니까 resultType int로 못 받지...
		return sqlSession.selectOne("memberMapper.checkMemberId", checkId);
	}

}
