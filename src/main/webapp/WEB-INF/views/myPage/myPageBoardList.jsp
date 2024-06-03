<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPageBoardList.css" />
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
                            <c:forEach var="board" items="${BoardList}">
                                <div id="right2" onclick="location.href='<%=request.getContextPath()%>/community'"
                                    style="cursor: pointer;">
                                    <div id="right2-left">
                                        <div style="height: 45px;">
                                            <span id="category">${board.categoryNo}</span>
                                            <span id="title">${board.boardTitle}</span>
                                        </div>
                                        <div style="height: 100px;">
                                            <p id="content">${board.boardContent}</p>
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
                                            <span style="color: #bababa; cursor: pointer;" onclick="">수정</span>
                                            <span style="color: #bababa; cursor:default;">｜</span>
                                            <span style="color: #bababa; cursor: pointer;" onclick="">삭제</span>
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

            <script>
                document.getElementById('fileInput').addEventListener('change', function () {
                    var file = this.files[0];
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        document.getElementById('profile').style.backgroundImage = "url('" + e.target.result + "')";
                    }

                    reader.readAsDataURL(file);
                });

                var petNames = ["반려동물1", "반려동물2", "반려동물3"]; // 실제로는 해당 데이터를 서버로부터 받아와야 합니다.

                // 반려동물 이름을 표시할 요소
                var petNamesElement = document.getElementById("petNames");

                // 각 반려동물의 이름을 동적으로 생성하여 요소에 추가
                for (var i = 0; i < petNames.length; i++) {
                    var petNameElement = document.createElement("p");
                    petNameElement.textContent = petNames[i];
                    petNamesElement.appendChild(petNameElement);
                }
            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>