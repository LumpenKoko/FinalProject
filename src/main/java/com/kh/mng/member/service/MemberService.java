package com.kh.mng.member.service;

import java.util.List;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.community.model.vo.BoardNum;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Picked;
import com.kh.mng.location.model.vo.WishListNo;
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
	
	// 개인정보 수정
	int updateMember(Member m);
	
	// 회원 탈퇴
	int deleteMember(int userNo);
	
	// 공감 목록 불러오기
	List<Picked> getPickList(int userNo);
	
	List<BossLocation> getLocationList();
	
	// 공감 목록 삭제
	int wishListDelete(WishListNo wishListNo);
	
	// 게시글 삭제
	int deleteBoard(int boardNo);
	
	// 리뷰 삭제
	int deleteReview(int reviewNo);
	
	// 쇼츠 불러오기
	List<Shorts> getShortsList(int userNo);
}
