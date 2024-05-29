package com.kh.mng.community.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.community.model.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityDao communityDao;
	
	@Autowired
    private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return 0;
	}
	
	@Override
	public String getVideo(int videoId) {
		return communityDao.getVideo(sqlSession, videoId);
	}

	@Override
	public int addComment(String comment) {
		return communityDao.addComment(sqlSession, comment);
	}

}

