package com.kh.mng.community.service;
import java.util.ArrayList;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.dto.BoardInfo;
import com.kh.mng.community.model.vo.BoardCategory;
import com.kh.mng.community.model.vo.CommunityBoard;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.model.vo.ShortsReply;
import com.kh.mng.community.model.vo.TotalShortsInfo;


public interface CommunityService {
	
	int selectListCount();

	int addComment(int userNo, int videoId, String comment);

	String getVideo(int videoId);

	ArrayList<Shorts> selectShortsList(PageInfo pi);

	int selectShortsCount();
	
	TotalShortsInfo getVideoInfo(int videoId);
	

	int getVideoLikeCount(int shortsNum);

	int getVideoReplyCount(int shortsNum);

	ArrayList<ShortsReply> loadReply(int shortsNum);

	int selectBoardCount(BoardInfo boardInfo);

	ArrayList<CommunityBoard> selectBoardList(PageInfo boardPi, BoardInfo boardInfo);

	ArrayList<BoardCategory> selectBoardCategoryList();

	int getShortsNum(int videoId);


}
