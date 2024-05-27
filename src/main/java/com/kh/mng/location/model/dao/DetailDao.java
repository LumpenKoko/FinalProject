package com.kh.mng.location.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.location.model.dto.FileInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.vo.DetailLocation;
import com.kh.mng.location.model.vo.DetailLocationAttachment;


@Repository
public class DetailDao {

	public DetailLocation selectDetailLocation(SqlSessionTemplate sqlSession,int spaceNo) {
	
		return sqlSession.selectOne("location.selectDetailList",spaceNo);
	}

	public ArrayList<DetailLocationAttachment> selectMainImg(SqlSessionTemplate sqlSession, int spaceNo) {
	  
		return (ArrayList) sqlSession.selectList("attachment.selectMainAttachment",spaceNo);
	}
	public ArrayList<DetailLocationAttachment> selectDetailImg(SqlSessionTemplate sqlSession, int spaceNo) {
		  
		return (ArrayList) sqlSession.selectList("attachment.selectdetailAttachment",spaceNo);
	}

	public int insertReview(SqlSessionTemplate sqlSession, ReviewInfo reviewInfo) {
		
		return sqlSession.insert("review.insertReview",reviewInfo);
	}

	public int insertReviewAttachMent(SqlSessionTemplate sqlSession, FileInfo fileInfo) {
		
		return sqlSession.insert("review.insertAttachment",fileInfo);
	}
	

}
