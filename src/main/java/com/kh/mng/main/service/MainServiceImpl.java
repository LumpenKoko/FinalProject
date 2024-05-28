package com.kh.mng.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.main.model.dao.MainDao;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mainDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Location> ajaxSelectLocationMainList() {
		
		ArrayList<Location> list = new ArrayList<Location>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		for (int i = 1; i <= 3; i++) {
			map.put("locNum", i);
			Location loc = mainDao.selectLocationTop(sqlSession, map);
			loc.setAttachment(mainDao.selectAttachment(sqlSession, loc));
			loc.setEnterList(mainDao.selectEnterGradeList(sqlSession, loc));
			list.add(loc);
			map.remove("locNum");
		}
//		Location restaurant = mainDao.selectLocationTop(sqlSession, locNum1);
//		restaurant.setAtList(mainDao.selectAttachment(sqlSession, restaurant));
//		
//		Location cafe = mainDao.selectLocationTop(sqlSession, locNum2);
//		cafe.setAtList(mainDao.selectAttachment(sqlSession, cafe));
//		
//		Location hotel = mainDao.selectLocationTop(sqlSession, locNum3);
//		hotel.setAtList(mainDao.selectAttachment(sqlSession, hotel));
		return list;
	}

	@Override
	public ArrayList<Board> ajaxSelectBoardMainList(int type) {
		return mainDao.ajaxSelectBoardMainList(sqlSession, type);
	}

}
