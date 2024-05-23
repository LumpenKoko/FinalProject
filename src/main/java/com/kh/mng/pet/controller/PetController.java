package com.kh.mng.pet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.mng.pet.model.vo.Pet;
import com.kh.mng.pet.service.PetService;
import com.kh.mng.pet.service.PetServiceImpl;

@Controller
public class PetController {
	
	private PetService petService = new PetServiceImpl();
	
	@PostMapping("/insertPet.mp")
	public String insertPet(Pet p, HttpSession session, Model model) {
		
		int result = petService.insertPet(p);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "반려동물 등록에 성공하셨습니다.");
			return "myPage/myPagePetInfo";
		} else {
			model.addAttribute("errorMsg", "반려동물 등록에 실패하셨습니다.");
			return "common/errorPage";
		}
	}
}
