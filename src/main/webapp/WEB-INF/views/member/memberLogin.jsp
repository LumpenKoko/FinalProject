<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/minibox.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/memberLogin.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
    <div class="wrapper">
		<div class="minibox-wrap">
            <div class="minibox-title">로그인</div>
            <div class="minibox-text">
                로그인을 통해서 <br>
                반려동물과 행복한 동행을 시작하세요
            </div>

            <form action="" id="login-form">
                <input type="text" class="minibox-input" placeholder="아이디를 입력하세요">
                <input type="password" class="minibox-input" placeholder="비밀번호를 입력하세요">

                <div>
                    <div>
                        <input type="checkbox" id="save-id">
                        <label for="save-id">아이디 저장</label>
                    </div>
                    <div class="error-message">아이디 혹은 비밀번호가 일치하지 않습니다.</div>
                </div>

                <button type="submit" class="common-button pink-button minibox-full-button">로그인</button>
            </form>

            <hr>

            <div id="search-id-password">
                <div>아이디 찾기</div>
                <div>비밀번호 찾기</div>
            </div>
        </div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>