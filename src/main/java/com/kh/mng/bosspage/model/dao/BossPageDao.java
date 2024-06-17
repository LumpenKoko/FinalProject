package com.kh.mng.bosspage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossLocationOption;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationEnterGrade;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;
import com.kh.mng.bosspage.model.vo.LocationPetKind;
import com.kh.mng.bosspage.model.vo.LocationPetSize;
import com.kh.mng.bosspage.model.vo.LocationPicture;

@Repository
public class BossPageDao {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public BossLocation getLocation(int userNo) {
        return sqlSession.selectOne("location.getLocation", userNo);
    }

    public int updatePhonNo(BossPage bossPage) {
        return sqlSession.update("memberMapper.updatePhonNo", bossPage);
    }

    public int updateEmail(BossPage bossPage) {
        return sqlSession.update("memberMapper.updateEmail", bossPage);
    }

    public int updatePwd(BossPage bossPage) {
        return sqlSession.update("memberMapper.updatePwd", bossPage);
    }

    public int deleteBossUser(String bossId) {
        return sqlSession.update("memberMapper.deactivateBossUser", bossId);
    }

    public int saveLocationInfo(BossLocation locationInfo) {
        return sqlSession.insert("location.insertLocation", locationInfo);
    }

    public int updateLocationInfo(BossLocation locationInfo) {
        return sqlSession.update("location.updateLocation", locationInfo);
    }

    public BossLocationOption getLocationOption(int locationNo) {
        return sqlSession.selectOne("location.getLocationOption", locationNo);
    }

    public int insertOperationTime(LocationOperationTime operationTime) {
        return sqlSession.insert("location.insertOperationTime", operationTime);
    }

    public int updateOperationTime(LocationOperationTime operationTime) {
        return sqlSession.update("location.updateOperationTime", operationTime);
    }

    public List<LocationOperationTime> getOperationTimes(int locationNo) {
        return sqlSession.selectList("location.getOperationTimes", locationNo);
    }

    public int deleteOperationTimes(int locationNo) {
        return sqlSession.delete("location.deleteOperationTimes", locationNo);
    }

    public int deletePetKindsAndSizes(int locationNo) {
        sqlSession.delete("location.deletePetKinds", locationNo);
        sqlSession.delete("location.deletePetSizes", locationNo);
        return 1;
    }

    public LocationPetKind getPetKindByName(String petKindName) {
        return sqlSession.selectOne("location.getPetKindByName", petKindName);
    }

    public LocationPetSize getPetSizeByName(String petSizeName) {
        return sqlSession.selectOne("location.getPetSizeByName", petSizeName);
    }

    public int insertLocationEnterGrade(LocationEnterGrade locationEnterGrade) {
        return sqlSession.insert("location.insertLocationEnterGrade", locationEnterGrade);
    }

    public List<LocationEnterGrade> getLocationEnterGrades(int locationNo) {
        return sqlSession.selectList("location.getLocationEnterGrades", locationNo);
    }

    public int insertPicture(LocationPicture picture) {
        return sqlSession.insert("location.insertPicture", picture);
    }

    public int deletePicturesByLocation(int locationNo) {
        return sqlSession.delete("location.deletePicturesByLocation", locationNo);
    }

    public List<LocationPicture> getPicturesByLocation(int locationNo) {
        return sqlSession.selectList("location.getPicturesByLocation", locationNo);
    }

    public int insertPetKind(int locationNo, String petKind) {
        Map<String, Object> params = new HashMap<>();
        params.put("locationNo", locationNo);
        params.put("petKind", petKind);
        return sqlSession.insert("location.insertPetKind", params);
    }

    public int insertPetSize(int locationNo, String petSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("locationNo", locationNo);
        params.put("petSize", petSize);
        return sqlSession.insert("location.insertPetSize", params);
    }

    public List<String> getPetKinds(int locationNo) {
        return sqlSession.selectList("location.getPetKinds", locationNo);
    }

    public List<String> getPetSizes(int locationNo) {
        return sqlSession.selectList("location.getPetSizes", locationNo);
    }
}
