<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <%@ include file="./common/common-file.jsp"%>

        <link rel="stylesheet" href="resources/css/myPage/myPageMain.css" />
        <link rel="stylesheet" href="resources/css/common/common.css" />
    </head>

    <body>

        <%@ include file="../common/header.jsp" %>

            <div class="wrapper main_wrapper">
                <div class="main_main">
                    <div id="left">
                        <div id="main_main_left">
                            <div id="main_main_left1">
                                <img src="resources/img/myPage/camera.png" onclick="document.getElementById('fileInput').click()" id="camera">
                                <div id="profile" style="background-image: url(resources/img/myPage/profile.png)">
                                <input type="file" id="fileInput" style="display: none;">
                                </div>
                                <p id="nickName">토리형</p>
                                <div id="solid"></div>
                                <p id="pets">반려동물</p>
                                <p id="petProfileName">토리</p>
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
                            <div id="right1">작성한 리뷰</div>
                            <div id="right2">
                                <div id="right2-top">
                                    <div id="right2-top1">
                                        <div><img src="resources/img/myPage/profile.png" id="reviewProfile"></div>
                                        <div id="top1Text">
                                            <p
                                                style="margin-top: 20px; margin-bottom: 0px; font-size: 18px; font-weight: bold; text-align: left;">
                                                토리형</p>
                                            <p style="margin-top: 0px; font-size: 13px; color: #bababa;">2024.05.10</p>
                                        </div>
                                    </div>
                                    <div id="right2-top2">
                                        <span style="margin-right: 5px; color: #FE8B94; cursor:default;">★★★★★</span>
                                        <span style="color: #bababa;">수정</span>
                                        <span style="color: #bababa; cursor:default;">｜</span>
                                        <span style="color: #bababa;">삭제</span>
                                    </div>
                                </div>
                                <div id="right2-mid">
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2018/05/09155809/KakaoTalk_Moim_4AWlBQu0MIdS4z9cheGIreazGTaSR3-1024x800.jpg"
                                        alt="">
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2018/05/09155809/KakaoTalk_Moim_4AWlBQu0MIdS4z9cheGIreazGTaSR3-1024x800.jpg"
                                        alt="">
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2018/05/09155809/KakaoTalk_Moim_4AWlBQu0MIdS4z9cheGIreazGTaSR3-1024x800.jpg"
                                        alt="">
                                </div>
                                <div id="right2-bottom">
                                    <p style="text-align: left; overflow: initial; white-space: initial;">
                                        댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</p>
                                </div>
                            </div>
                            <div id="container"></div>
                            <div id="right3">
                                <span>1  2  3  4  5  6  7  8  9  10</span>
                                <span>▶</span>
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
            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>