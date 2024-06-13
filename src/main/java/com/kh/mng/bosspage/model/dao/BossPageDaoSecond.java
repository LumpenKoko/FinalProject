package com.kh.mng.bosspage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.dto.CouponKind;

@Repository
public class BossPageDaoSecond {
	public ArrayList<CouponKind> selectCouponList(SqlSessionTemplate sqlSession, String loginUserNo){
		return (ArrayList)sqlSession.selectList("searchMapper.selectCouponList", loginUserNo);
	}
	
	public String selectLocationNo(SqlSessionTemplate sqlSession, CouponKind coupon) {
		return sqlSession.selectOne("searchMapper.selectLocationNo", coupon);
	}

	
	public int insertCouponKind(SqlSessionTemplate sqlSession, CouponKind coupon) {
		return sqlSession.insert("searchMapper.insertCouponKind", coupon);
	}

}
