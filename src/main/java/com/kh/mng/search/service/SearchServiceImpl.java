package com.kh.mng.search.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.common.model.vo.CurrentDate;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.main.model.dao.MainDao;
import com.kh.mng.search.model.dao.SearchDao;
import com.kh.mng.search.model.dto.SearchFilter;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectLocationListCount() {
		return searchDao.selectLocationListCount(sqlSession);
	}

	@Override
	public ArrayList<Location> selectSearchLocationList(String keyword, PageInfo pi) {
		ArrayList<Location> list = searchDao.selectSearchLocationList(sqlSession, keyword, pi);
		// list 해당 petSize
		for (Location loc : list) {
			loc.setCurrentDay(CurrentDate.currentDay()); // 현재 요일 (월 화 수 목 금 토 일 형식)
			loc.setEnterList(new MainDao().selectEnterGradeList(sqlSession, loc));
			loc.setOpTime(searchDao.selectOperationTime(sqlSession, loc));
			loc.setAttachment(new MainDao().selectAttachment(sqlSession, loc));
			loc.setPickCount(searchDao.selectPickCount(sqlSession, loc));
		}
		// list 해당 운영시간
		// 현재 요일 넘겨서 해당 요일 운영시간 가져오기
		// 찜 개수 가져오기
		
		return list;
	}

	@Override
	public ArrayList<Location> selectFilterLocationList(SearchFilter sf, PageInfo pi) {
		ArrayList<Location> list = searchDao.selectFilterLocationList(sqlSession, sf, pi);
		// list 해당 petSize
		for (Location loc : list) {
			loc.setCurrentDay(CurrentDate.currentDay()); // 현재 요일 (월 화 수 목 금 토 일 형식)
			loc.setEnterList(new MainDao().selectEnterGradeList(sqlSession, loc));
			loc.setOpTime(searchDao.selectOperationTime(sqlSession, loc));
			loc.setAttachment(new MainDao().selectAttachment(sqlSession, loc));
			loc.setPickCount(searchDao.selectPickCount(sqlSession, loc));
		}
		// list 해당 운영시간
		// 현재 요일 넘겨서 해당 요일 운영시간 가져오기
		// 찜 개수 가져오기
		
		return list;
	}
	
	@Override
	public int selectUserPick(Location loc) {
		return searchDao.selectUserPick(sqlSession, loc);
	}
}
