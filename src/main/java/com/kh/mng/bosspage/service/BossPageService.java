package com.kh.mng.bosspage.service;

import java.util.List;
import java.util.Map;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossLocationOption;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;



public interface BossPageService {
	BossLocation getLocationInfo(int userNo);
	BossLocationOption getLocationOption(int locationNo);
	List<LocationOperationTime> getOperationTimes(int locationNo);
    
    int updatePhoneNumber(BossPage bossPage);
    
    int updateEmail(BossPage bossPage);
    
    int updatePwd(BossPage bossPage);
    
    int deleteBossUser(String bossId);
    
    int saveLocationInfo(BossLocation locationInfo); // 변경: Map에서 BossLocation으로 변경
    
    int updateLocationInfo(BossLocation locationInfo); // 추가
	
    int saveOperationTimes(int locationNo, List<LocationOperationTime> operationTimes);
}
