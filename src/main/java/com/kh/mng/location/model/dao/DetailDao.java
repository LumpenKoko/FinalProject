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

	public DetailLocation selectDetailLocation(SqlSessionTemplate sqlSession,int locationNo) {
	
		return sqlSession.selectOne("location.selectDetailList",locationNo);
	}

	public ArrayList<DetailLocationAttachment> selectMainImg(SqlSessionTemplate sqlSession, int locationNo) {
	  
		return (ArrayList) sqlSession.selectList("attachment.selectMainAttachment",locationNo);
	}
	public ArrayList<DetailLocationAttachment> selectDetailImg(SqlSessionTemplate sqlSession, int locationNo) {
		  
		return (ArrayList) sqlSession.selectList("attachment.selectdetailAttachment",locationNo);
	}

}
