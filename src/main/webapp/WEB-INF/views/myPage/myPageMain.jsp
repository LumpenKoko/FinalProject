<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPageMain.css" />
    </head>

    <body>

        <%@ include file="../common/header.jsp"%>

            <div class="wrapper main_wrapper">
                <div class="main_main">
                    <div id="left">
                        <div id="main_main_left">
                            <div id="main_main_left1">
                                <img src="resources/img/myPage/camera.png" onclick="" id="camera">
                                <div id="profile"
                                    style="background-image: url(resources/img/myPage/profile.png)">
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
                            <div id="right1">작성한 리뷰</div>
                            <div id="right2">
                                <div id="right2-top">
                                    <div id="right2-top1">
                                        <div><img src="resources/img/myPage/profile.png" id="reviewProfile"></div>
                                        <div id="top1Text">
                                            <p style="margin-top: 20px; margin-bottom: 0px; font-size: 18px; font-weight: bold; text-align: left;">토리형</p>
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
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2018/05/09155809/KakaoTalk_Moim_4AWlBQu0MIdS4z9cheGIreazGTaSR3-1024x800.jpg" alt="">
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2018/05/09155809/KakaoTalk_Moim_4AWlBQu0MIdS4z9cheGIreazGTaSR3-1024x800.jpg" alt="">
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2018/05/09155809/KakaoTalk_Moim_4AWlBQu0MIdS4z9cheGIreazGTaSR3-1024x800.jpg" alt="">
                                </div>
                                <div id="right2-bottom">
                                    <p style="text-align: left; overflow: initial; white-space: initial;">댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</p>
                                </div>
                            </div>
                            <div id="container"></div>
                            <div id="right5">
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