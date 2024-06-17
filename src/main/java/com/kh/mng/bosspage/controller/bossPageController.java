package com.kh.mng.bosspage.controller;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationEnterGrade;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;
import com.kh.mng.bosspage.model.vo.LocationPetKind;
import com.kh.mng.bosspage.model.vo.LocationPetSize;
import com.kh.mng.bosspage.model.vo.LocationPicture;
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
           int count = bossPageService.updatePhoneNumber(bossPage);
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
        String bossId = ((Member)session.getAttribute("loginUser")).getUserId();

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

    @ResponseBody
    @PostMapping(value = "/saveLocationInfo.bm", produces = "application/json; charset=UTF-8")
    public ResponseEntity<Map<String, Object>> saveLocationInfo(@RequestBody Map<String, Object> payload, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        log.info("payload:{}",payload);

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            try {
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

                // Save LocationEnterGrade information
                for (String petSize : petSizes) {
                    LocationPetSize locationPetSize = bossPageService.getPetSizeByName(petSize);
                    if (locationPetSize != null) {
                        LocationEnterGrade locationEnterGrade = new LocationEnterGrade();
                        locationEnterGrade.setLocationNo(locationInfo.getLocationNo());
                        locationEnterGrade.setPetSizeNo(locationPetSize.getPetSizeNo());
                        bossPageService.saveLocationEnterGrade(locationEnterGrade);
                    }
                }

                if (result > 0) {
                    response.put("message", "장소정보 업데이트를 완료하였습니다.");
                    response.put("success", true);
                    response.put("locationNo", locationInfo.getLocationNo());
                } else {
                    response.put("message", "장소정보 업데이트에 실패했습니다.");
                    response.put("success", false);
                }
            } catch (Exception e) {
                log.error("Error saving location info", e);
                response.put("message", "서버 오류로 인해 장소정보 업데이트에 실패했습니다.");
                response.put("success", false);
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        } else {
            response.put("message", "로그인이 필요합니다.");
            response.put("success", false);
        }
        return ResponseEntity.ok(response);
    }

    @ResponseBody
    @GetMapping(value = "/getLocationInfo.bm", produces = "application/json; charset=UTF-8")
    public ResponseEntity<Map<String, Object>> getLocationInfo(HttpSession session) {
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
                response.put("locationNo", location.getLocationNo());
            }
        } else {
            response.put("message", "로그인이 필요합니다.");
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/uploadImage")
    @ResponseBody
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file, @RequestParam("locationNo") int locationNo) {
        try {
            // 파일 저장 경로 설정
            String uploadDir = "/path/to/upload/directory";
            String originalFileName = file.getOriginalFilename();
            String newFileName = UUID.randomUUID().toString() + "_" + originalFileName;
            Path path = Paths.get(uploadDir, newFileName);
            Files.write(path, file.getBytes());

            // 파일 정보를 데이터베이스에 저장
            LocationPicture picture = new LocationPicture();
            picture.setOriginName(originalFileName);
            picture.setChangeName(newFileName);
            picture.setFilePath(path.toString());
            picture.setFileLevel(1); // 파일 레벨을 적절히 설정
            picture.setLocationNo(locationNo);

            bossPageService.savePictures(locationNo, Arrays.asList(picture));

            return ResponseEntity.ok("파일 업로드 성공");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
        }
    }

    @GetMapping("/getPictures")
    @ResponseBody
    public ResponseEntity<List<LocationPicture>> getPictures(@RequestParam("locationNo") int locationNo) {
        List<LocationPicture> pictures = bossPageService.getPicturesByLocation(locationNo);
        return ResponseEntity.ok(pictures);
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
