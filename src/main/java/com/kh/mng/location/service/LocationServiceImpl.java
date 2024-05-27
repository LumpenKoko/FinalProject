package com.kh.mng.location.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.location.model.dao.DetailDao;
import com.kh.mng.location.model.dao.PickedDao;
import com.kh.mng.location.model.dao.ReviewDao;
import com.kh.mng.location.model.dto.FileInfo;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.vo.DetailLocation;
import com.kh.mng.location.model.vo.DetailLocation2;
import com.kh.mng.location.model.vo.DetailLocationAttachment;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.LocationOption;
import com.kh.mng.location.model.vo.OperationTime;
import com.kh.mng.location.model.vo.PetKindGrade;
import com.kh.mng.location.model.vo.Review;

@Service
public class LocationServiceImpl implements LocationService {
	
	private SqlSessionTemplate sqlSession;
	private PickedDao pickedDao;
	private DetailDao detailDao;
	private ReviewDao reviewDao;
	private Object changNamesList;
	 
	@Autowired
	public  LocationServiceImpl (SqlSessionTemplate sqlSession,
			PickedDao picked,DetailDao detailDao,ReviewDao reviewDao) {
		this.sqlSession=sqlSession;
		this.pickedDao=picked;
		this.detailDao=detailDao;
		this.reviewDao=reviewDao;
	}
	
	@Override
	public int pickedStatus(PickedInfo pickedInfo) {
		return pickedDao. pickedStatus(sqlSession,pickedInfo);
	}

	@Override
	public int pickedCount(int spaceNo) {
		return pickedDao.pickedCount(sqlSession,spaceNo);
	}

	@Override
	public int insertPicked(PickedInfo pickedInfo) {
		return pickedDao.insertPicked(sqlSession,pickedInfo);
	}

	@Override
	public int deletePicked(PickedInfo pickedInfo) {
		return pickedDao.deletePicked(sqlSession,pickedInfo);
	}

	@Override
	public DetailLocation selectDetailLocation(int spaceNo) {
		
		return detailDao.selectDetailLocation(sqlSession,spaceNo);
	}
	
//	@Override
//	public DetailLocation2 selectDetailLocation2(int spaceNo) {
//		
//		DetailLocation2 detailLocation=detailDao.selectDetailLocation2(sqlSession,spaceNo);
//		ArrayList<LocationOption> locationoption=detailDao.selectLocationList(sqlSession,detailLocation.getLocationNo());
//		ArrayList<OperationTime> operationTime=detailDao.selectOperationTime(sqlSession,detailLocation.getLocationNo());
//		ArrayList<PetKindGrade> petKindGrade=detailDao.selectOperationTime(sqlSession,detailLocation.getLocationNo());
//		ArrayList<Attachment> attchment = detailDao.selectAttachMent(sqlSession,detailLocation.getLocationNo());
//		detailLocation.setLocationOption(locationoption);
//		detailLocation.setOperationTime(operationTime);
//		detailLocation.setPetKindNo(petKindGrade);// 이 다오에서만 조인문 
//		detailLocation.setAttachMent(attchment);
//		
//		return detailLocation;
//	}

	@Override
	public ArrayList<Review> selectDetailReviewList(int spaceNo) {
		
		 ArrayList<Review> reviews=reviewDao.selectReviewList(sqlSession,spaceNo);
		 
		 for(Review review:reviews) {
			 ArrayList<Attachment> attachMents =reviewDao.selectAttachmentList(sqlSession, review.getReviewNo());
			 review.setAttachment(attachMents);
		 }
		
		return reviews;
	}
	
	

	@Override
	public ArrayList<DetailLocationAttachment> selectDetailMainImg(int spaceNo) {
	
		return detailDao.selectMainImg(sqlSession, spaceNo);
	}

	@Override
	public ArrayList<DetailLocationAttachment> selectDetailDetailImg(int spaceNo) {
	
		return detailDao.selectDetailImg(sqlSession, spaceNo);
	}

	
	
	@Override
	//@Transactional
	public int insertReview(ReviewInfo reviewInfo, Map<String,String> changeNamesList,String path) {
	
		int count1=detailDao.insertReview(sqlSession,reviewInfo);
		int count2=1;
		if(count1>0) {
			 if(!changeNamesList.isEmpty()) {
				  for(Map.Entry<String, String> files : changeNamesList.entrySet()) {
					  FileInfo fileInfo =new FileInfo(files.getKey(),files.getValue(),path);
					  count2=detailDao.insertReviewAttachMent(sqlSession,fileInfo);
					  count2*=count2;
				  }
			}
		}
	
		
		return count1*count2;
	}

}
