package com.kh.mng.pet.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.common.model.dto.PetPicture;
import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.pet.model.Dao.PetDao;
import com.kh.mng.pet.model.vo.Pet;

@Service
public class PetServiceImpl implements PetService {
    
    @Autowired
    private PetDao petDao;
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public int insertPet(Pet p) {
        return petDao.insertPet(sqlSession, p);
    }

	@Override
	public int updatePet(Pet p) {
		return petDao.updatePet(sqlSession, p);
	}

	@Override
	public List<Pet> getPetByUserNo(int userNo) {
		return petDao.getPetByUserNo(sqlSession, userNo);
	}

	@Override
	public List<Review> getReviewList(int userNo) {
		return petDao.getReviewList(sqlSession, userNo);
	}

	@Override
	public List<Board> getBoardList(int userNo) {
		return petDao.getBoardList(sqlSession, userNo);
	}

	@Override
	public int insertPicture(PetPicture pic) {
		return petDao.insertPicture(sqlSession, pic);
	}

	@Override
	public int deletePet(Pet p) {
		return petDao.deletePet(sqlSession, p);
	}
}