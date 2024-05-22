<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPagePetSignUp.css" />
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
                            <form action="" id="petSighUp">
                                <h1 style="margin-top: 50px;">반려동물 등록</h1>
                                <p style="margin-top: 40px; font-size: 17px;">반려동물 정보를 입력해<br>행복한 멍냥 가이드를 누려보세요</p>
                                <div style="margin-left: 100px; margin-top: 30px; font-size: 21px; display: flex; flex-direction: column;">
                                    <div style="margin-top: 40px;">
                                        <span style="float: left; margin-bottom: 0px;">이름</span>
                                        <span style="color: #FE8B94; float: left; margin-bottom: 0px;">*</span>
                                        <span style="color: red; float: left; margin-left: 30px;">필수 항목입니다</span>
                                    </div>
                                    <div>
                                    <input type="text" placeholder="이름을 입력하세요" id="nameInput">
                                    </div>
                                </div>
                                <div style="margin-left: 100px; margin-top: 40px; font-size: 21px;">
                                    <select name="category" id="category">
                                        <option value="소형견">소형견</option>
                                        <option value="중형견">중형견</option>
                                        <option value="대형견">대형견</option>
                                        <option value="고양이">고양이</option>
                                    </select>
                                </div>
                                <div style="margin-left: 100px; font-size: 21px; margin-top: 40px;">
                                    <span style="float: left;">생일</span><br>
                                    <input type="date" id="birth">
                                </div>
                                <div id="gender-input">
                                    <input type="radio" name="gender" id="men" value="남아">
                                    <label for="men">남아</label>                               
                                    <input type="radio" name="gender" id="women" value="여아">
                                    <label for="women">여아</label>
                                </div>
                                <div style="margin-left: 100px; font-size: 21px; margin-top: 40px;">
                                    <span style="float: left;">사진</span><br>
                                    <div id="imgInput" onclick=""
                                        style="background-image: url(resources/img/myPage/+.png);"></div>
                                </div>
                                <button type="submit" id="submit">등록하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>