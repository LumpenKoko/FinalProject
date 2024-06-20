package com.kh.mng.pet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mng.common.model.dto.PetPicture;
import com.kh.mng.common.model.vo.ProfileImg;
import com.kh.mng.member.model.vo.Member;
import com.kh.mng.pet.model.vo.Pet;
import com.kh.mng.pet.service.PetService;

@Controller
public class PetController {

	@Autowired
	private PetService petService;

	@RequestMapping("insertPet.mp")
	public String insertPet(PetPicture pic, Pet p, MultipartFile upfile, HttpSession session, Model model) {
	    // 세션에서 로그인한 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    // 로그인한 사용자 정보에서 사용자 번호 가져오기
	    int userNo = loginUser.getUserNo();

	    // 사용자 번호를 Member 객체에 설정
	    p.setUserNo(userNo);
	    pic.setUserNo(userNo);
	    pic.setPetNo(p.getPetNo());
	    System.out.println(pic);
	    // 파일 업로드
	    if (upfile != null && !upfile.getOriginalFilename().equals("")) {
	        String changeName = saveFile(upfile, session);

	        // 이미지 정보에 변경된 파일 이름 설정
	        pic.setOriginName(upfile.getOriginalFilename());
	        pic.setChangeName("resources/uploadFiles/" + changeName);
	        pic.setPetNo(p.getPetNo());
	    } else {
	        // 파일이 업로드되지 않은 경우에도 originName을 설정해야 함
	        pic.setOriginName("");
	        pic.setChangeName("");
	        pic.setFilePath("");
	    }

	    // 반려동물 정보 저장
	    int result = petService.insertPet(p);
	    int picResult = petService.insertPicture(pic);

	    if (result > 0 && picResult > 0) {
	        session.setAttribute("alertMsg", "반려동물 등록에 성공하셨습니다.");
	    } else {
	        model.addAttribute("errorMsg", "반려동물 등록에 실패하셨습니다.");
	    }

	    return "redirect:/myPagePetInfo.mp";
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {
	    // 파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
	    String originName = upfile.getOriginalFilename();

	    // 년월일시분초
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

	    // 5자리 랜덤값
	    int ranNum = (int) (Math.random() * 90000) + 10000;

	    // 확장자
	    String ext = originName.substring(originName.lastIndexOf("."));

	    // 수정된 첨부파일명
	    String changeName = currentTime + ranNum + ext;

	    // 첨부파일을 저장할 폴더의 물리적 경로(session)
	    String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

	    try {
	        upfile.transferTo(new File(savePath + changeName));
	    } catch (IllegalStateException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return changeName;
	}
	
	@PostMapping(value = "updatePet.mp")
	public String updatePet(Pet p, HttpSession session) {
		// 세션에서 로그인한 사용자 정보 가져오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인한 사용자 정보에서 사용자 번호 가져오기
		int userNo = loginUser.getUserNo();
		// 사용자 번호를 Member 객체에 설정
		p.setUserNo(userNo);

		int result = petService.updatePet(p);
		System.out.println(p);
		if (result > 0) {
			session.setAttribute("pet", p); // 여기서 p 대신에 pet 객체를 세션에 추가해야 합니다.
			session.setAttribute("alertMsg", "반려동물 정보 수정 성공");
			return "redirect:/myPagePetInfo.mp";
		} else {
		    session.setAttribute("errorMsg", "반려동물 정보 수정 실패");
			return "redirect:/myPagePetInfo.mp";
		}
	}

	@ResponseBody
	@GetMapping("deletePet.mp")
	public String deletePet(Pet p, HttpSession session, Model model) {
		int result = petService.deletePet(p);
		System.out.println(p.getPetNo());
		if (result > 0) {
			return "성공";
		} else {
			return "실패";
		}
	}
	
	@ResponseBody
	@PostMapping("/insertPetImg.mp")
	public String insertOrUpdateProfileImg(@RequestParam("profileImage") MultipartFile upfile, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    int userNo = loginUser.getUserNo();
	    
	    Pet pet = (Pet)session.getAttribute("pet");
	    int petNo = pet.getPetNo();
	    
	    // 이미지 정보를 데이터베이스에서 가져오기
	    ProfileImg existingProfileImg = petService.getPetImg(petNo);
	    
	    System.out.println(existingProfileImg);
	    // 새로 업로드된 파일 처리
	    if (!upfile.isEmpty()) {
	        String changeName = saveFile(upfile, session);
	        
	        ProfileImg profileImg = new ProfileImg();
	        profileImg.setOriginName(upfile.getOriginalFilename());
	        profileImg.setChangeName(changeName);
	        profileImg.setUserNo(userNo);
	        profileImg.setFilePath("resources/img/user/");
	        profileImg.setFileLevel(0);
	        
	        // 이미 등록된 이미지가 있으면 update 수행
	        if (existingProfileImg != null) {
	            profileImg.setPicNo(existingProfileImg.getPicNo());
	            int updateResult = petService.updatePetImg(profileImg);
	            
	            if (updateResult > 0) {
	            	pet.setPetImg(profileImg);
	            	session.setAttribute("pet", pet);
	                return "NNNNY"; // Update 성공 시 반환할 메시지
	            } else {
	                return "NNNNN"; // Update 실패 시 반환할 메시지
	            }
	        } else {
	            // 등록된 이미지가 없으면 insert 수행
	            int insertResult = petService.insertPetImg(profileImg);
	            
	            if (insertResult > 0) {
	            	pet.setPetImg(profileImg);
	            	session.setAttribute("pet", pet);
	                return "NNNNY"; // Insert 성공 시 반환할 메시지
	            } else {
	                return "NNNNN"; // Insert 실패 시 반환할 메시지
	            }
	        }
	    }
	    
	    return "NNNNN"; // 파일이 없을 경우 반환할 메시지
	}
	
	public String petFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
				String originName = upfile.getOriginalFilename();
				
				//년월일시분초 
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
				//5자리 랜덤값
				int ranNum = (int)(Math.random() * 90000) + 10000;
				
				//확장자
				String ext = originName.substring(originName.lastIndexOf("."));
				
				//수정된 첨부파일명
				String changeName = currentTime + ranNum + ext;
				
				//첨부파일을 저장할 폴더의 물리적 경로(session)
				String savePath = session.getServletContext().getRealPath("resources/img/user/");
				try {
					upfile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return changeName;
		
	}
}
