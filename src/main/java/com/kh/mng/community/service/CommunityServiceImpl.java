package com.kh.mng.community.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.dao.CommunityDao;
import com.kh.mng.community.model.dto.BoardInfo;
import com.kh.mng.community.model.dto.ShorstInfo;
import com.kh.mng.community.model.dto.ShortsFileInfo;
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
	public int addComment(int userNo, int shortsNo, String comment) {
		return communityDao.addComment(sqlSession, userNo, shortsNo, comment);
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
	public ArrayList<CommunityBoard> selectBoardList(PageInfo boardPi,BoardInfo boardInfo) {
		
		 ArrayList<CommunityBoard> boards=communityDao.selectBoardList(sqlSession,boardPi,boardInfo);
		 if(!boards.isEmpty()) {
			 for(CommunityBoard board:boards) {
				 ArrayList<Attachment> attachment=communityDao.selectBoardAttachMent(sqlSession,board.getBoardNo());
				 Attachment userProfile=communityDao.selectUserProfile(sqlSession,board.getUserNo());
				 if(attachment.isEmpty()) {
					 Attachment defaultAttachMent = new Attachment();
					 defaultAttachMent.setFilePath("resources/img/default/");
					 defaultAttachMent.setChangeName("star.png");
					 attachment.add(defaultAttachMent);
				 }
				 
				 if(userProfile==null) {
					 userProfile=new Attachment();
					 userProfile.setFilePath("resources/img/default/");
					 userProfile.setChangeName("star.png");
				 }
				 
				 int replyCount =communityDao.selectBoardApplyCount(sqlSession,board.getBoardNo());
				 board.setAttahment(attachment);
				 board.setReplyCount(replyCount);
				 board.setUserProfile(userProfile);
			 }
		 }
		
		return boards;
	}
	
	
	@Override
	public int selectBoardCount(BoardInfo boardInfo){
		
		return communityDao.selectBoardCount(sqlSession,boardInfo);
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
	@Transactional
	public int insertShorts(Map<String,ShortsFileInfo> fileInfos, ShorstInfo shortsInfo) {
	
		int count=communityDao.insertShortContents(sqlSession,shortsInfo);
		int count1=1;
		
		if(count>0) {
			
			if(!fileInfos.isEmpty()) {
				for(Map.Entry<String, ShortsFileInfo> files :fileInfos.entrySet()) {
					if(files.getKey().contains("video")) {
						count1=communityDao.insertShortsVideo(sqlSession,files.getValue());
					}
					if(files.getKey().contains("image")) {
						count1=communityDao.insertShortsAttachment(sqlSession,files.getValue());
					}
					count1*=count1;
				}
			
			}
			else {
				ShortsFileInfo defaultImg= new ShortsFileInfo();
				defaultImg.setFilePath("resources/img/default/");
				defaultImg.setChangeName("defaultImg.png");
				
				count1=communityDao.insertShortsAttachment(sqlSession,defaultImg);
			}
			
		}
		
		return count*count1;
	}


	@Override
     public String getVideo(int videoId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ArrayList<ShortsReply> loadReply(int shortsNum) {
//		return communityDao.loadReply(sqlSession, shortsNum);
		return null;
	}


	@Override
	public int getShortsNum(int videoId) {
		return communityDao.getShortsNum(sqlSession, videoId);
	}



}

