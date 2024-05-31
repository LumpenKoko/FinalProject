package com.kh.mng.community.service;

import java.util.ArrayList;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.vo.Shorts;

public interface CommunityService {
	
	int selectListCount();

	int addComment(String comment);

	String getVideo(int videoId);

	ArrayList<Shorts> selectShortsList(PageInfo pi);

	int selectShortsCount();
}
