package com.kh.mng.community.service;

public interface CommunityService {
	
	int selectListCount();

	int addComment(String comment);

	String getVideo(int videoId);
}
