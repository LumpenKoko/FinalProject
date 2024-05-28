package com.kh.mng.main.service;

import java.util.ArrayList;

import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Location;

public interface MainService {
	// 식당, 카페, 숙소 중 별점이 높은 장소 하나씩 가져옴
	ArrayList<Location> ajaxSelectLocationMainList();
	
	// 커뮤니티의 조회수, 추천수, 댓글수가 많은 글들 5위까지 가져옴
	ArrayList<Board> ajaxSelectBoardMainList(int type);
}
