package com.kh.mng.member.service;

import com.kh.mng.location.model.vo.Location;
import com.kh.mng.member.model.vo.Member;

public interface MemberService {

	// 로그인
	Member loginMember(Member m);
	
	// 아이디 중복 확인
	int checkMemberId(String userId);
	
	// 일반 회원가입
	int insertCommonMember(Member m);
	
	// 사장 회원가입
	int insertBossMember(Member m, Location loc);
}
