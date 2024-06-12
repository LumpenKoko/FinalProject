package com.kh.mng.common.phonesms;

import org.springframework.context.annotation.Bean;

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

public class PhoneSmsVo {
	private String apiKey;
	private String apiSecretKey;
	private String apiUrl;
	private String sentNum;

}
