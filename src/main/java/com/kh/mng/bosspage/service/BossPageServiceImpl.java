package com.kh.mng.bosspage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.bosspage.model.dao.BossPageDao;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.location.model.vo.Location;

@Service
public class BossPageServiceImpl implements BossPageService{
	
	@Autowired
	private BossPageDao bossPageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Location getLocation(int userNo) {
		return bossPageDao.getLocation(sqlSession, userNo);
	}

	@Override
	public int updatePhoneNumber(BossPage bossPage) {
		return bossPageDao.updatePhonNo(sqlSession, bossPage);
	}

	@Override
	public int updateEmail(BossPage bossPage) {
		return bossPageDao.updateEmail(sqlSession, bossPage);
	}

	@Override
	public int updatePwd(BossPage bossPage) {
		return bossPageDao.updatePwd(sqlSession, bossPage);
	}
	
	@Override
	@Transactional
	public int deleteBossUser(String bossId) {
	    return bossPageDao.deleteBossUser(sqlSession, bossId);
	}
	
}
