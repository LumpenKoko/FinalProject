<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="resources/css/community/community.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="wrapper">
        <div class="main">
            <div class="community-area">
                <div class="tmp-box row-box">
                    <div class="tmp-box flex-box" style="width: 45%; height: 600px;">
                        <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);">
                            <h1>+ 동영상 업로드</h1>
                        </div>
                    </div>
                    <div class="tmp-box" style="width: 55%; height: 600px;">
                        <div class="tmp-box" style="height: 12%;">
                            <h1>썸네일 선택</h1>
                        </div>
                        <div class="tmp-box row-box" style="height: 32%;">
                            <div class="tmp-box" style="width: 25%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);">
                                    test1
                                </div>    
                            </div>
                            <div class="tmp-box" style="width: 25%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);"></div>  
                            </div>
                            <div class="tmp-box" style="width: 25%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);"></div>  
                            </div>
                            <div class="tmp-box" style="width: 25%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);"></div>  
                            </div>
                        </div>
                        <div class="tmp-box" style="height: 12%;">
                            <h1>세부내용 입력</h1>
                        </div>
                        <div class="tmp-box flex-box" style="height: 32%;">
                            <input type="text" placeholder="내용을 입력하세요 *nowrap 해결해야함" style="width: 90%; height: 90%; margin: 15px; border-radius: 10px;">
                        </div>
                        <div class="tmp-box" style="height: 12%;">
                            <select name="showRange" style="border-radius: 15px;">
                                <option value="public" selected>공개</option>
                                <option value="private">비공개</option>
                            </select>
                            <button class="common-button pink-button">쇼츠등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	
	
	<!-- <div class="community-wrapper">
        <div class="contents-box tmp-box row-box">
            <div class="tmp-box">
                <div class="tmp-box contents-box" style="background-color: var(--border-color)">+동영상 업로드</div>
            </div>
            <div class="tmp-box">
                <div class="tmp-box"><strong>썸네일 선택</strong></div>
                <div class="tmp-box row-box">
                    <div class="contents-box tmp-box">사진등록</div>
                    <div class="contents-box" style="background-color: var(--border-color)">사진등록</div>
                    <div class="contents-box" style="background-color: var(--border-color)">사진등록</div>
                    <div class="contents-box" style="background-color: var(--border-color)">사진등록</div>
                </div>
                <div class="tmp-box"><strong>세부 내용 작성</strong></div>
                <div class="tmp-box"><input type="text" placeholder="내용을 입력하세요"></div>
                <div class="tmp-box row-box">
                    <div class="tmp-box">아이콘</div>
                    <div class="tmp-box">
                        <select name="showRange" style="border-radius: 15px;">
                            <option value="public" selected>공개</option>
                            <option value="private">비공개</option>
                        </select>
                        <button class="pink-button">쇼츠등록</button>
                    </div>
                    <div class="tmp-box"></div>
                </div>
            </div>
        </div>
    </div> -->
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>