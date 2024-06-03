package com.kh.mng.pet.service;

import java.util.List;

import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.pet.model.vo.Pet;

public interface PetService {
	
	int insertPet(Pet p);
	
	int updatePet(Pet p);
	
	List<Pet> getPetByUserNo(int userNo);
	
	List<Review> getReviewList(int userNo);
	
	List<Board> getBoardList(int userNo);
}
