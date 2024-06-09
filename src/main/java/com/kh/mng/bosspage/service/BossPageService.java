package com.kh.mng.bosspage.service;

import java.util.List;

import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.location.model.vo.Location;

public interface BossPageService {
	Location getLocation(int userNo);

	int updatePhoneNumber(BossPage bossPage);

	int updateEmail(BossPage bossPage);

	int updatePwd(BossPage bossPage);

	int deleteBossUser(String userId);
	
	
}
