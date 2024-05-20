<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageBoardList.css" />
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
                                    onclick="location.href='<%=request.getContextPath()%>/myPageMain.mp'">작성한 리뷰
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
                                <div id="info"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageInfo.mp'">개인정보
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
                            <div id="right1">
                                <span onclick="location.href='<%=request.getContextPath()%>/myPageBoard.mp'"
                                    id="board">게시글</span>
                                <span>&nbsp;/&nbsp;</span>
                                <span onclick="location.href='<%=request.getContextPath()%>/myPageShorts.mp'"
                                    id="shorts">쇼츠</span>
                            </div>
                            <div id="right2">
                                <div id="right2-left">
                                    <div style="height: 45px;">
                                        <span id="category">여행/숙소</span>
                                        <span id="title">강화도 애견 펜션 메이비 / 강화도 공원</span>
                                    </div>
                                    <div style="height: 100px;">
                                        <p id="content">강화도에 아이들한테 특화된 펜션이 있다고 해서 찾아가봤다. 앞에 마당 넓이도 넓고 깨끗하고 괜찮았다.
                                            강화도에 아이들한테 특화된 펜션이 있다고 해서 찾아가봤다. 앞에 마당 넓이도 넓고 깨끗하고...</p>
                                    </div>
                                    <div id="bottom">
                                        <span id="watch">조회수 30</span>
                                        <span id="reply">댓글 8</span>
                                        <span id="day">2024.00.00</span>
                                    </div>
                                </div>
                                <div id="right2-right">
                                    <div id="right2-right-top">
                                        <img src="<%=request.getContextPath()%>/resources/img/myPage/board.png">
                                    </div>
                                    <div id="right2-right-bottom">
                                        <span style="color: #bababa; cursor: pointer;" onclick="">수정</span>
                                        <span style="color: #bababa; cursor:default;">｜</span>
                                        <span style="color: #bababa; cursor: pointer;" onclick="">삭제</span>
                                    </div>
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