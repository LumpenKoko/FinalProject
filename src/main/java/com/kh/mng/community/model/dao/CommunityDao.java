package com.kh.mng.community.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.vo.BoardCategory;
import com.kh.mng.community.model.vo.CommunityBoard;
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
		
		return (ArrayList)sqlSession.selectList("communityShortsMapper.communityShortsSelectList",null,rowBounds);
	}

	public Attachment selectOneShortAttachment(SqlSessionTemplate sqlSession,int shortsNo) {
		
		return sqlSession.selectOne("communityShortsMapper.selectOneShortAttachment",shortsNo);
	}

	public int selectShortsCount(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("communityShortsMapper.selectShortsCount");
	}
	
	public ArrayList<CommunityBoard> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int boardCategoryNo) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("communityBoardMapper.selectBoardList",boardCategoryNo,rowBounds);
	}
	
	public int selectBoardCount(SqlSessionTemplate sqlSession, int boardCategoryNo) {
		
		return sqlSession.selectOne("communityBoardMapper.selectBoardCount",boardCategoryNo);
	}
	
	public ArrayList<Attachment> selectBoardAttachMent(SqlSessionTemplate sqlSession,int boardNo) {
	
		return (ArrayList)sqlSession.selectList("communityBoardMapper.selectBoardAttachment",boardNo);
	}

	public int selectBoardApplyCount(SqlSessionTemplate sqlSession,int boardNo) {
		
		return sqlSession.selectOne("communityBoardMapper.selectBoardApplyCount",boardNo);
	}

	public ArrayList<BoardCategory> selectBoardCategoryList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList) sqlSession.selectList("communityBoardMapper.selectBoardCategoryList");
	}




//    public ArrayList<ShortsReply> loadReply(SqlSessionTemplate sqlSession, int shortsNum) {
//		List<ShortsReply> replyList = sqlSession.selectList("shortsMapper.loadReply", shortsNum);
//	    return new ArrayList<>(replyList);
//	}


}
