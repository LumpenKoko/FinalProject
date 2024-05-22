<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <%@ include file="../common/common-file.jsp"%>
    <link rel="stylesheet" href="resources/css/bosspage/bosspage.css" />
    <link rel="stylesheet" href="resources/css/common/common.css" />

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

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
                                        <input type="email" class="boss-email" id="boss-email">
                                        <select class="boss-email">
                                            <option>직접입력</option>
                                            <option>naver.com</option>
                                            <option>daum.net</option>
                                            <option>gmail.com</option>
                                            <option>hanmail.net</option>
                                        </select>
                                    </div=>
                                </div>
                            </div>
                            <div>
                                <button onclick="" id="boss-edit">수정</button>
                            </div>
                            <div id="edit-option">
                                <button style="margin-right: auto;">비밀번호 변경</button>
                                <button>가게 삭제 및 탈퇴</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <%@ include file="../common/footer.jsp" %>





    </body>

    </html>