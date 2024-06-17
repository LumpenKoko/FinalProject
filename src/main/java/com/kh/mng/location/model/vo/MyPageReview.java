package com.kh.mng.location.model.vo;

import java.sql.Date;
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
public class MyPageReview {
	private int reviewNo;
	private int userNo;
	private String reviewContent;
	private String userNickName;
	private Date modifyDate;
}
