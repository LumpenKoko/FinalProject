package com.kh.mng.location.model.vo.detail;

import java.sql.Date;
import java.sql.Time;

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
	private String userName;
	private double locationStar;//장소 평균평점
	private int userNo;
	private String ownerReplyContent;//사장님 답글
	private Date ownerEnroll;//사장님 답글 입력 날짜
}
