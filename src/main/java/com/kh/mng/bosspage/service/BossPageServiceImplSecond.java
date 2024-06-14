package com.kh.mng.bosspage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.bosspage.model.dao.BossPageDaoSecond;
import com.kh.mng.bosspage.model.dto.CouponKind;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BossPageServiceImplSecond implements BossPageServiceSecond{
	@Autowired
    private BossPageDaoSecond bossPageDaoSecond;

    @Autowired
    private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<CouponKind> selectCouponKindList(String loginUserNo) {
		return bossPageDaoSecond.selectCouponKindList(sqlSession, loginUserNo);
	}

	@Override
	public int insertCouponKind(CouponKind coupon) {
		int locNo = bossPageDaoSecond.selectLocationNo(sqlSession, coupon);
		coupon.setLocationNo(String.valueOf(locNo));
		return bossPageDaoSecond.insertCouponKind(sqlSession, coupon);
	}

	@Override
	public CouponKind updateCouponKind(CouponKind coupon) {
		int result = bossPageDaoSecond.updateCouponKind(sqlSession, coupon);
		CouponKind newCoupon = null;
		
		if (result > 0) {
			newCoupon = bossPageDaoSecond.selectCouponKind(sqlSession, coupon.getCouponNo());
		} 
		
		return newCoupon;
	}

	@Override
	public int deleteCouponkind(int couponNo) {
		return bossPageDaoSecond.deleteCouponKind(sqlSession, couponNo);
	}
}
