package com.kh.mng.community.service;

import com.kh.mng.community.model.vo.TotalShortsInfo;

public interface CommunityService {
	
	int selectListCount();

	int addComment(String comment);

	TotalShortsInfo getVideoInfo(int videoId);

	int getVideoLikeCount(int shortsNum);

	int getVideoReplyCount(int shortsNum);
}
