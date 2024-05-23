package com.kh.mng.detail.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.detail.model.dao.PickedDao;
import com.kh.mng.detail.model.vo.PickedInfo;

@Service
public class DetailServiceImpl implements DetailService {
	
	private SqlSessionTemplate sqlSession;
	private PickedDao pickedDao;
	 
	@Autowired
	public  DetailServiceImpl (SqlSessionTemplate sqlSession,PickedDao picked) {
		this.sqlSession=sqlSession;
		this.pickedDao=picked;
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

}
