package com.kh.mng.bosspage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.location.model.vo.Location;

//@Repository -> 데이터베이스에 접근하기위한 객체
@Repository
public class BossPageDao {
	public Location getLocation(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("location.getLocation", userNo);
	}
}
