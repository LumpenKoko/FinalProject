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
public class DetailLocation {
	private int locationNo;//장소 번호
	private String locationName;//장소 이름
	private String locationPhone;//장소 전화번호
	private String explanation;//설명
	private double locationStar;//장소 평점
	private String reservationLink;//예약 링크
	private String address;//장소 주소
	private String goods;//상품이름
	private String goodPrice;//상품가격
	private String roomInfo;//객실 정보
	private String day; //체크인 체크아웃
    private int capacity;//수용인원
	private int locatonCategoryNo;//카테고리 번호
	private String categoryName;//카테고리 명
	private Time startTime;//시작시간
	private Time endTime;//종료시간
	private boolean restStatus;//휴무여부
	private String kindName;//분류 명
	
}
