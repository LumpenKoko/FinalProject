package com.kh.mng.pet.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}