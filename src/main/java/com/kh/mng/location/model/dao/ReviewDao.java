package com.kh.mng.location.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.location.model.vo.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession,int spaceNo){
		return (ArrayList)sqlSession.selectList("review.selectDetailReviewList",spaceNo);
	}
}
