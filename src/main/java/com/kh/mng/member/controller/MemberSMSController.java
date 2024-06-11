package com.kh.mng.member.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberSMSController {
	
	final DefaultMessageService messageService;
	
	@Value("${sms.apiKey}") 
	private String apiKey;
	
	@Value("${sms.apiSecretKey}") 
	private String apiSecretKey;
	
	@Value("${sms.url}") 
	private String apiUrl;
	
	@Value("${sms.sentNum}") 
	private String sentNum;
	
	@GetMapping("certification.me")
	public String test() {
		return "";
	}

    public MemberSMSController() {
        this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecretKey, apiUrl);
    }
    
    @ResponseBody
    @PostMapping("certification.me")
    public SingleMessageSentResponse sendCertifyCode(String getNum) {
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom(sentNum);
        message.setTo(getNum);
        message.setText("[멍냥가이드] 본인확인 인증번호 [" + 1 + "] ");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }
}
