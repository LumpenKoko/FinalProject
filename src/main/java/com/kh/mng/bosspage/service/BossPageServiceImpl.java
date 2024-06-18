package com.kh.mng.bosspage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.bosspage.model.dao.BossPageDao;
import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossLocationOption;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationEnterGrade;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;
import com.kh.mng.bosspage.model.vo.LocationPetKind;
import com.kh.mng.bosspage.model.vo.LocationPetSize;
import com.kh.mng.bosspage.model.vo.LocationPicture;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BossPageServiceImpl implements BossPageService {

    @Autowired
    private BossPageDao bossPageDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public BossLocation getLocationInfo(int userNo) {
        return bossPageDao.getLocation(userNo);
    }

    @Override
    public BossLocationOption getLocationOption(int locationNo) {
        return bossPageDao.getLocationOption(locationNo);
    }

    @Override
    public int updatePhoneNumber(BossPage bossPage) {
        return bossPageDao.updatePhonNo(bossPage);
    }

    @Override
    public int updateEmail(BossPage bossPage) {
        return bossPageDao.updateEmail(bossPage);
    }

    @Override
    public int updatePwd(BossPage bossPage) {
        return bossPageDao.updatePwd(bossPage);
    }

    @Override
    @Transactional
    public int deleteBossUser(String bossId) {
        return bossPageDao.deleteBossUser(bossId);
    }

    @Override
    @Transactional
    public int saveLocationInfo(BossLocation locationInfo) {
        return bossPageDao.saveLocationInfo(locationInfo);
    }

    @Override
    @Transactional
    public int updateLocationInfo(BossLocation locationInfo) {
        return bossPageDao.updateLocationInfo(locationInfo);
    }

    @Override
    @Transactional
    public int saveOperationTimes(int locationNo, List<LocationOperationTime> operationTimes) {
        bossPageDao.deleteOperationTimes(locationNo);
        for (LocationOperationTime operationTime : operationTimes) {
            bossPageDao.insertOperationTime(operationTime);
        }
        return 1;
    }

    @Override
    public List<LocationOperationTime> getOperationTimes(int locationNo) {
        return bossPageDao.getOperationTimes(locationNo);
    }

    @Override
    @Transactional
    public int savePetKindsAndSizes(int locationNo, List<String> petKinds, List<String> petSizes) {
        if (petKinds == null) {
            petKinds = new ArrayList<>();
        }
        if (petSizes == null) {
            petSizes = new ArrayList<>();
        }

        bossPageDao.deletePetKindsAndSizes(locationNo);
        
        for (String petKind : petKinds) {
            LocationPetKind existingPetKind = bossPageDao.getPetKindByName(petKind);
            if (existingPetKind == null) {
                Map<String, Object> params = new HashMap<>();
                params.put("petKind", petKind);
                bossPageDao.insertPetKind(params);
                existingPetKind = bossPageDao.getPetKindByName(petKind);
            }
            // 추가 코드가 필요하면 여기서 추가
        }
        
        for (String petSize : petSizes) {
            Map<String, Object> params = new HashMap<>();
            params.put("petSize", petSize);
            bossPageDao.insertPetSize(params);

            // Save LocationEnterGrade information
            LocationPetSize locationPetSize = bossPageDao.getPetSizeByName(petSize);
            if (locationPetSize != null) {
                LocationEnterGrade locationEnterGrade = new LocationEnterGrade();
                locationEnterGrade.setLocationNo(locationNo);
                locationEnterGrade.setPetSizeNo(locationPetSize.getPetSizeNo());
                bossPageDao.insertLocationEnterGrade(locationEnterGrade);
            }
        }
        return 1;
    }

    @Override
    public List<String> getPetKinds(int locationNo) {
        return bossPageDao.getPetKinds(locationNo);
    }

    @Override
    public List<String> getPetSizes(int locationNo) {
        return bossPageDao.getPetSizes(locationNo);
    }

    @Override
    public LocationPetKind getPetKindByName(String petKindName) {
        return bossPageDao.getPetKindByName(petKindName);
    }

    @Override
    public LocationPetSize getPetSizeByName(String petSizeName) {
        return bossPageDao.getPetSizeByName(petSizeName);
    }

    @Override
    @Transactional
    public int saveLocationEnterGrade(LocationEnterGrade locationEnterGrade) {
        return bossPageDao.insertLocationEnterGrade(locationEnterGrade);
    }

    @Override
    public List<LocationEnterGrade> getLocationEnterGrades(int locationNo) {
        return bossPageDao.getLocationEnterGrades(locationNo);
    }

	@Override
	public int saveImages(int locationNo, List<LocationPicture> pictures) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<LocationPicture> getImages(int locationNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteImages(int locationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int savePictures(int locationNo, List<LocationPicture> pictures) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<LocationPicture> getPicturesByLocation(int locationNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
