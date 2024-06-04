package com.kh.mng.search.model.dto;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.location.model.vo.EnterGrade;
import com.kh.mng.location.model.vo.OperationTime;

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
public class SearchFilter {
	private String keyword; // 검색 키워드
	private ArrayList<String> petList; // 선택한 반려동물 사이즈 리스트
	private ArrayList<String> locList; // 선택한 장소 카테고리 리스트
	private String order; // 정렬 기준
}
