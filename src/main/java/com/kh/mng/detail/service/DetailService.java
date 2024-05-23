package com.kh.mng.detail.service;

import org.springframework.stereotype.Service;

import com.kh.mng.detail.model.vo.PickedInfo;

@Service
public interface DetailService {

	int pickedStatus(PickedInfo pickedInfo);
	int pickedCount(int spaceNo);
	int insertPicked(PickedInfo pickedInfo);
	int deletePicked(PickedInfo pickedInfo);
	
}
