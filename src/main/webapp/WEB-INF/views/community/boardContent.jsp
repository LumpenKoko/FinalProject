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
        <div class="tmp-box contents-box">

            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box"><h1>제목</h1></div>
                    <div class="tmp-box">말머리</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">조회수</div>
                    <div class="tmp-box">등록일</div>
                </div>
            </div>

            <div class="tmp-box">
                <div class="tmp-box">사진</div>
                <div>글 내용</div>
                <div class="row-box">
                    <div class="tmp-box">좋아요 아이콘</div>
                    <div class="tmp-box">좋아요 n</div>
                    <div class="tmp-box">댓글 아이콘</div>
                    <div class="tmp-box">댓글 n</div>
                </div>
            </div>

            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box">시간</div>
                    <div class="tmp-box">답글달기</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div>댓글 내용</div>
            </div>
            <hr>
            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box">시간</div>
                    <div class="tmp-box">답글달기</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div>댓글 내용</div>
            </div>
            <hr>
            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box">시간</div>
                    <div class="tmp-box">답글달기</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div>댓글 내용</div>
            </div>
            <hr>
            <div>
                <div class="row-box">
                    <div class="tmp-box">아이콘</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box"><button>댓글 등록</button></div>
                </div>
                <input type="text" placeholder="댓글을 작성하세요.">
            </div>
        </div>
    </div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>