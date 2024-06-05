<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="resources/css/community/community.css"/>
    <script src="resources/js/community/shorts/init.js"></script>
    <script src="resources/js/community/shorts/shortsEnroll.js"></script>
</head>

<body onload="init('${loginUser.userNo}')" >
	<%@ include file="../common/header.jsp"%>
	<div class="wrapper">
        <div class="main">
            <div class="community-area" style="height:750px;">
                <div class="row-box">
                    <div class="flex-box" style="width: 100%; height: 600px;">
                        <div id="uploadVideo" class="community-area col-box" style="width: 90%; height: 90%; margin: 15px; background-color: var(--background-color);">
                               <label for="videoInput" >
                                    <div><h1>&#43; 동영상 업로드</h1></div>
                                    <video id="video" src="resources/img/video.png" alt="동영상" style="width: 100%; height: 100%">
                                    <div style="height: 10px;"></div>
                                    <input id ="videoInput" type="file"  name ="videoFile" class="file-video" hidden>
                              </label>
                        </div>
                    </div>
                    <div style="width: 55%; height: 500px;">
                        <div class="row-box" style="height: 12%;">
                            <h1>썸네일 선택</h1>
                        </div>
                        <div class="row-box" style="width:750px; height:200px; margin-bottom: 20px;">

                            <div class="flex-box" style="width:700px; height:100%;">
                                <label id="Thumnail-background" for="Thunmailfile" class="community-area col-box" style="width:600px; height:100%;
                                	 background: url(resources/img/myPage/+.png)  no-repeat center center/cover;">
                                    <div style="width:600px; height:100%; text-align: center;">
                                        <input id ="Thunmailfile" type="file" name="thumnailFile" class="file-thumnail" hidden>
                                    </div>
                                </label>
                               
                            </div>
                        </div>

                        <div class="row-box" style="height: 12%; padding: 15px;">
                            <h1>세부내용 입력</h1>
                        </div>
                        <div class="flex-box" style="height: 32%;">
                            <textarea type="text" placeholder="내용을 입력하세요" style="width: 95%; height: 90%; border-radius: 10px; resize: none; padding:20px; font-size:20px;"></textarea>
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