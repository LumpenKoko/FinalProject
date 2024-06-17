package com.kh.mng.bosspage.service;

import java.util.List;

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
    int saveLocationInfo(BossLocation locationInfo);
    int updateLocationInfo(BossLocation locationInfo);
    int saveOperationTimes(int locationNo, List<LocationOperationTime> operationTimes);

    int savePetKindsAndSizes(int locationNo, List<String> petKinds, List<String> petSizes);
    List<String> getPetKinds(int locationNo);
    List<String> getPetSizes(int locationNo);
}
