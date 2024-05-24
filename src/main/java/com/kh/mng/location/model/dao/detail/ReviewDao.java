package com.kh.mng.location.model.dao.detail;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.location.model.vo.detail.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> selectReview(SqlSessionTemplate sqlSession,int spaceNo){
		return (ArrayList)sqlSession.selectList("detail.selectDetailReviewList",spaceNo);
	}
}
