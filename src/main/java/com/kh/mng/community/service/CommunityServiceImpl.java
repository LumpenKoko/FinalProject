package com.kh.mng.community.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.community.model.dao.CommunityDao;
import com.kh.mng.community.model.vo.TotalShortsInfo;

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
	public int addComment(String comment) {
		return communityDao.addComment(sqlSession, comment);
	}

	@Override
	public TotalShortsInfo getVideoInfo(int videoId) {
		return communityDao.getVideoInfo(sqlSession, videoId);
	}

	@Override
	public int getVideoLikeCount(int shortsNum) {
		return communityDao.getVideoLikeCount(sqlSession, shortsNum);
	}

	@Override
	public int getVideoReplyCount(int shortsNum) {
		return communityDao.getVideoReplyCount(sqlSession, shortsNum);
	}

}

