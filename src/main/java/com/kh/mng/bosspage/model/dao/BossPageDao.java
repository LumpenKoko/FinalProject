package com.kh.mng.bosspage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossLocationOption;
import com.kh.mng.bosspage.model.vo.BossPage;


//@Repository -> 데이터베이스에 접근하기위한 객체
@Repository
public class BossPageDao {
	public BossLocation getLocation(SqlSessionTemplate sqlSession, int userNo) {
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
        return sqlSession.update("memberMapper.deactivateBossUser", bossId);
    }

    public int saveLocationInfo(SqlSessionTemplate sqlSession, BossLocation locationInfo) {
        return sqlSession.insert("location.insertLocation", locationInfo);
    }
    
    public int updateLocationInfo(SqlSessionTemplate sqlSession, BossLocation locationInfo) {
        return sqlSession.update("location.updateLocation", locationInfo);
    }
    
    public BossLocationOption getLocationOption(SqlSessionTemplate sqlSession, int locationNo) {
        return sqlSession.selectOne("location.getLocationOption", locationNo);
    }

}
