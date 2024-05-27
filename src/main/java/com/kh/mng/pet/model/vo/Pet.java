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
	private char petGender;
	private int userNo;
	private int petSizeNo;

	public Pet(String petName, Date petBirthday, char petGender, int petSizeNo) {
		super();
		this.petName = petName;
		this.petBirthday = petBirthday;
		this.petGender = petGender;
		this.petSizeNo = petSizeNo;
	}
}
