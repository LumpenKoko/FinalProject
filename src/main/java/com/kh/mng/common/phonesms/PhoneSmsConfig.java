package com.kh.mng.common.phonesms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

//@PropertySource("classpath:/phonesms.properties")
@Configuration
public class PhoneSmsConfig {
	
	@Autowired
	private PhoneSmsVo psv;
	
	@Value("${sms.apiKey}") 
	private String apiKey;
	
	@Value("${sms.apiSecretKey}") 
	private String apiSecretKey;
	
	@Value("${sms.url}") 
	private String apiUrl;
	
	@Value("${sms.sentNum}") 
	private String sentNum;
	
	// PropertySourcesPlaceholderConfigurer를 등록하지 않을 경우 @Value 사용 시 프로퍼티 주입을 하지 못해 ${sms.apiKey} 그대로 출력됨
	@Bean
    public static PropertySourcesPlaceholderConfigurer placeholderConfigurer(){
        return new PropertySourcesPlaceholderConfigurer();
    }
	
	@Bean  
    public PhoneSmsVo getPhoneSmsConfig() {                            
		PhoneSmsVo phoneSmsVo = new PhoneSmsVo();
		phoneSmsVo.setApiKey(apiKey);
		phoneSmsVo.setApiSecretKey(apiSecretKey);
		phoneSmsVo.setApiUrl(apiUrl);
		phoneSmsVo.setSentNum(sentNum);
        return phoneSmsVo;
    }
}
