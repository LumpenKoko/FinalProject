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


<body>
    <div class="headerbar">
        <%@ include file="../common/header.jsp"%>
    </div>
    <input type="hidden" id="contextPath" value="${request.getContextPath()}%>" />
    <input type="hidden" id="userNo" value="${userNo}" />
    
    <div class="wrapper">
        <div class="main">
            <div style="height: 100px;"></div>
            <div id="container"></div>
            <div id="loader">Loading...</div>
        </div>
    </div>
</body>
</html>
