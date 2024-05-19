<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageShortsList.css" />
    </head>

    <body>

        <%@ include file="../common/header.jsp" %>

            <div class="wrapper main_wrapper">
                <div class="main_main">
                    <div id="left">
                        <div id="main_main_left">
                            <div id="main_main_left1">
                                <img src="<%=request.getContextPath()%>/resources/img/myPage/camera.png" onclick=""
                                    id="camera">
                                <div id="profile"
                                    style="background-image: url(<%=request.getContextPath()%>/resources/img/myPage/profile.png)">
                                </div>
                                <p id="nickName">토리형</p>
                                <div id="solid"></div>
                                <p id="pet">반려동물</p>
                                <p id="petName">토리</p>
                            </div>
                            <div id="main_main_left2">
                                <div id="mainList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageMain.mp'">작성한 리뷰</div>
                                <div id="wishList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageWish.mp'">찜 목록</div>
                                <div id="coupon"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageCoupon.mp'">쿠폰 목록</div>
                                <div id="boardList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageBoard.mp'">게시글 / 쇼츠 목록
                                </div>
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
                            <div id="right1">
                                <span onclick="location.href='<%=request.getContextPath()%>/myPageBoard.mp'"
                                    id="board">게시글</span>
                                <span>&nbsp;/&nbsp;</span>
                                <span onclick="location.href='<%=request.getContextPath()%>/myPageShorts.mp'"
                                    id="shortsList">쇼츠</span>
                            </div>
                            <div id="right2"
                            style="background-size:cover; background-image: url(<%=request.getContextPath()%>/resources/img/myPage/board.png);">
                                <div style="width: 100%; height: 50%;"></div>
                                <div style="width: 100%; height: 50%;">
                                    <div id="writer">쿠키언니</div>
                                    <div id="day">2024.05.02</div>
                                    <div id="content" style="overflow: initial; white-space: initial;">쿠키 데리고 처음으로 한강공원 갔는...</div>
                                </div>
                            </div>
                            <div id="right7">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>