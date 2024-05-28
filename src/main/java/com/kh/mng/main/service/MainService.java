package com.kh.mng.main.service;

import java.util.ArrayList;

import com.kh.mng.location.model.vo.Location;

public interface MainService {
	// 식당, 카페, 숙소 중 별점과 찜수가 높은 장소 하나씩 가져옴
	ArrayList<Location> ajaxSelectLocationMainList();
}
