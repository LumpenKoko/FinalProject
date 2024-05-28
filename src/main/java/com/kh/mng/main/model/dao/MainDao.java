package com.kh.mng.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.location.model.vo.EnterGrade;
import com.kh.mng.location.model.vo.Location;

@Repository
public class MainDao {
	public Location selectLocationTop(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("mainMapper.selectLocationTop", map);
	}

//	public Location selectRestaurantTop(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("mainMapper.selectRestaurantTop");
//	}
//	
//	public Location selectCafeTop(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("mainMapper.selectCafeTop");
//	}
//	
//	public Location selectHotelTop(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("mainMapper.selectHotelTop");
//	}
	
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Location loc) {
		return sqlSession.selectOne("mainMapper.selectAttachment", loc);
	}
	
	public ArrayList<EnterGrade> selectEnterGradeList(SqlSessionTemplate sqlSession, Location loc) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectEnterGradeList", loc);
	}
	

}
