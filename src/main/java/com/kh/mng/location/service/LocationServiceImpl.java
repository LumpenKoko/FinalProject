package com.kh.mng.location.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.dao.DetailDao;
import com.kh.mng.location.model.dao.PickedDao;
import com.kh.mng.location.model.dao.ReviewDao;
import com.kh.mng.location.model.dto.FileInfo;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.dto.ReplyInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.vo.DetailLocation_;
import com.kh.mng.location.model.vo.DetailLocation;
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
	 
	@Autowired
	public  LocationServiceImpl (SqlSessionTemplate sqlSession,
			PickedDao picked,DetailDao detailDao,ReviewDao reviewDao) {
		this.sqlSession=sqlSession;
		this.pickedDao=picked;
		this.detailDao=detailDao;
		this.reviewDao=reviewDao;
	}
	
	@Override
	@Transactional
	public DetailLocation selectDetailLocation(int locationNo) {
		
		DetailLocation detailLocation=detailDao.selectDetailLocation(sqlSession,locationNo);
		ArrayList<LocationOption> locationOption=detailDao.selectLocationOptionList(sqlSession,detailLocation.getLocationNo());
		ArrayList<OperationTime> operationTime=detailDao.selectOperationTimeList(sqlSession,detailLocation.getLocationNo());
		ArrayList<PetKindGrade> petKindGrade=detailDao.selectPetKindGradeList(sqlSession,detailLocation.getLocationNo());
		ArrayList<Attachment> mainAttachment = detailDao.selectAttachMentList(sqlSession,detailLocation.getLocationNo());
		ArrayList<Attachment> detailAttchment = detailDao.selectDetailAttachMentList(sqlSession,detailLocation.getLocationNo());
		detailLocation.setLocationOption(locationOption);
		detailLocation.setOperationTime(operationTime);
		detailLocation.setPetKindGrade(petKindGrade);// 이 다오에서만 조인문 
		detailLocation.setMainAttachMent(mainAttachment);
		detailLocation.setDetailAttachMent(detailAttchment);
		
		return detailLocation;
	}

	@Override
	public ArrayList<DetailLocationAttachment> selectDetailMainImg(int locationNo) {
	
		return detailDao.selectMainImg(sqlSession, locationNo);
	}

	@Override
	public ArrayList<DetailLocationAttachment> selectDetailDetailImg(int locationNo) {
	
		return detailDao.selectDetailImg(sqlSession, locationNo);
	}

	
	
	
	//찜관련 서비스
	
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
	public DetailLocation_ selectDetailLocation_(int locationNo) {
		
		return detailDao.selectDetailLocation_(sqlSession,locationNo);
	}
	
	
	//리뷰 관련 서비스
	
	@Override
	public ArrayList<Review> selectDetailReviewList(int locationNo,PageInfo pi) {
		
		 ArrayList<Review> reviews=reviewDao.selectReviewList(sqlSession,locationNo, pi);
		 
		 for(Review review:reviews) {
			 ArrayList<Attachment> attachMents =reviewDao.selectAttachmentList(sqlSession, review.getReviewNo());
			 review.setAttachment(attachMents);
		 }
		
		return reviews;
	}
	
	
	@Override
	@Transactional //??
	public int insertReview(ReviewInfo reviewInfo, Map<String,String> changeNamesList,String path) {
	
		int count1=reviewDao.insertReview(sqlSession,reviewInfo);
		int count2=1;
		if(count1>0) {
			 if(!changeNamesList.isEmpty()) {
				  for(Map.Entry<String, String> files : changeNamesList.entrySet()) {
					  FileInfo fileInfo =new FileInfo(files.getKey(),files.getValue(),path);
					  count2= reviewDao.insertReviewAttachMent(sqlSession,fileInfo);
					  count2*=count2;
				  }
			}
		}
	
		
		return count1*count2;
	}

	@Override
	public int deleteReview(ReviewInfo reveiwInfo) {
		
		int count=reviewDao.deleteDao(sqlSession,reveiwInfo);
		
		return count;
	}

	@Override
	public int selectReviewCount(int locatonNo) {
		
		return reviewDao.selectReviewCount(sqlSession,locatonNo);
	}

	@Override
	public int insertReply(ReplyInfo reply) {
		// TODO Auto-generated method stub
		return reviewDao.selectReply(sqlSession,reply);
	}

}
