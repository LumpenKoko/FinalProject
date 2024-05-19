<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/minibox.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/memberEnrollSelect.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
    <div class="wrapper">
		<div class="main member-enroll-wrap">
			<div id="member-enroll-wrap" class="gray-round-box">

				<div class="minibox-title">회원가입</div>
				<div class="minibox-text">
					원하시는 가입 방식을 선택해주세요
				</div>

				<div id="member-select-box">
					<div class="member-select-category gray-round-box">
						<div class="padding-category"><img src="<%=request.getContextPath()%>/resources/member/commonMember.png" alt=""></div>
						<span>일반회원</span>
					</div>
					<div class="member-select-category gray-round-box">
						<div class="padding-category"><img src="<%=request.getContextPath()%>/resources/member/adminMember.png" alt=""></div>
						<span>사장회원</span>
					</div>
				</div>

				<button type="submit" id="member-select-button" class="common-button pink-button minibox-full-button">확인</button>
			</div>
		</div>
	</div>

	
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>