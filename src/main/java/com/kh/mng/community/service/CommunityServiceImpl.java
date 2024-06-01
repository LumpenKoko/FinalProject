package com.kh.mng.community.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.dao.CommunityDao;
import com.kh.mng.community.model.vo.BoardCategory;
import com.kh.mng.community.model.vo.CommunityBoard;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.model.vo.ShortsReply;
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
	public int addComment(int videoId, String comment) {
		return communityDao.addComment(sqlSession, videoId, comment);
	}

	@Override
	public ArrayList<Shorts> selectShortsList(PageInfo pi) {
		
		ArrayList<Shorts> shorts=communityDao.selectShortsList(sqlSession,pi);
		if(!shorts.isEmpty()) {
			for(Shorts s : shorts) {
				Attachment shortsAttachment=communityDao.selectOneShortAttachment(sqlSession,s.getShortsNo());
				 if(shortsAttachment==null) {
					 shortsAttachment=new Attachment();
					 shortsAttachment.setFilePath("resources/img/default/");
					 shortsAttachment.setChangeName("cat1.jpg");
				 }
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
	
	@Override
	@Transactional
	public ArrayList<CommunityBoard> selectBoardList(PageInfo boardPi,int boardCategoryNo) {
		
		 ArrayList<CommunityBoard> boards=communityDao.selectBoardList(sqlSession,boardPi,boardCategoryNo);
		 if(!boards.isEmpty()) {
			 for(CommunityBoard board:boards) {
				 ArrayList<Attachment> attachment=communityDao.selectBoardAttachMent(sqlSession,board.getBoardNo());
				 if(attachment.isEmpty()) {
					 Attachment defaultAttachMent = new Attachment();
					 defaultAttachMent.setFilePath("resources/img/default/");
					 defaultAttachMent.setChangeName("star.png");
					 attachment.add(defaultAttachMent);
				 }
				 int replyCount =communityDao.selectBoardApplyCount(sqlSession,board.getBoardNo());
				 board.setAttahment(attachment);
				 board.setReplyCount(replyCount);
			 }
		 }
		
		return boards;
	}
	@Override
	public int selectBoardCount(int boardCategoryNo){
		
		return communityDao.selectBoardCount(sqlSession,boardCategoryNo);
	}
	
	@Override
	public ArrayList<BoardCategory> selectBoardCategoryList() {
		
		return communityDao.selectBoardCategoryList(sqlSession);
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

	@Override
     public String getVideo(int videoId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ArrayList<ShortsReply> loadReply(int shortsNum) {
		return communityDao.loadReply(sqlSession, shortsNum);
	}


}

