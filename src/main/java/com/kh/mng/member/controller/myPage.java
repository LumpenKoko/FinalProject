package com.kh.mng.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Picked;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.location.model.vo.WishListNo;
import com.kh.mng.member.model.vo.Member;
import com.kh.mng.member.service.MemberService;
import com.kh.mng.pet.model.vo.Pet;
import com.kh.mng.pet.service.PetService;

@Controller
public class myPage {

	@Autowired
	private PetService petService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/myPageMain.mp")
	public String myPageMain(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			List<Review> ReviewList = petService.getReviewList(userNo);
			model.addAttribute("ReviewList", ReviewList);
			System.out.println(ReviewList);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				model.addAttribute("petList", petList);
				return "myPage/myPageMain"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPageMain"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "myPage/myPageMain"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

	@GetMapping("/myPageWish.mp")
	public String myPageWishList(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			List<Picked> pickList = memberService.getPickList(userNo);
			List<Location> locationList = memberService.getLocationList();

			List<Location> wishList = new ArrayList<>();
			for (Picked picked : pickList) {
				for (Location location : locationList) {
					if (picked.getLocationNo() == location.getLocationNo()) {
						wishList.add(location);
					}
				}
			}
			System.out.println(wishList);
			session.setAttribute("wishList", wishList);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				model.addAttribute("petList", petList);
				return "myPage/myPageWishList"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPageWishList"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "myPage/myPageWishList"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

	@ResponseBody
	@GetMapping("/wishListDelete")
	public String wishListDelete(@RequestParam int locationNo, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		 List<Location> wishList = (List<Location>) session.getAttribute("wishList");
		 Location deleteList = null;
		for (Location location : wishList) {
			if(location.getLocationNo() == locationNo) {
				deleteList = location;
				break;
			}
		}
		WishListNo wishListNo = new WishListNo();
		wishListNo.setLocationNo(locationNo);
		wishListNo.setUserNo(userNo);
		int result = memberService.wishListDelete(wishListNo);
		if (result > 0) {
			wishList.remove(deleteList);
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}

	@GetMapping("/myPageCoupon.mp")
	public String myPageCoupon(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				model.addAttribute("petList", petList);
				return "myPage/myPageCoupon"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPageCoupon"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "myPage/myPageCoupon"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

	@GetMapping("/myPageBoard.mp")
	public String myPageBoardList(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			List<Board> BoardList = petService.getBoardList(userNo);
			model.addAttribute("BoardList", BoardList);
			System.out.println(BoardList);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				model.addAttribute("petList", petList);
				return "myPage/myPageBoardList"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPageBoardList"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "myPage/myPageBoardList"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

	@GetMapping("/myPageShorts.mp")
	public String myPageShortsList(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				model.addAttribute("petList", petList);
				return "myPage/myPageShortsList"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPageShortsList"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "myPage/myPageShortsList"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

	@GetMapping("myPageInfo.mp")
	public String myPageInfo(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				model.addAttribute("petList", petList);
				return "myPage/myPageInfo"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPageInfo"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "myPage/myPageInfo"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

//	@GetMapping("myPagePetInfo.mp")
//	public String myPagePetInfo() {
//		return "myPage/myPagePetInfo";
//	}

	@GetMapping("myPagePetInfo.mp")
	public String myPagePetInfo(Model model, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보를 가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			int userNo = loginUser.getUserNo(); // 사용자 번호
			// 사용자 번호를 사용하여 펫 데이터를 불러옴
			List<Pet> petList = petService.getPetByUserNo(userNo);
			if (petList != null) {
				// 펫 데이터를 모델에 추가하여 HTML에 전달
				session.setAttribute("petList", petList);
				return "myPage/myPagePetInfo"; // 펫 정보를 수정하는 페이지로 이동
			} else {
				// 펫 데이터가 없는 경우
				return "myPage/myPagePetInfo"; // 펫 정보 페이지로 이동
			}
		} else {
			// 세션에 사용자 정보가 없는 경우
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "member/memberLogin"; // 로그인 페이지로 이동 또는 에러 메시지 표시
		}
	}

	@GetMapping("myPagePetSignUp.mp")
	public String myPagePetSignUp() {
		return "myPage/myPagePetSignUp";
	}

	@ResponseBody
	@GetMapping("deleteMember.mp")
	public String deleteMember(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		int result = memberService.deleteMember(userNo);
		System.out.println(userNo);
		if (result > 0) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
}
