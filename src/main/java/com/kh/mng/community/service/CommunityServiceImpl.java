package com.kh.mng.community.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.dao.CommunityDao;

import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.model.vo.TotalShortsInfo;
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
	public ArrayList<Shorts> selectShortsList(PageInfo pi) {
		
		ArrayList<Shorts> shorts=communityDao.selectShortsList(sqlSession,pi);
		if(!shorts.isEmpty()) {
			for(Shorts s : shorts) {
				Attachment shortsAttachment=communityDao.selectOneShortAttachment(sqlSession,s.getShortsNo());
				s.setAttachment(shortsAttachment);
			}
		}
		
		return shorts;
	}

	@Override
	public int selectShortsCount() {
		
		int count =communityDao.selectShortsCount(sqlSession);
		return count;
	}
	
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

	@Override

	public String getVideo(int videoId) {
		// TODO Auto-generated method stub
		return null;
	}


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

