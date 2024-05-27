<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPageWishList.css" />
        <link rel="stylesheet" href="resources/css/common/common.css" />
    </head>

    <body>

        <%@ include file="../common/header.jsp" %>

            <div class="wrapper main_wrapper">
                <div class="main_main">
                    <div id="left">
                        <div id="main_main_left">
                            <div id="main_main_left1">
                                <img src="resources/img/myPage/camera.png"
                                    onclick="document.getElementById('fileInput').click()" id="camera">
                                <div id="profile" style="background-image: url(resources/img/myPage/profile.png)">
                                <input type="file" id="fileInput" style="display: none;">
                                </div>
                                <p id="nickName">토리형</p>
                                <div id="solidMain"></div>
                                <p id="pets">반려동물</p>
                                <p id="petProfileName">토리</p>
                            </div>
                            <div id="main_main_left2">
                                <div id="main" onclick="location.href='<%=request.getContextPath()%>/myPageMain.mp'">작성한
                                    리뷰
                                </div>
                                <div id="wishList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageWish.mp'">찜 목록
                                </div>
                                <div id="coupon"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageCoupon.mp'">쿠폰 목록
                                </div>
                                <div id="boardList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageBoard.mp'">게시글 / 쇼츠 목록
                                </div>
                                <div id="info" onclick="location.href='<%=request.getContextPath()%>/myPageInfo.mp'">
                                    개인정보
                                </div>
                                <div style="border-style: none;" id="petInfo"
                                    onclick="location.href='<%=request.getContextPath()%>/myPagePetInfo.mp'">반려동물 정보
                                </div>
                            </div>
                            <div id="main_main_left3">
                                <div id="chatting">채팅 목록</div>
                            </div>
                        </div>
                    </div>
                    <div id="right">
                        <div id="main_main_right">
                            <div id="right1">찜 목록</div>
                            <div id="right2">
                                <div id="right2-left" onclick="location.href='<%=request.getContextPath()%>/detail'" style="cursor: pointer;">
                                    <img src="resources/img/myPage/cafe.png" id="cafe">
                                </div>
                                <div id="right2-right" style="height: 80%;">
                                    <div id="right2-right1">
                                        <div id="top">
                                            <span id="title" onclick="location.href='<%=request.getContextPath()%>/detail'" style="cursor: pointer;">샘플 카페 하이 구로하우비점</span>
                                            <div id="wishIcon" onclick="changeColor()">♡</div>
                                            <div id="count">45</div>
                                        </div>
                                        <div id="category" onclick="location.href='<%=request.getContextPath()%>/detail'" style="cursor: pointer;">
                                            <span id="category1">분류</span>
                                            <span id="category2">카페</span>
                                        </div>
                                        <div id="score" onclick="location.href='<%=request.getContextPath()%>/detail'" style="cursor: pointer;">
                                            <span id="score1">평점</span>
                                            <span id="score2">4.3</span>
                                            <span id="score3">★★★★★</span>
                                        </div>
                                        <div id="type" onclick="location.href='<%=request.getContextPath()%>/detail'" style="cursor: pointer;">
                                            <span id="type1">종류</span>
                                            <span id="type2">소형견,중형견,고양이</span>
                                        </div>
                                        <div id="solid">
                                            <div id="solid2"></div>
                                        </div>
                                    </div>
                                    <div id="right2-right2" onclick="location.href='<%=request.getContextPath()%>/detail'" style="cursor: pointer;">
                                        <div id="address">
                                            <img src="resources/img/myPage/address.png" id="address1">
                                            <span id="address2">부산광역시 해운대 극성로 북6길</span>
                                        </div>
                                        <div id="phone">
                                            <img src="resources/img/myPage/phone.png" id="phone1">
                                            <span id="phone2">02-1234-5678</span>
                                        </div>
                                        <div id="time">
                                            <img src="resources/img/myPage/time.png" id="time1">
                                            <span id="time2">영업 중</span>
                                            <span id="time3">22:00</span>
                                            <span id="time4">종료</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="container"></div>
                            <div id="right7">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function changeColor() {
                    var icon = document.getElementById('wishIcon');
                    if (icon.style.color !== 'rgb(254, 139, 148)') {
                        icon.style.color = '#FE8B94';
                        icon.innerHTML = '♥';
                    } else {
                        icon.style.color = '';
                        icon.innerHTML = '♡';
                    }
                }

                document.getElementById('fileInput').addEventListener('change', function () {
                    var file = this.files[0];
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        document.getElementById('profile').style.backgroundImage = "url('" + e.target.result + "')";
                    }

                    reader.readAsDataURL(file);
                });
            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>