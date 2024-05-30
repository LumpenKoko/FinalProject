package com.kh.mng.pet.service;

import java.util.List;

import com.kh.mng.pet.model.vo.Pet;

public interface PetService {
	
	int insertPet(Pet p);
	
	int updatePet(Pet p);
	
	List<Pet> getPetByUserNo(int userNo);
}
