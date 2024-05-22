<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="resources/css/common/minibox.css"/>
<link rel="stylesheet" href="resources/css/member/memberSearch.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
    <div class="wrapper">
		<div class="minibox-wrap">
            <!-- if문으로 아이디 일 때, 비밀번호 일 때 구분해서 타이틀 넣을 것 -->
            <div class="minibox-title">아이디 찾기</div>
            <div class="minibox-text">
                가입 시 사용한 전화번호를 입력하세요.
            </div>

            <form action="">
                <div class="minibox-mini-title">
                    <span>이름</span>
                    <span class="required-color">*</span>
                    <span class="error-message-margin">필수 항목입니다.</span>
                </div>
                <input type="text" class="minibox-input" placeholder="가입 시 사용한 이름을 입력하세요.">
                
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

                    <div class="minibox-mini-title">
                        <span class="error-message-nomargin">인증번호가 일치하지 않습니다.</span>
                    </div>
                    <div id="check-number">
                        <input type="text" class="minibox-input" placeholder="인증번호 6자리 숫자">
                        <button type="submit" class="common-button white-button">인증번호 요청</button>
                        <div>2:00</div>
                    </div>
                    
                    <div id="plus-time">시간 연장</div>
                </form>
                <button type="submit" class="common-button pink-button minibox-full-button">확인</button>
            </form>
        </div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>