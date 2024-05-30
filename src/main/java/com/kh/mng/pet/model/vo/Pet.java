package com.kh.mng.pet.model.vo;

import java.sql.Date;

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
public class Pet {
	private int petNo;
	private String petName;
	private Date petBirthday;
	private String petGender;
	private int userNo;
	private int petSizeNo;
}
