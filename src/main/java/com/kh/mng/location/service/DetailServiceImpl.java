package com.kh.mng.location.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.location.model.dao.detail.DetailDao;
import com.kh.mng.location.model.dao.detail.PickedDao;
import com.kh.mng.location.model.vo.detail.DetailLocation;
import com.kh.mng.location.model.vo.detail.Location;
import com.kh.mng.location.model.vo.detail.PickedInfo;
import com.kh.mng.location.model.vo.detail.Review;

@Service
public class DetailServiceImpl implements DetailService {
	
	private SqlSessionTemplate sqlSession;
	private PickedDao pickedDao;
	private DetailDao detailDao;
	 
	@Autowired
	public  DetailServiceImpl (SqlSessionTemplate sqlSession,
			PickedDao picked,DetailDao detailDao) {
		this.sqlSession=sqlSession;
		this.pickedDao=picked;
		this.detailDao=detailDao;
	}
	
	@Override
	public int pickedStatus(PickedInfo pickedInfo) {
		return pickedDao. pickedStatus(sqlSession,pickedInfo);
	}

	@Override
	public int pickedCount(int spaceNo) {
		return pickedDao.pickedCount(sqlSession,spaceNo);
	}

	@Override
	public int insertPicked(PickedInfo pickedInfo) {
		return pickedDao.insertPicked(sqlSession,pickedInfo);
	}

	@Override
	public int deletePicked(PickedInfo pickedInfo) {
		return pickedDao.deletePicked(sqlSession,pickedInfo);
	}

	@Override
	public DetailLocation selectDetailLocation(int spaceNo) {
		
		return detailDao.selectDetailLocation(sqlSession,spaceNo);
	}

	@Override
	public ArrayList<Review> selectDetailReviewList(int spaceNo) {
		// TODO Auto-generated method stub
		return detailDao.selectDetailReviewList(sqlSession,spaceNo);
	}

}
