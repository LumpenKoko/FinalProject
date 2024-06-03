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
                                    onclick="location.href='<%=request.getContextPath()%>/myPageMain.mp'">작성한 리뷰</div>
                                <div id="wishList"
                                    onclick="location.href='<%=request.getContextPath()%>/myPageWish.mp'">공감 목록</div>
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
                        <form id="main_main_right" action="update.mp">
                            <h1 style="margin-top: 50px; color: #FE8B94; text-align: center;">개인정보 수정</h1>
                            <div id="id-input">
                                <span style="text-align: left; margin-bottom: 0px; font-size: 19px;">아이디</span>
                                <span id="hiddenId" style="color: red; font-size: 15px;"><b>경고!</b> 사용할 수 없는 아이디
                                    입니다.</span><br>
                                <input type="text" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;" value="${loginUser.userId}"
                                    id="userId" name="userId">
                            </div>
                            <div id="name-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">이름</p>
                                <input type="text" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;" value="${loginUser.userName}"
                                    id="userName" name="userName">
                            </div>
                            <div id="nickName-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">닉네임</p>
                                <input type="text" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;"
                                    value="${loginUser.userNickname}" id="userNickname" name="userNickname">
                            </div>
                            <div id="gender-input">
                                <input type="radio" name="userGender" id="men" value="M" <% if
                                    ("M".equals(loginUser.getUserGender())) { %> checked <% } %>>
                                    <label for="men">남자</label>
                                    <input type="radio" name="userGender" id="women" value="F" <% if
                                        ("F".equals(loginUser.getUserGender())) { %> checked <% } %>>
                                        <label for="women">여자</label>
                            </div>
                            <div id="birth-input">
                                <p style="text-align: left; margin-bottom: 0px; font-size: 19px;">생년월일</p>
                                <input type="date" style="border-radius: 15px; border: 1px solid #bababa; margin-top: 0px; width: 80%; float: left;
                                  height: 50px; text-align: left; padding-left: 20px;"
                                    value="${loginUser.userBirthday}" id="userBirthday" name="userBirthday">
                            </div>
                            <div id="email-input"
                                style="display: flex; margin-left: 70px; margin-top: 50px; justify-content: space-between;">
                                <input type="text" style="width: 300px; height: 50px; border-radius: 15px;
                                 border: 1px solid #bababa; padding-left: 20px;" value="${loginUser.userEmail}"
                                    id="userEmail" name="userEmail">
                                <p style="font-size: 22px; line-height: 50px;">@</p>
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

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

            <script>
                // $(document).ready(function () {
                //     // userId 입력값이 변경될 때마다 호출되는 함수
                //     $("#userId").on("input", function () {
                //         var userId = $(this).val().trim(); // 입력된 아이디 (양쪽 공백 제거)

                //         // 정규식을 사용하여 아이디가 숫자와 영어로만 이루어져 있고, 숫자와 영어가 무조건 1개 이상씩 들어가고, 8글자 이상 15글자 이하인지 확인
                //         var regex = /^(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]{8,15}$/;
                //         if (regex.test(userId)) { // 조건을 만족할 경우
                //             $("#hiddenId").hide(); // 경고 메시지 숨기기
                //         } else { // 조건을 만족하지 않을 경우
                //             $("#hiddenId").show(); // 경고 메시지 표시하기
                //         }
                //     });
                // });

                $(document).ready(function () {
                    // userId 입력값이 변경될 때마다 호출되는 함수
                    $("#userId").on("input", function () {
                        var userId = $(this).val().trim(); // 입력된 아이디 (양쪽 공백 제거)

                        // 정규식을 사용하여 아이디가 숫자와 영어로만 이루어져 있고, 숫자와 영어가 무조건 1개 이상씩 들어가고, 8글자 이상 15글자 이하인지 확인
                        var regex = /^(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]{8,15}$/;
                        if (regex.test(userId)) { // 조건을 만족하지 않을 경우
                            $("#hiddenId").hide(); // 경고 메시지 표시하기
                            return; // 추가된 부분
                        }

                        // Ajax 요청을 통해 서버에 아이디를 전송하고 검증 결과를 받음
                        $.ajax({
                            url: "/checkUserId",
                            method: "POST",
                            data: { userId: userId },
                            success: function (data) {
                                if (data.exists) { // 아이디가 존재할 경우
                                    $("#hiddenId").show(); // 경고 메시지 표시하기
                                } else { // 아이디가 존재하지 않을 경우
                                    $("#hiddenId").hide(); // 경고 메시지 숨기기
                                }
                            },
                            error: function () {
                                console.error("서버와의 통신 중 오류가 발생했습니다.");
                            }
                        });
                    });
                });
            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>