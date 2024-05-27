<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        
        <%@ include file="../common/common-file.jsp"%>
        <link rel="stylesheet" href="resources/css/bosspage/bosspage.css" />
        <link rel="stylesheet" href="resources/css/common/common.css" />
        <script src="resources\js\bosspage\bosspage.js"></script>
        <script src="resources\js\bosspage\bossMainPage.js"></script>
    </head>

    <body>
        <%@ include file="../common/header.jsp" %>

            <div id="bossmainpage-wrap" class="wrapper">
                <div class="bossmainpage">
                    <div>
                        <%@ include file="../bosspage/bossmanubar.jsp" %>
                    </div>
                    <div class="privacy-page">
                        <div class="privacy-top">사업자 / 개인 정보</div>
                        <div id="information">
                            <div class="privacy">
                                <p style="font-weight: 700;">사업자 정보</p>
                                <div>
                                    <p>이름(대표자명)</p>
                                    <div class="boss-name">개장수</div>
                                </div>
                                <div>
                                    <p>생년월일</p>
                                    <div class="birth-date">1988년9월24일</div>
                                </div>
                                <div>
                                    <p>성별</p>
                                    <div class="gender">남자</div>
                                </div>
                                <div>
                                    <p>휴대폰번호</p>
                                    <div class="phone">010-3169-2477</div>
                                </div>
                                <div>
                                    <p>사업자번호</p>
                                    <div class="business-no">588-02-02948</div>
                                </div>
                                <div>
                                    <p>상호명</p>
                                    <div class="mutual">멍냥팔이소년</div>
                                </div>
                                <div>
                                    <p>소재지</p>
                                    <div class="address">서울시 관악구 인헌동</div>
                                </div>
                            </div>
                            <div style="border-top: 3px solid #BABABA; margin-top: 10px; margin-bottom: 10px;"></div>
                            <div id="change-personal">
                                <p>개인 정보</p>
                                <div>
                                    <p>아이디</p>
                                    <input type="text" class="boss-id">
                                </div>
                                <div style="margin-top: 10px;">
                                    <p>이메일</p>
                                    <div>
                                        <input type="email" class="boss-email"> @
                                        <input type="email" class="boss-email" id="boss-email" placeholder="입력해주세요.">
                                        <select class="boss-email" onchange="updateEmailDomain()">
                                            <option>직접입력</option>
                                            <option>naver.com</option>
                                            <option>daum.net</option>
                                            <option>gmail.com</option>
                                            <option>hanmail.net</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button onclick="" id="boss-edit">수정</button>
                            </div>
                            <div id="edit-option">
                                <button style="margin-right: auto;" onclick="">비밀번호 변경</button>
                                <button>가게 삭제 및 탈퇴</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            <div id="boss-drawal-modal">
                <div>
                    <p style="font-weight: 700; font-size: 30px;">가게 삭제 및 탈퇴</p>
                </div>
                <div>
                    탈퇴하신 후에는 해당 회원정보로<br>
                    활동 하실수 없습니다.<br>
                    작성하신 게시물에 대해서는<br>
                    일괄 삭제됨을 알려드리며<br>
                    정보 복구가 불가능한점<br>
                    양해 부탁드립니다.<br><br>
                    다시 사이트의 이용을위해선<br>
                    귀하의 사업자 번호와 실명인증을<br>
                    통해 다시 가입을 해주셔야<br>
                    정상적인 이용이 가능합니다.<br><br>
                    정말로 탈퇴를 하시겠습니까?
                </div>
                <div>
                    <p>비밀번호</p>
                    <input type="password">
                </div>
                <div>
                    <button>탈퇴</button>
                    <button>취소</button>
                </div>

            </div>

            <%@ include file="../common/footer.jsp" %>





    </body>

    </html>