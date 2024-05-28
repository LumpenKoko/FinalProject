package com.kh.mng.location.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.vo.DetailLocation;
import com.kh.mng.location.model.vo.DetailLocationAttachment;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Review;

@Service
public interface LocationService {

	int pickedStatus(PickedInfo pickedInfo);
	int pickedCount(int spaceNo);
	int insertPicked(PickedInfo pickedInfo);
	int deletePicked(PickedInfo pickedInfo);
	DetailLocation selectDetailLocation(int spaceNo);
	ArrayList<Review> selectDetailReviewList(int spaceNo);
	ArrayList<DetailLocationAttachment> selectDetailMainImg(int spaceNo);
	ArrayList<DetailLocationAttachment> selectDetailDetailImg(int spaceNo);
	int insertReview(ReviewInfo reviewInfo, Map<String,String> changeNamesList,String path);
}
