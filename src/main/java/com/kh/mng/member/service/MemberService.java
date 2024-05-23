package com.kh.mng.member.service;

import com.kh.mng.member.model.vo.Member;

public interface MemberService {

	// 로그인
	Member loginMember(Member m);
	
	// 아이디 중복 확인
	int checkMemberId(String userId);
}
