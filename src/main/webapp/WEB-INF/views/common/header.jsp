<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String contextPath = request.getContextPath();
    
    //로그인 유저 정의
	//Member loginUser = (Member)session.getAttribute("loginUser");
    
    //로그인 유저 테스트
   
    String testUser=(String)session.getAttribute("loginUser");
    String alertMsg = (String)session.getAttribute("alertMsg");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<!-- fontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>-->


<!--summernote-->

<!-- 공통css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/common.css"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/header.css"/>

</head>
<body>

    <!-- 알림창 -->
	<% if(alertMsg != null) {%>
			<script>
				alert("<%=alertMsg%>");
			</script>
			<% session.removeAttribute("alertMsg");%>
	<% } %>


<div id="header">
    <div id="header_logo" >
        <div class="gugi-regular">멍냥</div>
        <div style="font-size: 30px; color:#FE8B94; width:100% float:left;">가이드</div>
    </div>

    <div id="header_menu">
        <ul>
            <li><span>지도</span></li>
            <li><span>커뮤니티</span></li>
            <li><span>대시보드</span></li>
        </ul>
    </div>

    <div id="header_search" >
        <input type="text" placeholder="장소를 검색하세요" style="text-align:left;">
        <button id="header_search_button" type="button">🔍</button>
    </div>

   <!-- 로그여부 조건 처리 필요 -->
    <div id="header_login">

	    <% if(testUser!=null){ %>
             <img src="profile_image_url.jpg" alt="Profile Image">
	         <div>
	         	<span>쿠키언니 님</span><br>
	         	<a href="#">마이페이지</a>&nbsp;&nbsp;<a href="<%=contextPath%>/logoutTest">로그아웃</a>
	         </div> 
          <%}else{%>
             <div><a href="#">회원가입</a>&nbsp;&nbsp;<a href="<%=contextPath%>/loginTest">로그인</a></div>
          <%} %>

	 </div>
</div>

</body>
</html>