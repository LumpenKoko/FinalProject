package com.kh.mng.community.model.vo;

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
public class Shorts {	
	private int shortsNo; //숏츠번호
	private String shortsContent; //숏츠내용
	private int count; //조회수
	private Date EnrollDate; //작성날짜
	private Date ModifyDate; //수정날짜
	private boolean status; //숏츠상태
	private int userNo; //회웝번호
}
