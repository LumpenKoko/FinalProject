<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPageBoardList.css" />
        <link rel="stylesheet" href="resources/css/common/common.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="resources/js/myPage/myPageBoardList.js"></script>
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
                                <div id="profile" style="background-image: url(${profileImg.filePath}${profileImg.changeName})">
                                    <input type="file" id="fileInput" style="display: none; background-position: center; background-repeat: no-repeat; background-size: cover;"
                                        onchange="uploadProfileImage('<%=request.getContextPath()%>')">
                                </div>
                                <input type="file" id="fileInput" style="display: none;">
                                <p id="nickName" style="margin-bottom: 10px;">${loginUser.userNickname}</p>
                                <div id="solid"></div>
                                <p id="pets">반려동물</p>
                                <c:forEach var="pet" items="${petList}" varStatus="loop">
                                    <span id="petProfileName"
                                        style="text-align: center; overflow: initial; white-space: initial;">
                                        ${pet.petName}<c:if test="${not loop.last}">&nbsp;&</c:if>
                                    </span>
                                </c:forEach>
                            </div>
                            <div id="main_main_left2">
                                <div id="mainList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageMain.mp'">작성한 리뷰
                                </div>
                                <div id="wishList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageWish.mp'">공감 목록
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
                            <div id="right1">
                                <span onclick="location.href='<%=request.getContextPath()%>/myPageBoard.mp'"
                                    id="board">게시글</span>
                                <span>&nbsp;/&nbsp;</span>
                                <span onclick="location.href='<%=request.getContextPath()%>/myPageShorts.mp'"
                                    id="shorts">쇼츠</span>
                            </div>
                            <c:forEach var="board" items="${BoardList}" varStatus="loop">
                                <div id="right2" style="cursor: pointer;">
                                    <div id="right2-left">
                                        <div style="height: 45px;">
                                            <span id="category">${board.categoryName}</span>
                                            <span id="title">${board.boardTitle}</span>
                                        </div>
                                        <div style="height: 100px;">
                                            <p id="content" style="width: 100%;">${board.boardContent}</p>
                                            <div id="updateForm" style="margin-left: 20px;">
                                                <input type="text"
                                                    style="width: 400px; height: 40px; border: 1px solid #bababa;
                                                    border-top-left-radius: 15px; border-bottom-left-radius: 15px; float: left; padding-left: 10px;">
                                                <button></button>
                                                <button></button>
                                            </div>
                                        </div>
                                        <div id="bottom">
                                            <span id="watch">${board.count}</span>
                                            <span id="reply">${board.replyCount}</span>
                                            <span id="day">${board.createDate}</span>
                                        </div>
                                    </div>
                                    <div id="right2-right">
                                        <div id="right2-right-top">
                                            <img src="resources/img/myPage/board.png">
                                        </div>
                                        <div id="right2-right-bottom" style="margin-left: 85px;">
                                            <span style="color: #bababa; cursor: pointer;"
                                                onclick="ShowUpdateForm(this)">수정</span>
                                            <span style="color: #bababa; cursor:default;">｜</span>
                                            <span style="color: #bababa; cursor: pointer;"
                                                onclick="deleteBoard('${board.boardNo}', '<%=request.getContextPath()%>')">삭제</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div id="right7">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>