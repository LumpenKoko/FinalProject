package com.kh.mng.bosspage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.bosspage.model.vo.BossLocationOption;
import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.model.vo.LocationOperationTime;

@Repository
public class BossPageDao {
    public BossLocation getLocation(SqlSessionTemplate sqlSession, int userNo) {
        return sqlSession.selectOne("location.getLocation", userNo);
    }

    public int updatePhonNo(SqlSessionTemplate sqlSession, BossPage bossPage) {
        return sqlSession.update("memberMapper.updatePhonNo", bossPage);
    }

    public int updateEmail(SqlSessionTemplate sqlSession, BossPage bossPage) {
        return sqlSession.update("memberMapper.updateEmail", bossPage);
    }

    public int updatePwd(SqlSessionTemplate sqlSession, BossPage bossPage) {
        return sqlSession.update("memberMapper.updatePwd", bossPage);
    }

    public int deleteBossUser(SqlSessionTemplate sqlSession, String bossId) {
        return sqlSession.update("memberMapper.deactivateBossUser", bossId);
    }

    public int saveLocationInfo(SqlSessionTemplate sqlSession, BossLocation locationInfo) {
        return sqlSession.insert("location.insertLocation", locationInfo);
    }

    public int updateLocationInfo(SqlSessionTemplate sqlSession, BossLocation locationInfo) {
        return sqlSession.update("location.updateLocation", locationInfo);
    }

    public BossLocationOption getLocationOption(SqlSessionTemplate sqlSession, int locationNo) {
        return sqlSession.selectOne("location.getLocationOption", locationNo);
    }

    public int insertOperationTime(SqlSessionTemplate sqlSession, LocationOperationTime operationTime) {
        return sqlSession.insert("location.insertOperationTime", operationTime);
    }

    public int updateOperationTime(SqlSessionTemplate sqlSession, LocationOperationTime operationTime) {
        return sqlSession.update("location.updateOperationTime", operationTime);
    }

    public List<LocationOperationTime> getOperationTimes(SqlSessionTemplate sqlSession, int locationNo) {
        return sqlSession.selectList("location.getOperationTimes", locationNo);
    }

    public int deleteOperationTimes(SqlSessionTemplate sqlSession, int locationNo) {
        return sqlSession.delete("location.deleteOperationTimes", locationNo);
    }

    public int deletePetKindsAndSizes(SqlSessionTemplate sqlSession, int locationNo) {
        sqlSession.delete("location.deletePetKinds", locationNo);
        sqlSession.delete("location.deletePetSizes", locationNo);
        return 1;
    }

    public int insertPetKind(SqlSessionTemplate sqlSession, int locationNo, String petKind) {
        Map<String, Object> params = new HashMap<>();
        params.put("locationNo", locationNo);
        params.put("petKind", petKind);
        return sqlSession.insert("location.insertPetKind", params);
    }

    public int insertPetSize(SqlSessionTemplate sqlSession, int locationNo, String petSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("locationNo", locationNo);
        params.put("petSize", petSize);
        return sqlSession.insert("location.insertPetSize", params);
    }

    public List<String> getPetKinds(SqlSessionTemplate sqlSession, int locationNo) {
        return sqlSession.selectList("location.getPetKinds", locationNo);
    }

    public List<String> getPetSizes(SqlSessionTemplate sqlSession, int locationNo) {
        return sqlSession.selectList("location.getPetSizes", locationNo);
    }
}
