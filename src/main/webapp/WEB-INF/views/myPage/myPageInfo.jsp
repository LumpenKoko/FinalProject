<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPageInfo.css" />
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
                                </div>
                                <input type="file" id="fileInput" style="display: none;">
                                <p id="nickName">토리형</p>
                                <div id="solid"></div>
                                <p id="pets">반려동물</p>
                                <p id="petProfileName">토리</p>
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
                                <div id="info" style="color: #FE8B94;"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageInfo.mp'">개인정보</div>
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
                        <form id="main_main_right" action="">
                            <h1 style="margin-top: 50px; color: #FE8B94; text-align: center;">개인정보 수정</h1>
                            <div id="id-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">아이디</p>
                                <input type="text" placeholder="userId" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;">
                            </div>
                            <div id="name-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">이름</p>
                                <input type="text" placeholder="userName" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;">
                            </div>
                            <div id="nickName-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">닉네임</p>
                                <input type="text" placeholder="nickName" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;">
                            </div>
                            <div id="gender-input">
                                <input type="radio" name="gender" id="men" value="남자">
                                <label for="men">남자</label>
                                <input type="radio" name="gender" id="women" value="여자">
                                <label for="women">여자</label>
                            </div>
                            <div id="birth-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">생년월일</p>
                                <input type="text" placeholder="1998-11-20" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;">
                            </div>
                            <div id="email-input"
                                style="display: flex; margin-left: 70px; margin-top: 50px; justify-content: space-between;">
                                <input type="text" placeholder="userEmail" style="width: 300px; height: 50px; border-radius: 15px;
                                 border: 1px solid #bababa; padding-left: 20px;">
                                <p style="font-size: 22px;">@</p>
                                <select id="website"
                                    style="border-radius: 15px; width: 300px; border: 1px solid #bababa; margin-right: 165px; padding-left: 20px;">
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="gmail.com">nate.com</option>
                                </select>
                            </div>
                            <button type="submit" style="width: 80%; align-items: center; margin-top: 50px;
                             margin-left: 70px; border-style: none; color: white; background-color: #FE8B94;
                             border-radius: 15px; height: 50px; font-size: 22px; font-weight: bold;">수정</button>
                            <div
                                style="width: 80%; margin-top: 50px; margin-left: 70px; font-size: 19px; margin-bottom: 30px;">
                                <span style="float: left; text-align: left; cursor: pointer;" onclick="">비밀번호 변경</span>
                                <span style="float: right; text-align: right; cursor: pointer;" onclick="">회원탈퇴</span>
                            </div>
                        </form>
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