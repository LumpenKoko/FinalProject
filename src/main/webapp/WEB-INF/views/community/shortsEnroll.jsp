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
        <div class="contents-box tmp-box row-box">
            <div class="tmp-box">
                <div class="tmp-box contents-box" style="background-color: gray;">+동영상 업로드</div>
            </div>
            <div class="tmp-box">
                <div class="tmp-box"><strong>썸네일 선택</strong></div>
                <div class="tmp-box row-box">
                    <div class="contents-box tmp-box">사진등록</div>
                    <div class="contents-box" style="background-color: gray;">사진등록</div>
                    <div class="contents-box" style="background-color: gray;">사진등록</div>
                    <div class="contents-box" style="background-color: gray;">사진등록</div>
                </div>
                <div class="tmp-box"><strong>세부 내용 작성</strong></div>
                <div class="tmp-box"><input type="text" placeholder="내용을 입력하세요"></div>
                <div class="tmp-box row-box">
                    <div class="tmp-box">아이콘</div>
                    <div class="tmp-box">
                        <select name="showRange">
                            <option value="public" selected>공개</option>
                            <option value="private">비공개</option>
                        </select>
                        <button>쇼츠등록</button>
                    </div>
                    <div class="tmp-box"></div>
                </div>
            </div>
        </div>
    </div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>