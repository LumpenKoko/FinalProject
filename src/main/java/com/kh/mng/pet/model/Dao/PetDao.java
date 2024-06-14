package com.kh.mng.pet.model.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.dto.PetPicture;
import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.pet.model.vo.Pet;

@Repository
public class PetDao {
	public int insertPet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.insert("petMapper.insertPet", p);
	}
	
	public int updatePet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.update("petMapper.updatePet", p);
	}
	
    public List<Pet> getPetByUserNo(SqlSessionTemplate sqlSession, int userNo) {
        return sqlSession.selectList("petMapper.selectPet", userNo);
    }
    
    public List<Review> getReviewList(SqlSessionTemplate sqlSession, int userNo) {
    	return sqlSession.selectList("review.selectMyPageReview", userNo);
    }
    
    public List<Board> getBoardList(SqlSessionTemplate sqlSession, int userNo) {
    	return sqlSession.selectList("communityBoardMapper.getBoardList", userNo);
    }
    
    public int insertPicture(SqlSessionTemplate sqlSession, PetPicture pic) {
    	return sqlSession.insert("attachment.insertPic", pic);
    }
    
    public int deletePet(SqlSessionTemplate sqlSession, Pet p) {
    	return sqlSession.delete("petMapper.deletePet", p);
    }
}
