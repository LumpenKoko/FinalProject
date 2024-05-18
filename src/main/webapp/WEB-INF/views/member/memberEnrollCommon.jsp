<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/minibox.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/memberEnrollCommon.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
    <div class="wrapper">
		<div class="minibox-wrap">
            <!-- if문으로 아이디 일 때, 비밀번호 일 때 구분해서 타이틀 넣을 것 -->
            <div class="minibox-title">회원가입</div>
            <div class="minibox-text">
                회원가입을 통해서 <br>
                반려동물과 행복한 동행을 시작하세요.
            </div>

            <form action="">
                <form action="">
                    <div class="minibox-mini-title">
                        <span>휴대폰번호 인증</span>
                        <span class="required-color">*</span>
                        <span class="error-message-margin">필수 항목입니다.</span>
                    </div>
                    <select name="" id="" class="minibox-input">
                        <option value="SKT" class="minibox-input">SKT</option>
                        <option value="KT" class="minibox-input">KT</option>
                        <option value="LGU+" class="minibox-input">LGU+</option>
                        <option value="알뜰폰" class="minibox-input">알뜰폰</option>
                    </select>

                    <input type="text" class="minibox-input" placeholder="가입 시 사용한 전화번호를 입력하세요. (ex) 010-0000-0000)">
                    
                    <div class="check-agree-box">
                        <input type="checkbox" id="check-agree-all" class="checkbox-color-pink">
                        <label for="check-agree-all">전체 동의합니다.</label>
                    </div>
                    <hr>
                    <div class="check-agree-box">
                        <input type="checkbox" id="check-agree-first" class="checkbox-color-pink">
                        <label for="check-agree-first">[필수] 본인 확인 서비스 이용 약관 동의</label>
                    </div>
                    <div class="check-agree-box">
                        <input type="checkbox" id="check-agree-second" class="checkbox-color-pink">
                        <label for="check-agree-second">[필수] 통신사 이용 약관 동의</label>
                    </div>
                    <div class="check-agree-box">
                        <input type="checkbox" id="check-agree-third" class="checkbox-color-pink">
                        <label for="check-agree-third">[필수] 통신사/인증사의 개인정보 이용, 제공 동의</label>
                    </div>
                    <div class="check-agree-box">
                        <input type="checkbox" id="check-agree-fourth" class="checkbox-color-pink">
                        <label for="check-agree-fourth">[필수] 고유식별 정보 처리 동의</label>
                    </div>

                    <br>
                    
                    <div class="minibox-mini-title">
                        <span class="error-message-nomargin">인증번호가 일치하지 않습니다.</span>
                    </div>

                    <div id="check-number">
                        <input type="text" class="minibox-input" placeholder="인증번호 6자리 숫자">
                        <button type="submit" class="common-button white-button">인증번호 요청</button>
                        <div>2:00</div>
                    </div>
                    
                    <div id="plus-time">시간 연장</div>
                    <button type="submit" class="common-button pink-button minibox-full-button">확인</button>
                </form>

                <input type="text" value="010-1234-5678" readonly>
                <div class="common-button">휴대폰번호 인증이 완료되었습니다.</div>

                <div class="minibox-mini-title">
                    <span>아이디</span>
                    <span class="required-color">*</span>
                    <span class="error-message-margin">사용할 수 없는 아이디입니다.</span>
                </div>
                <input type="text" class="minibox-input" placeholder="8~12자리의 영문, 숫자로 입력하세요.">

                <div class="minibox-mini-title">
                    <span>비밀번호</span>
                    <span class="required-color">*</span>
                    <span class="error-message-margin">사용할 수 없는 비밀번호입니다.</span>
                </div>
                <input type="password" class="minibox-input" placeholder="8~14자리의 영문, 숫자로 입력하세요.">

                <div class="minibox-mini-title">
                    <span>비밀번호 확인</span>
                    <span class="required-color">*</span>
                    <span class="error-message-margin">비밀번호가 일치하지 않습니다.</span>
                </div>
                <input type="password" class="minibox-input" placeholder="8~14자리의 영문, 숫자로 입력하세요.">

                <div class="minibox-mini-title">
                    <span>이름</span>
                    <span class="required-color">*</span>
                    <span class="error-message-margin">필수 항목입니다.</span>
                </div>
                <input type="text" class="minibox-input" placeholder="이름을 입력하세요.">

                <div class="minibox-mini-title">
                    <span>닉네임</span>
                    <span class="required-color">*</span>
                    <span class="error-message-margin">필수 항목입니다.</span>
                </div>
                <input type="text" class="minibox-input" placeholder="사용할 닉네임을 입력하세요.">

                <input type="text" value="여자" class="minibox-input">
                <input type="text" value="남자" class="minibox-input">

                <div class="minibox-mini-title">
                    <span>생년월일(선택)</span>
                    <span class="error-message-margin">형식에 맞지 않습니다.</span>
                </div>
                <input type="text" class="minibox-input" placeholder="0000-00-00">
                
                <div class="minibox-mini-title">
                    <span>닉네임</span>
                    <span class="error-message-margin">필수 항목입니다.</span>
                </div>
                <div>
                    <input type="text" class="minibox-input" placeholder="이메일 입력">
                    @
                    <select name="" id="">
                        <input type="text" placeholder="직접입력">
                        <option value="naver">naver.com</option>
                        <option value="google">google.com</option>
                        <option value="nate">nate.com</option>
                        <option value="daum">daum.com</option>
                    </select>
                </div>
                <button type="submit" class="common-button pink-button minibox-full-button">확인</button>
            </form>
        </div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>