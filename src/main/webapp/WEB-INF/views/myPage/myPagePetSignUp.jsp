<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPagePetSignUp.css" />
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
                                <div style="border-style: none; color: #FE8B94;" id="petInfo"
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
                            <form action="insertPet.mp" id="petSignUp">
                                <h1 style="margin-top: 50px; text-align: center;">반려동물 등록</h1>
                                <p style="margin-top: 40px; font-size: 17px; text-align: center;">반려동물 정보를 입력해<br>행복한 멍냥
                                    가이드를 누려보세요</p>
                                <div
                                    style="margin-left: 100px; margin-top: 30px; font-size: 21px; display: flex; flex-direction: column;">
                                    <div style="margin-top: 40px;">
                                        <span style="float: left; margin-bottom: 0px;">이름</span>
                                        <span style="color: #FE8B94; float: left; margin-bottom: 0px;">*</span>
                                    </div>
                                    <div>
                                        <input type="text" placeholder="이름을 입력하세요" id="petName"
                                            style="font-size: 17px; padding-left: 30px;" name="petName">
                                    </div>
                                </div>
                                <div style="margin-left: 100px; margin-top: 40px; font-size: 21px;">
                                    <select name="petSizeNo" id="petSizeNo"
                                        style="font-size: 17px; padding-left: 30px;">
                                        <option value="1">소형견</option>
                                        <option value="2">중형견</option>
                                        <option value="3">대형견</option>
                                        <option value="4">고양이</option>
                                    </select>
                                </div>
                                <div style="margin-left: 100px; font-size: 21px; margin-top: 40px;">
                                    <span style="float: left;">생일</span><br>
                                    <input type="date" id="petBirthday"
                                        style="font-size: 17px; padding-left: 30px; padding-right: 30px;"
                                        name="petBirthday">
                                </div>
                                <div id="gender-input">
                                    <input type="radio" name="petGender" id="men" value="M">
                                    <label for="men">남아</label>
                                    <input type="radio" name="petGender" id="women" value="F">
                                    <label for="women">여아</label>
                                </div>
                                <!-- <div style="margin-left: 100px; font-size: 21px; margin-top: 40px;">
                                    <span style="float: left;">사진</span><br>
                                    <div id="imgInput" onclick=""
                                        style="background-image: url(resources/img/myPage/+.png);"></div>
                                    <input type="file" id="fileInput" style="display: none;" accept="image/*">
                                </div> -->
                                <div
                                    style="margin-left: 100px; font-size: 21px; margin-top: 40px; flex-direction: column;">
                                    <span
                                        style="float: left; text-align: left; margin-bottom: 0px !important;">사진</span><br>
                                    <label for="imgFileInput" id="imgInput"
                                        style="margin-top: 0px; top: 0px; background-image: url(resources/img/myPage/+.png); cursor: pointer; width: 150px; height: 150px; display: block; background-size: cover; background-position: center; border: 2px solid transparent;"></label>
                                    <input type="file" id="imgFileInput" style="display: none;" accept="image/*"
                                        onchange="displayImage(this)">
                                </div>
                                <button type="submit" id="submit">등록하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.getElementById('imgFileInput').addEventListener('change', function (event) {
                    var file = event.target.files[0]; // 파일 가져오기

                    if (file) {
                        // 파일이 선택되었을 때에만 처리
                        // 원래 이름
                        var originName = file.name;
                        console.log(file);
                        // 서버에 저장될 파일의 이름 생성
                        var changeName = Date.now() + '_' + originName;
                        // 서버에 저장될 파일의 경로 설정
                        var filePath = 'resources/uploads/' + changeName;
                        // 파일 레벨 설정 (예: 사용자 입력, 고정 값 등)
                        var fileLevel = 1;

                        // 추출한 값들을 서버로 전송
                        // AJAX 등을 사용하여 서버로 전송하고 값을 전달합니다.

                        // 이미지 미리보기 업데이트
                        var imgReader = new FileReader();
                        imgReader.onload = function (e) {
                            document.getElementById('imgInput').style.backgroundImage = "url('" + e.target.result + "')";
                        }
                        imgReader.readAsDataURL(file); // FileReader를 통해 파일을 읽어옵니다.
                    } else {
                        // 파일이 선택되지 않은 경우 처리
                        console.error('파일이 선택되지 않았습니다.');
                    }
                });
            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>