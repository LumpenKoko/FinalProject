package com.kh.mng.bosspage.service;

import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.location.model.vo.DetailLocation;
import com.kh.mng.location.model.vo.Location;

public interface BossPageService {
	Location getLocation(int userNo);
	
	//DetailLocation getDetailLocation(int userNo);

	int updatePhoneNumber(BossPage bossPage);

	int updateEmail(BossPage bossPage);

	int updatePwd(BossPage bossPage);

	int deleteBossUser(String bossId);
	
	
}
