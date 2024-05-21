<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/bosspage.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/locationinfo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/common.css" />

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
                        <div class="privacy-top">장소 정보</div>
                        <div id="location-details">
                            <p>운영업체/카테고리</p>
                            <select class="location-category">
                                <option value="">식당</option>
                                <option value="">카페</option>
                                <option value="">숙소</option>
                                <option value="">행사</option>
                                <option value="">테마파크</option>
                                <option value="">병원</option>
                            </select>
                            <div>
                                <p>상호명</p>
                                <input type="text" name="상호명">
                            </div>
                            <div>
                                <p>가게 전화번호</p>
                                <input type="tel" name="가게전화번호" style="background: white;" placeholder="(ex.지역번호)-0000-0000">
                            </div>
                            <div id="operating">
                                <p>운영시간</p>
                                <div id="operating-hours">
                                    <p>월</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                                <div id="operating-hours">
                                    <p>화</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                                <div id="operating-hours">
                                    <p>수</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                                <div id="operating-hours">
                                    <p>목</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                                <div id="operating-hours">
                                    <p>금</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                                <div id="operating-hours">
                                    <p>토</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                                <div id="operating-hours">
                                    <p>일</p>
                                    <p>휴무</p>
                                    <input type="checkbox" name="휴무">
                                    <select class="opne-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                        <p style="margin-right: 0;margin-left: 30px;">~</p>
                                    <select class="close-time">
                                        <option value="">00:00</option>
                                        <option value="">01:00</option>
                                        <option value="">02:00</option>
                                        <option value="">03:00</option>
                                        <option value="">04:00</option>
                                        <option value="">05:00</option>
                                        <option value="">06:00</option>
                                        <option value="">07:00</option>
                                        <option value="">08:00</option>
                                        <option value="">09:00</option>
                                        <option value="">10:00</option>
                                        <option value="">11:00</option>
                                        <option value="">12:00</option>
                                        <option value="">13:00</option>
                                        <option value="">14:00</option>
                                        <option value="">15:00</option>
                                        <option value="">16:00</option>
                                        <option value="">17:00</option>
                                        <option value="">18:00</option>
                                        <option value="">19:00</option>
                                        <option value="">20:00</option>
                                        <option value="">21:00</option>
                                        <option value="">22:00</option>
                                        <option value="">23:00</option>
                                    </select>
                                </div>
                            </div>
                            <div id="storeinfo">
                                <p>상세 설명*</p>
                                <textarea placeholder="*장소에 대한 설명과 반려동물 풀입 시 도움이 될 만한 정보를 적어주세요. (ex)테이블 밀집도, 케이지 필요 여부 등."></textarea>
                            </div>
                        </div>
                        

                    </div>
                </div>
            </div>


            <%@ include file="../common/footer.jsp" %>





    </body>

    </html>