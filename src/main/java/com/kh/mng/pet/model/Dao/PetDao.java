package com.kh.mng.pet.model.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.pet.model.vo.Pet;
import com.kh.mng.picture.model.vo.Picture;

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
    
	public int insertPicture(SqlSessionTemplate sqlSession, Picture pic) {
		return sqlSession.insert("pictureMapper.insertPicture", pic);
	}
}
