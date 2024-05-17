<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/community.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="community-wrapper">
        <div class="flex-box row-box">
            <div class="tmp-box">동영상</div>
            <div class="tmp-box">댓글</div>
        </div>
        <div class="flex-box tmp-box">동영상</div>
        <div class="flex-box tmp-box">동영상</div>
    </div>
</body>
</html>