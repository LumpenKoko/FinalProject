package com.kh.mng.bosspage.service;

import java.util.ArrayList;

import com.kh.mng.bosspage.model.dto.CouponKind;
import com.kh.mng.common.phonesms.PhoneSmsVo;
import com.kh.mng.community.model.dto.BoardEnroll;
import com.kh.mng.community.model.dto.BoardFileInfo;

public interface BossPageServiceSecond {
	// 로그인한 회원 넘버에 맞는 장소의 쿠폰 리스트 조회
	ArrayList<CouponKind> selectCouponKindList(String loginUserNo);
	
	// 쿠폰 추가
	int insertCouponKind(CouponKind coupon);
	
	// 쿠폰 수정
	CouponKind updateCouponKind(CouponKind coupon);
	
	// 쿠폰 삭제
	int deleteCouponkind(int couponNo);
	
	// 게시글 등록
	int insertBoard(BoardEnroll board, BoardFileInfo boardFile);
	
	// 암호화된 6자리 랜덤 숫자 저장
	int insertCertifyNumber(PhoneSmsVo psv);
}
