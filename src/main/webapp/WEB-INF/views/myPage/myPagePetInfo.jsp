<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>


        <link rel="stylesheet" href="resources/css/myPage/myPagePetInfo.css" />
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
                            <div id="right1">
                                <p id="contentText">아직 등록하신 반려동물이 없으시네요!<br>지금 바로 반려동물을 등록하고 행복한 동행을 시작해보세요.</p>
                                <button type="submit" id="signUp"
                                    onclick="location.href='<%=request.getContextPath()%>/myPagePetSignUp.mp'"
                                    style="cursor: pointer;">반려동물
                                    등록하기</button>
                            </div>
                            <div id="right2">
                                <h1>반려동물 1</h1>
                                <c:forEach items="${petList}" var="pet" varStatus="loop">
                                    <form class="petForm${loop.index}" id="right2-container" method="post" action="updatePet.mp"
                                        data-index="${loop.index}">
                                        <div id="right2-container" class="right2-container-${loop.index}">
                                            <div id="right2-left">
                                                <img src="resources/img/myPage/petProfile.png" id="petProfile"
                                                    onclick="">
                                                <p style="font-size: 18px; color: #FE8B94;margin-top: 10px;">사진 클릭시 사진
                                                    변경 가능</p>
                                                <button type="button" class="delete"
                                                    style="cursor: pointer;">삭제</button>
                                            </div>
                                            <div id="right2-right" style="display: flex; flex-direction: column;">
                                                <div>
                                                    <p style="font-size: 18px; margin-bottom: 0px; text-align: left;">이름
                                                    </p>
                                                    <input type="text" class="petName" name="petName"
                                                        value="${pet.petName}">
                                                </div>
                                                <div style="margin-top: 30px;">
                                                    <p style="font-size: 18px; margin-bottom: 0px; text-align: left;">생일
                                                    </p>
                                                    <input type="date" class="petBirthday" name="petBirthday"
                                                        value="${pet.petBirthday}">
                                                </div>
                                                <div style="margin-top: 30px;">
                                                    <p style="font-size: 18px; margin-bottom: 0px; text-align: left;">크기
                                                    </p>
                                                    <select name="petSizeNo" class="petSizeNo">
                                                        <option value="1" ${pet.petSizeNo eq '1' ? 'selected' : '' }>소형견
                                                        </option>
                                                        <option value="2" ${pet.petSizeNo eq '2' ? 'selected' : '' }>중형견
                                                        </option>
                                                        <option value="3" ${pet.petSizeNo eq '3' ? 'selected' : '' }>대형견
                                                        </option>
                                                        <option value="4" ${pet.petSizeNo eq '4' ? 'selected' : '' }>고양이
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="gender-input" id="gender-input${loop.index}">
                                                    <input type="radio" name="petGender${loop.index}"
                                                        id="men${loop.index}" value="M" ${pet.petGender eq 'M'
                                                        ? 'checked' : '' } class="petGender">
                                                    <label for="men${loop.index}">남아</label>
                                                    <input type="radio" name="petGender${loop.index}"
                                                        id="women${loop.index}" value="F" ${pet.petGender eq 'F'
                                                        ? 'checked' : '' } class="petGender">
                                                    <label for="women${loop.index}">여아</label>
                                                </div>
                                                <button type="submit" class="update update-${loop.index}"
                                                    style="margin-top: 50px; cursor: pointer;">수정</button>
                                            </div>
                                        </div>
                                    </form>
                                </c:forEach>

                            </div>
                            <div id="right3">
                                <button id="addSignUp"
                                    onclick="location.href='<%=request.getContextPath()%>/myPagePetSignUp.mp'"
                                    style="cursor: pointer;">반려동물 추가
                                    등록하기</button>
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

                function petUpdate(event) {
                    const btn = event.target; // 클릭된 버튼을 참조합니다.
                    const form = btn.closest('.petForm${loop.index}'); // 클릭된 버튼의 부모 폼 요소를 가져옵니다.

                    // 폼의 인덱스 값을 가져옵니다.
                    const formIndex = form.dataset.index;

                    // 체크된 라디오 버튼을 감싸는 div 요소를 선택합니다.
                    const genderInput = form.querySelector('.gender-input');

                    // 체크된 라디오 버튼을 확인하고 해당 라디오 버튼의 name 속성을 변경합니다.
                    const checkedRadio = genderInput.querySelector('input:checked');
                    console.log(checkedRadio);
                    if (checkedRadio) {
                        checkedRadio.setAttribute('name',  `petGender${formIndex}`);
                    }

                    // 나머지 필드들에 대해서도 name 속성을 변경합니다.
                    form.querySelector('.petName').setAttribute('name', `petName${formIndex}`);
                    form.querySelector('.petBirthday').setAttribute('name', `petBirthday${formIndex}`);
                    form.querySelector('.petSizeNo').setAttribute('name', `petSizeNo${formIndex}`);

                    console.log(checkedRadio);
                    form.submit(); // 폼 제출
                }

                document.querySelectorAll('.update').forEach(btn => {
                    btn.addEventListener('click', petUpdate);
                });

            </script>

            <%@ include file="../common/footer.jsp" %>

    </body>

    </html>