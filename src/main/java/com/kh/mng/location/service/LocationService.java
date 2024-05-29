package com.kh.mng.location.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.vo.DetailLocation;
import com.kh.mng.location.model.vo.DetailLocationAttachment;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Review;

@Service
public interface LocationService {

	int pickedStatus(PickedInfo pickedInfo);
	int pickedCount(int locationNo);
	int insertPicked(PickedInfo pickedInfo);
	int deletePicked(PickedInfo pickedInfo);
	DetailLocation selectDetailLocation(int locationNo);
	ArrayList<Review> selectDetailReviewList(int locationNo,PageInfo pi);
	ArrayList<DetailLocationAttachment> selectDetailMainImg(int locationNo);
	ArrayList<DetailLocationAttachment> selectDetailDetailImg(int locationNo);
	int insertReview(ReviewInfo reviewInfo, Map<String,String> changeNamesList,String path);
	int deleteReview(ReviewInfo reveiwInfo);
	int selectReviewCount(int locationNo);
}
