package com.kh.mng.location.model.dao.detail;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.location.model.vo.detail.DetailLocation;
import com.kh.mng.location.model.vo.detail.DetailLocationAttachment;
import com.kh.mng.location.model.vo.detail.Review;

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

}
