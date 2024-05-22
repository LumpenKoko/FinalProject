<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPagePetInfo.css" />
    </head>

    <body>

        <%@ include file="../common/header.jsp" %>

            <div class="wrapper main_wrapper">
                <div class="main_main">
                    <div id="left">
                        <div id="main_main_left">
                            <div id="main_main_left1">
                                <img src="resources/img/myPage/camera.png" onclick=""
                                    id="camera">
                                <div id="profile"
                                    style="background-image: url(resources/img/myPage/profile.png)">
                                </div>
                                <p id="nickName">토리형</p>
                                <div id="solid"></div>
                                <p id="pets">반려동물</p>
                                <p id="petProfileName">토리</p>
                            </div>
                            <div id="main_main_left2">
                                <div id="mainList"
                                    onclick="location.href='/myPageMain.mp'">작성한 리뷰
                                </div>
                                <div id="wishList"
                                    onclick="location.href='/myPageWish.mp'">찜 목록
                                </div>
                                <div id="coupon"
                                    onclick="location.href='/myPageCoupon.mp'">쿠폰 목록
                                </div>
                                <div id="boardList"
                                    onclick="location.href='/myPageBoard.mp'">게시글 / 쇼츠 목록
                                </div>
                                <div id="info"
                                    onclick="location.href='/myPageInfo.mp'">개인정보
                                </div>
                                <div style="border-style: none; color: #FE8B94;" id="petInfo"
                                    onclick="location.href='/myPagePetInfo.mp'">반려동물 정보
                                </div>
                            </div>
                            <div id="main_main_left3">
                                <div id="chatting">채팅 목록</div>
                            </div>
                        </div>
                    </div>
                    <div id="right">
                        <div id="main_main_right">
                            <div id="right1">
                                <p id="contentText">아직 등록하신 반려동물이 없으시네요!<br>지금 바로 반려동물을 등록하고 행복한 동행을 시작해보세요.</p>
                                <button type="submit" id="signUp" onclick="location.href='/myPagePetSignUp.mp'">반려동물 등록하기</button>
                            </div>
                            <div id="right2">
                                <h1>반려동물 1</h1>
                                <div id="right2-container">
                                    <div id="right2-left">
                                        <img src="resources/img/myPage/petProfile.png" id="petProfile" onclick="">
                                        <p style="font-size: 18px; color: #FE8B94;margin-top: 10px;">사진 클릭시 사진 변경 가능</p>
                                        <button type="submit" id="update">수정</button>
                                    </div>
                                    <div id="right2-right" style="display: flex; flex-direction: column;">
                                        <div>
                                            <p style="font-size: 18px; margin-bottom: 0px; text-align: left;">이름</p>
                                            <input type="text" id="petName" placeholder="이름">
                                        </div>
                                        <div style="margin-top: 30px;">
                                            <p style="font-size: 18px; margin-bottom: 0px; text-align: left;">생일</p>
                                            <input type="date" id="birth">
                                        </div>
                                        <div style="margin-top: 30px;">
                                            <p style="font-size: 18px; margin-bottom: 0px; text-align: left;">크기</p>
                                            <select name="category" id="category">
                                                <option value="소형견">소형견</option>
                                                <option value="중형견">중형견</option>
                                                <option value="대형견">대형견</option>
                                                <option value="고양이">고양이</option>
                                            </select>
                                        </div>
                                        <div id="gender-input">
                                            <input type="radio" name="gender" id="men" value="남아">
                                            <label for="men">남아</label>                               
                                            <input type="radio" name="gender" id="women" value="여아">
                                            <label for="women">여아</label>
                                        </div>
                                        <button type="submit" id="update" style="margin-top: 50px;">수정</button>
                                    </div>
                                </div>
                            </div>
                            <div id="right3">
                                <button id="addSignUp">반려동물 추가 등록하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>