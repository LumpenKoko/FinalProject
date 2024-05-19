<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageCoupon.css" />
    </head>

    <body>

        <%@ include file="../common/header.jsp"%>

            <div class="wrapper main_wrapper">
                <div class="main_main">
                    <div id="left">
                        <div id="main_main_left">
                            <div id="main_main_left1">
                                <img src="<%=request.getContextPath()%>/resources/img/myPage/camera.png" onclick="" id="camera">
                                <div id="profile"
                                    style="background-image: url(<%=request.getContextPath()%>/resources/img/myPage/profile.png)">
                                </div>
                                <p id="nickName">토리형</p>
                                <div id="solid"></div>
                                <p id="pet">반려동물</p>
                                <p id="petName">토리</p>
                            </div>
                            <div id="main_main_left2">
                                <div id="mainList" onclick="location.href='<%=request.getContextPath()%>/myPageMain.mp'">작성한 리뷰</div>
                                <div id="wishList" onclick="location.href='<%=request.getContextPath()%>/myPageWish.mp'">찜 목록</div>
                                <div id="coupon" onclick="location.href='<%=request.getContextPath()%>/myPageCoupon.mp'">쿠폰 목록</div>
                                <div id="boardList" onclick="location.href='<%=request.getContextPath()%>/myPageBoard.mp'">게시글 / 쇼츠 목록</div>
                                <div id="info"
                                onclick="location.href='<%=request.getContextPath()%>/myPageInfo.mp'">개인정보</div>
                                <div style="border-style: none;" id="petInfo">반려동물 정보</div>
                            </div>
                            <div id="main_main_left3">
                                <div id="chatting">채팅 목록</div>
                            </div>
                        </div>
                    </div>
                    <div id="right">
                        <div id="main_main_right">
                            <div id="right1">쿠폰 목록</div>
                            <div id="right2">
                                <div id="right2-left">
                                    <div id="top">AAA카페 송파점</div>
                                    <div id="mid">10000원 할인</div>
                                    <div id="bottom">2024.05.10 ~ 2024.11.02</div>
                                </div>
                                <div id="right2-right">
                                    <button id="use">사용하기</button>
                                </div>
                            </div>
                            <div id="right3" style="margin-bottom: 30px;">
                                <div id="right3-left">
                                    <div id="top">AAA카페 송파점</div>
                                    <div id="mid">10000원 할인</div>
                                    <div id="bottom">2024.05.10 ~ 2024.11.02</div>
                                </div>
                                <div id="right3-right">
                                    <button id="none">사용하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // 복제할 원본 div 요소를 가져옵니다
                var originalDiv = document.getElementById('right2');
            
                // 새로운 div를 생성하고 복제한 후 container에 추가합니다
                for (var i = 0; i < 2; i++) {
                    var newDiv = originalDiv.cloneNode(true); // true를 전달하여 하위 요소들도 함께 복제합니다
                    document.getElementById('container').appendChild(newDiv);
                }
            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>