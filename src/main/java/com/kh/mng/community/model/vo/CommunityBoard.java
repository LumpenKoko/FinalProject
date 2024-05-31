package com.kh.mng.community.model.vo;

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
public class CommunityBoard {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int count;//조회수
	private Date createDate;
	private Date editDate;
	private boolean status;
	private String userNickName;
	private String categoryName;
	private int locationCategoryNo;
	private int userNo;
	private int goodCount; // 데이터 조회 시 사용할 추천 횟수
	private int replyCount; // 데이터 조회 시 사용할 댓글수
	private ArrayList <Attachment> attahment;//첨부파일
	
}
