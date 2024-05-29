package com.kh.mng.location.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.dto.FileInfo;
import com.kh.mng.location.model.dto.ReplyInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.vo.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession,int spaceNo,PageInfo pi){
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		sqlSession.selectList("review.selectDetailReviewList", spaceNo,rowBounds); //페이징 처리할 정보
		
		return (ArrayList)sqlSession.selectList("review.selectDetailReviewList",spaceNo,rowBounds);
	}

	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return (ArrayList)sqlSession.selectList("review.selectAttachment",reviewNo);
	}
	
     public int insertReview(SqlSessionTemplate sqlSession, ReviewInfo reviewInfo) {
		
		return sqlSession.insert("review.insertReview",reviewInfo);
	}

	public int insertReviewAttachMent(SqlSessionTemplate sqlSession, FileInfo fileInfo) {
		
		return sqlSession.insert("review.insertAttachment",fileInfo);
	}

	public int deleteDao(SqlSessionTemplate sqlSession,ReviewInfo reviewInfo) {
	
		return sqlSession.delete("review.deleteReview",reviewInfo);
	}

	public int selectReviewCount(SqlSessionTemplate sqlSession,int locationNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.reviewCount",locationNo);
	}

	public int selectReply(SqlSessionTemplate sqlSession,ReplyInfo reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review.insertReply",reply);
	}
	
}
