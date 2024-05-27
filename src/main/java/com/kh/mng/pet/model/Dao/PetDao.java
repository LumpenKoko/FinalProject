package com.kh.mng.pet.model.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.pet.model.vo.Pet;

@Repository
public class PetDao {
	public int insertPet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.insert("petMapper.insertPet", p);
	}
	
	public int updatePet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.update("petMapper.updatePet", p);
	}
}
