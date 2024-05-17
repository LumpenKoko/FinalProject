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
<%@ include file="../common/common-file.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>


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
    <div id="header-logo" >
        <div class="gugi-regular">멍냥</div>
        <div style="font-size: 30px; color:#FE8B94; width:100% float:left;">가이드</div>
    </div>

    <div id="header-menu">
        <ul>
            <li><span>지도</span></li>
            <li><span>커뮤니티</span></li>
            <li><span>대시보드</span></li>
        </ul>
    </div>

    <div id="header-search" >
        <input type="text" placeholder="장소를 검색하세요" style="text-align:left;">
        <button id="header-search-button" type="button">🔍</button>
    </div>

   <!-- 로그여부 조건 처리 필요 -->
    <div id="header-login">

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