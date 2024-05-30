<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.mng.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
    
    //로그인 유저 정의
	Member loginUser = (Member)session.getAttribute("loginUser");
    
    //로그인 유저 테스트
   
    //String testUser=(String)session.getAttribute("loginUser");
    String alertMsg = (String)session.getAttribute("alertMsg");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common/header.css"/>
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
    <div id="header-logo" onclick="location.href='<%=contextPath%>'">
        <div class="gugi-regular">멍냥</div>
        <div style="font-size: 30px; color:#FE8B94; width:100% float:left;">가이드</div>
    </div>

    <div id="header-menu">
        <ul>
            <c:choose>
                <c:when test="${not empty loginUser && loginUser.userKind eq 'Y'}">
                    <li><a href="<%=contextPath%>/bossMainPage.bm">보스페이지</a></li>
                </c:when>
                <c:otherwise>
                    <li><span>지도</span></li>
                    <li><a href="<%=contextPath%>/community">커뮤니티</a></li>
                    <li><a href="<%=contextPath%>/myPageMain.mp">대시보드</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <div id="header-search" >
        <form action="<%=contextPath%>/searchKeyword.pl?cpage=1">
            <input type="text" name="keyword" placeholder="장소를 검색하세요" style="text-align:left;">
            <button id="header-search-button" type="submit">🔍</button>
        </form>
    </div>

   <!-- 로그여부 조건 처리 필요 -->
    <div id="header-login">

	    <% if(loginUser != null){ %>
            <c:choose>
                <c:when test="${loginUser.userKind eq 'N'}">
                    <img src="profile_image_url.jpg" alt="Profile Image">
                    <div>
                        <span>${loginUser.userNickname}</span><br>
                         <a href="<%=contextPath%>/myPageMain.mp">마이페이지</a>&nbsp;&nbsp;<a href="<%=contextPath%>/logout.me">로그아웃</a>
                    </div> 
                </c:when>
                <c:otherwise>
                    <div>
                        <a href="<%=contextPath%>/logout.me">로그아웃</a>
                    </div> 
                </c:otherwise>
            </c:choose>
        
        <% } else { %>
            <div><a href="<%=contextPath%>/memberEnrollSelectForm.me">회원가입</a>&nbsp;&nbsp;<a href="<%=contextPath%>/loginForm.me">로그인</a></div>
        <% } %>

	 </div>
</div>

</body>
</html>