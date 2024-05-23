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
                <div class="row-box">
                    <div class="flex-box" style="width: 45%; height: 600px;">
                        <div id="uploadVideo" class="community-area col-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);">
                            <img src="resources/img/video.png" alt="동영상" style="width: 80px; height: 80px;">
                            <div style="height: 10px;"></div>
                            <div><h1>&#43; 동영상 업로드</h1></div>
                        </div>
                    </div>
                    <div style="width: 55%; height: 600px;">
                        <div class="row-box" style="height: 12%; padding: 15px;">
                            <h1>썸네일 선택</h1>
                        </div>
                        <div class="row-box" style="height: 32%;">
                            <div class="flex-box" style="width: 25%; height: 100%;">
                                <div id="choicePic" class="community-area col-box" style="width: 90%; height: 90%; margin: 15px;">
                                    <h1>&#43;</h1>
                                    <div>사진선택</div>
                                </div>
                            </div>
                            <div class="flex-box" style="width: 25%; height: 100%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);"></div>  
                            </div>
                            <div class="flex-box" style="width: 25%; height: 100%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);"></div>  
                            </div>
                            <div class="flex-box" style="width: 25%; height: 100%;">
                                <div class="community-area flex-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);"></div>  
                            </div>
                        </div>
                        <div class="row-box" style="height: 12%; padding: 15px;">
                            <h1>세부내용 입력</h1>
                        </div>
                        <div class="flex-box" style="height: 32%;">
                            <input type="text" placeholder="내용을 입력하세요" style="width: 95%; height: 90%; border-radius: 10px;">
                        </div>
                        <div class="right-box" style="height: 12%; padding: 15px;">
                            <div>
                                <img src="resources/img/earth.png" alt="지구이미지" width="50px" height="50px">
                            </div>
                            <div style="width: 20px;"></div>
                            <div>
                                <select name="showRange" style="border-radius: 50px; padding: 10px 20px;">
                                    <option value="public" selected>공개</option>
                                    <option value="private">비공개</option>
                                </select>
                            </div>
                            <div style="width: 20px;"></div>
                            <div>
                                <button class="common-button pink-button">쇼츠등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>