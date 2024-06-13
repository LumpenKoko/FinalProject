package com.kh.mng.bosspage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.bosspage.model.dao.BossPageDaoSecond;
import com.kh.mng.bosspage.model.dto.CouponKind;

@Service
public class BossPageServiceImplSecond implements BossPageServiceSecond{
	@Autowired
    private BossPageDaoSecond bossPageDaoSecond;

    @Autowired
    private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<CouponKind> selectCouponList(String loginUserNo) {
//		ArrayList<CouponKind> couponList = bossPageDaoSecond.selectCouponList(sqlSession, loginUserNo);
		return bossPageDaoSecond.selectCouponList(sqlSession, loginUserNo);
	}

	@Override
	public int insertCouponKind(CouponKind coupon) {
		String locNo = bossPageDaoSecond.selectLocationNo(sqlSession, coupon);
		coupon.setLocationNo(locNo);
		
		return bossPageDaoSecond.insertCouponKind(sqlSession, coupon);
	}
}
