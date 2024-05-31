package com.kh.mng.community.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.model.vo.ShortsReply;
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

	public int addComment(SqlSessionTemplate sqlSession, int videoId, String comment) {
		return sqlSession.insert("shortsMapper.shortsCommentEnroll", videoId);
	}


	public ArrayList<Shorts> selectShortsList(SqlSessionTemplate sqlSession,PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("communityMapper.communitySelectList",null,rowBounds);
	}

	public Attachment selectOneShortAttachment(SqlSessionTemplate sqlSession,int shortsNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("communityMapper.selectOneShortAttachment",shortsNo);
	}

	public int selectShortsCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("communityMapper.selectShortsCount");
	}

	public ArrayList<ShortsReply> loadReply(SqlSessionTemplate sqlSession, int shortsNum) {
		List<ShortsReply> replyList = sqlSession.selectList("shortsMapper.loadReply", shortsNum);
	    return new ArrayList<>(replyList);
	}

	

}
