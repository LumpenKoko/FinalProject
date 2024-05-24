package com.kh.mng.location.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.mng.location.model.vo.detail.DetailLocation;
import com.kh.mng.location.model.vo.detail.Location;
import com.kh.mng.location.model.vo.detail.PickedInfo;
import com.kh.mng.location.model.vo.detail.Review;

@Service
public interface DetailService {

	int pickedStatus(PickedInfo pickedInfo);
	int pickedCount(int spaceNo);
	int insertPicked(PickedInfo pickedInfo);
	int deletePicked(PickedInfo pickedInfo);
	DetailLocation selectDetailLocation(int spaceNo);
	ArrayList<Review> selectDetailReviewList(int spaceNo);
}
