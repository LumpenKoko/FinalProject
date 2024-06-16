package com.kh.mng.bosspage.controller;

import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;
import com.kh.mng.bosspage.service.BossPageService;
import com.kh.mng.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class bossPageController {

    @Autowired
    private BossPageService bossPageService;
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;

    @RequestMapping("bossMainPage.bm")
    public String bossPrivacy(Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser != null) {
            int userNo = loginUser.getUserNo();

            BossLocation location = bossPageService.getLocationInfo(userNo);

            model.addAttribute("location", location);
            model.addAttribute("userNo", userNo);

            return "bosspage/bossmainpage"; 
        } else {
            return "redirect:/";
        }
    }
    
    @ResponseBody
    @PostMapping(value="/updatePhoneNumber.bm", produces="text/plain;charset=UTF-8")
    public String updatePhoneNumber(BossPage bossPage, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
           int count= bossPageService.updatePhoneNumber(bossPage);
           if(count > 0) {
               return "전화번호 업데이트 성공";
           } else {
               return "전화번호 업데이트 실패"; 
           }
        }
        return "로그인이 필요합니다.";
    }
    
    @ResponseBody
    @PostMapping(value="/updateEmail.bm", produces="text/plain;charset=UTF-8")
    public String updateEmail(BossPage bossPage, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            int count = bossPageService.updateEmail(bossPage);
            if(count > 0) {
                return "이메일 업데이트 성공";
            } else {
                return "이메일 업데이트 실패";
            }
        }
        return "로그인이 필요합니다.";
    }

    @ResponseBody
    @PostMapping(value="/updatePwd.bm", produces="text/plain;charset=UTF-8")
    public String updatePwd(BossPage bossPage, HttpSession session) {
        String encPwd = bcryptPasswordEncoder.encode(bossPage.getBossPwd());
        bossPage.setBossPwd(encPwd);
        
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            int count = bossPageService.updatePwd(bossPage);
            if(count > 0) {
                return "비밀번호 변경에 성공였습니다.";
            } else {
                return "비밀번호 변경에 실패 하였습니다.";
            }
        }
        return "로그인이 필요합니다.";
    }

    @ResponseBody
    @PostMapping(value="deleteBossUser.bm", produces ="application/json; charset=utf-8")
    public String deleteBossUse(BossPage bossPage, HttpSession session) {
        String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
        String bossId= ((Member)session.getAttribute("loginUser")).getUserId();
        
        if (bcryptPasswordEncoder.matches(bossPage.getBossPwd(), encPwd)) {
            int result = bossPageService.deleteBossUser(bossId);
            
            if(result > 0) {
                session.removeAttribute("loginUser");
                return "YYYY";
            } else {
                return "NNNN";
            }
        } else {
            return "RRRR";
        }
    }

    @RequestMapping(value = "bossManuBar.bm")
    public String bossManuBar() {
        return "bosspage/bossmanubar";
    }

    @RequestMapping("bossLocation.bl")
    public String bossLocation(Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser != null) {
            int userNo = loginUser.getUserNo();

            BossLocation location = bossPageService.getLocationInfo(userNo);

            model.addAttribute("location", location);
            model.addAttribute("userNo", userNo);

            return "bosspage/bosslocation"; 
        } else {
            return "redirect:/";
        }
    }
    
 // 장소 정보 업데이트
    @ResponseBody
    @PostMapping(value = "/saveLocationInfo.bm", produces = "application/json; charset=UTF-8")
    public Map<String, Object> saveLocationInfo(@RequestBody Map<String, Object> payload, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            int userNo = loginUser.getUserNo();

            BossLocation locationInfo = new BossLocation();
            locationInfo.setUserNo(userNo);
            locationInfo.setLocationPhone((String) payload.get("locationPhone"));
            locationInfo.setExplanation((String) payload.get("explanation"));
            locationInfo.setReservationLink((String) payload.get("reservationLink"));

            BossLocation existingLocation = bossPageService.getLocationInfo(userNo);
            int result;
            if (existingLocation != null) {
                locationInfo.setLocationNo(existingLocation.getLocationNo());
                result = bossPageService.updateLocationInfo(locationInfo);
            } else {
                result = bossPageService.saveLocationInfo(locationInfo);
            }

            List<Map<String, Object>> operationTimesData = (List<Map<String, Object>>) payload.get("operationTimes");
            List<LocationOperationTime> operationTimes = new ArrayList<>();
            for (Map<String, Object> operationTimeData : operationTimesData) {
                LocationOperationTime operationTime = new LocationOperationTime();
                operationTime.setLocationNo(locationInfo.getLocationNo());
                operationTime.setDay((String) operationTimeData.get("day"));
                operationTime.setStartTime(Time.valueOf(operationTimeData.get("startTime") + ":00"));
                operationTime.setEndTime(Time.valueOf(operationTimeData.get("endTime") + ":00"));
                operationTime.setRestStatus((Boolean) operationTimeData.get("restStatus"));
                operationTimes.add(operationTime);
            }
            bossPageService.saveOperationTimes(locationInfo.getLocationNo(), operationTimes);

            // Pet kind and size handling
            List<String> petKinds = (List<String>) payload.get("petKinds");
            List<String> petSizes = (List<String>) payload.get("petSizes");
            bossPageService.savePetKindsAndSizes(locationInfo.getLocationNo(), petKinds, petSizes);

            if (result > 0) {
                response.put("message", "장소정보 업데이트를 완료하였습니다.");
                response.put("success", true);
            } else {
                response.put("message", "장소정보 업데이트에 실패했습니다.");
                response.put("success", false);
            }
        } else {
            response.put("message", "로그인이 필요합니다.");
            response.put("success", false);
        }
        return response;
    }

    // 장소 정보 로드
    @ResponseBody
    @GetMapping(value = "/getLocationInfo.bm", produces = "application/json; charset=UTF-8")
    public Map<String, Object> getLocationInfo(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            int userNo = loginUser.getUserNo();
            BossLocation location = bossPageService.getLocationInfo(userNo);
            if (location != null) {
                response.put("locationPhone", location.getLocationPhone());
                response.put("explanation", location.getExplanation());
                response.put("reservationLink", location.getReservationLink());

                List<LocationOperationTime> operationTimes = bossPageService.getOperationTimes(location.getLocationNo());
                response.put("operationTimes", operationTimes);
            }
        } else {
            response.put("message", "로그인이 필요합니다.");
        }
        return response;
    }

    @RequestMapping(value = "bossAccommodationinfo.ba")
    public String bossAccommodationinfo() {
        return "bosspage/bossAccommodationinfo";
    }

    @RequestMapping(value = "animalhospital.ah")
    public String animalhospital() {
        return "bosspage/animalhospital";
    }

    @RequestMapping(value = "bossPageReviews.bp")
    public String bossPageReviews() {
        return "bosspage/bossPageReviews";
    }

    @RequestMapping(value = "bossCouponPage.bc")
    public String bossCouponPage() {
        return "bosspage/bossCouponPage";
    }
}
