package com.kh.mng.community.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.community.model.vo.TotalShortsInfo;

@Repository
public class CommunityDao {
	
	public TotalShortsInfo getVideoInfo(SqlSessionTemplate sqlSession, int videoId) {
		return sqlSession.selectOne("shortsMapper.getVideoInfo", videoId);
	}
	
	public int getVideoLikeCount(SqlSessionTemplate sqlSession, int shortsNum) {
		return sqlSession.selectOne("shortsMapper.getVideoLikeCount", shortsNum);
	}

	public int getVideoReplyCount(SqlSessionTemplate sqlSession, int shortsNum) {
		return sqlSession.selectOne("shortsMapper.getVideoReplyCount", shortsNum);
	}

	public int addComment(SqlSessionTemplate sqlSession, String comment) {
		return sqlSession.insert("shortsMapper.shortsCommentEnroll", comment);
	}

	

}
