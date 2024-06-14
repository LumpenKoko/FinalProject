package com.kh.mng.bosspage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.dto.CouponKind;

@Repository
public class BossPageDaoSecond {
	public ArrayList<CouponKind> selectCouponKindList(SqlSessionTemplate sqlSession, String loginUserNo){
		return (ArrayList)sqlSession.selectList("searchMapper.selectCouponKindList", loginUserNo);
	}
	
	public int selectLocationNo(SqlSessionTemplate sqlSession, CouponKind coupon) {
		return sqlSession.selectOne("searchMapper.selectLocationNo", coupon);
	}
	
	public int insertCouponKind(SqlSessionTemplate sqlSession, CouponKind coupon) {
		return sqlSession.insert("searchMapper.insertCouponKind", coupon);
	}

	public int updateCouponKind(SqlSessionTemplate sqlSession, CouponKind coupon) {
		return sqlSession.update("searchMapper.updateCouponKind", coupon);
	}
	
	public CouponKind selectCouponKind(SqlSessionTemplate sqlSession, int couponNo) {
		return sqlSession.selectOne("searchMapper.selectCouponKind", couponNo);
	}
	
	public int deleteCouponKind(SqlSessionTemplate sqlSession, int couponNo) {
		return sqlSession.update("searchMapper.deleteCouponKind", couponNo);
	}
}
