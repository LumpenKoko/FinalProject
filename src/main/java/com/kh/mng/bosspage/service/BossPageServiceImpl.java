package com.kh.mng.bosspage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.bosspage.model.dao.BossPageDao;
import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossLocationOption;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;

@Service
public class BossPageServiceImpl implements BossPageService {

    @Autowired
    private BossPageDao bossPageDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public BossLocation getLocationInfo(int userNo) {
        return bossPageDao.getLocation(sqlSession, userNo);
    }

    @Override
    public BossLocationOption getLocationOption(int locationNo) {
        return bossPageDao.getLocationOption(sqlSession, locationNo);
    }

    @Override
    public int updatePhoneNumber(BossPage bossPage) {
        return bossPageDao.updatePhonNo(sqlSession, bossPage);
    }

    @Override
    public int updateEmail(BossPage bossPage) {
        return bossPageDao.updateEmail(sqlSession, bossPage);
    }

    @Override
    public int updatePwd(BossPage bossPage) {
        return bossPageDao.updatePwd(sqlSession, bossPage);
    }

    @Override
    @Transactional
    public int deleteBossUser(String bossId) {
        return bossPageDao.deleteBossUser(sqlSession, bossId);
    }

    @Override
    @Transactional
    public int saveLocationInfo(BossLocation locationInfo) {
        return bossPageDao.saveLocationInfo(sqlSession, locationInfo);
    }

    @Override
    @Transactional
    public int updateLocationInfo(BossLocation locationInfo) {
        return bossPageDao.updateLocationInfo(sqlSession, locationInfo);
    }

    @Override
    @Transactional
    public int saveOperationTimes(int locationNo, List<LocationOperationTime> operationTimes) {
        bossPageDao.deleteOperationTimes(sqlSession, locationNo);
        for (LocationOperationTime operationTime : operationTimes) {
            bossPageDao.insertOperationTime(sqlSession, operationTime);
        }
        return 1;
    }
    

    @Override
    public List<LocationOperationTime> getOperationTimes(int locationNo) {
        return bossPageDao.getOperationTimes(sqlSession, locationNo);
    }

    @Override
    @Transactional
    public int savePetKindsAndSizes(int locationNo, List<String> petKinds, List<String> petSizes) {
        bossPageDao.deletePetKindsAndSizes(sqlSession, locationNo);
        for (String petKind : petKinds) {
            bossPageDao.insertPetKind(sqlSession, locationNo, petKind);
        }
        for (String petSize : petSizes) {
            bossPageDao.insertPetSize(sqlSession, locationNo, petSize);
        }
        return 1;
    }

    @Override
    public List<String> getPetKinds(int locationNo) {
        return bossPageDao.getPetKinds(sqlSession, locationNo);
    }

    @Override
    public List<String> getPetSizes(int locationNo) {
        return bossPageDao.getPetSizes(sqlSession, locationNo);
    }
}
