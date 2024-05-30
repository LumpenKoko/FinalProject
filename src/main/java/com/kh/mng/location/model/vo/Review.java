package com.kh.mng.location.model.vo;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import com.kh.mng.common.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Review {
	private int reviewNo;
	private int reviewStar; //리뷰 평점
	private String  reviewContent;
	private Date enrollDate;
	private String userNickName;
	private double locationStar;//장소 평균평점
	private int userNo;
	private int locationNo;
	private String ownerReplyContent;//사장님 답글
	private Date ownerEnroll;//사장님 답글 입력 답글
    private ArrayList<Attachment> attachment; //첨부파일
    
}
