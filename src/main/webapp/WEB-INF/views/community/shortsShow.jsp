<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@ include file="../common/common-file.jsp" %>
    
    <link rel="stylesheet" href="resources/css/community/community.css"/>
    <script src="resources/js/community/shorts/shortsShow.js"></script>
</head>


<body onload="init('${contextPath}','${loginUser.userNo}')">
    <div class="headerbar">
        <%@ include file="../common/header.jsp"%>
    </div>
    <div class="wrapper">
        <div class="main">
            <div id="container"></div>
            <div id="loader">Loading...</div>
        </div>
    </div>
</body>
</html>
