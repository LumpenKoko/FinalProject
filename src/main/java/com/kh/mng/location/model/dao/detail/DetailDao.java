package com.kh.mng.location.model.dao.detail;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.location.model.vo.detail.DetailLocation;
import com.kh.mng.location.model.vo.detail.Review;

@Repository
public class DetailDao {

	public DetailLocation selectDetailLocation(SqlSessionTemplate sqlSession,int spaceNo) {
	
		return sqlSession.selectOne("location.selectDetailList",spaceNo);
	}

	public ArrayList<Review> selectDetailReviewList(SqlSessionTemplate sqlSession, int spaceNo) {
	  
		return (ArrayList) sqlSession.selectList("review.selectDetailReviewList",spaceNo);
	}

}
