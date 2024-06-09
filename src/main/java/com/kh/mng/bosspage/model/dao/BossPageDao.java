package com.kh.mng.bosspage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.location.model.vo.Location;

//@Repository -> 데이터베이스에 접근하기위한 객체
@Repository
public class BossPageDao {
	public Location getLocation(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("location.getLocation", userNo);
	}

	public int updatePhonNo(SqlSessionTemplate sqlSession, BossPage bossPage) {
		return sqlSession.update("memberMapper.updatePhonNo", bossPage);
	}
	
	public int updateEmail(SqlSessionTemplate sqlSession, BossPage bossPage) {
		return sqlSession.update("memberMapper.updateEmail", bossPage);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, BossPage bossPage) {
		
		return sqlSession.update("memberMapper.updatePwd", bossPage);
	}
	
	public int deleteBossUser(SqlSessionTemplate sqlSession, String bossId) {
	    int count = sqlSession.update("memberMapper.deleteBossUser", bossId);
	    return count;
	}
}
