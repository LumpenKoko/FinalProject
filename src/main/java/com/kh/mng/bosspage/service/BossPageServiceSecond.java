package com.kh.mng.bosspage.service;

import java.util.ArrayList;

import com.kh.mng.bosspage.model.dto.CouponKind;

public interface BossPageServiceSecond {
	// 로그인한 회원 넘버에 맞는 장소의 쿠폰 리스트 조회
	ArrayList<CouponKind> selectCouponList(String loginUserNo);
	
	// 쿠폰 추가
	int insertCouponKind(CouponKind coupon);
}
