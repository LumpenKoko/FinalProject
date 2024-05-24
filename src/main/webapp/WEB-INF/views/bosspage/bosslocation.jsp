<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            
            <%@ include file="../common/common-file.jsp" %>
            <link rel="stylesheet" href="resources/css/bosspage/bosspage.css" />
            <link rel="stylesheet" href="resources/css/bosspage/locationinfo.css" />
            <link rel="stylesheet" href="resources/css/common/common.css" />
            <script src="resources/js/bosspage/bosslocation.js"></script>
        </head>

        <body onload="locationpage('/mng')">
            <%@ include file="../common/header.jsp" %>

                <div id="bossmainpage-wrap" class="wrapper">
                    <div class="bossmainpage">
                        <div>
                            <%@ include file="../bosspage/bossmanubar.jsp" %>
                        </div>
                        <div class="privacy-page">
                            <div class="privacy-top">식당 / 카페 / 행사 / 테마파크 정보</div>
                            <div id="location-details">
                                <p>운영업체/카테고리(*필수*)</p>
                                <select class="location-category">
                                    <option value="">식당</option>
                                    <option value="">카페</option>
                                    <option value="">행사</option>
                                    <option value="">테마파크</option>
                                    
                                </select>
                                <div>
                                    <p>상호명(*필수*)</p>
                                    <input type="text" name="상호명">
                                </div>
                                <div>
                                    <p>가게 전화번호(*필수*)</p>
                                    <input type="tel" name="가게전화번호" style="background: white;"
                                        placeholder="(ex.지역번호)-0000-0000">
                                </div>
                                <div id="operating">
                                    <p>운영시간(*필수*)</p>
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
                                    <p>상세 설명(필수*)</p>
                                    <textarea style="border-radius: 15px;"
                                        placeholder="*장소에 대한 설명과 반려동물 풀입 시 도움이 될 만한 정보를 적어주세요. (ex)테이블 밀집도, 케이지 필요 여부 등."></textarea>
                                </div>
                                <div>
                                    <p>반려동물 종류 및 크기(*필수*)</p>
                                    <div id="animal-check">
                                        <p>소형견</p>
                                        <input type="checkbox">
                                        <p>중형견</p>
                                        <input type="checkbox">
                                        <p>대형견</p>
                                        <input type="checkbox">
                                        <p>고양이</p>
                                        <input type="checkbox">
                                    </div>
                                </div>
                                <div id="reservation-link">
                                    <p>외부 예약링크(선택)</p>
                                    <input type="text" placeholder="ex)www.mnguide.com">
                                </div>
                                <div>
                                    <p>업체 사진등록(*필수*)</p>
                                    <div id="photo-registration">
                                        <label for="file7">
                                            <div class="registration-upload" data-target="file7">
                                                <img src="resources/img/myPage/+.png">
                                            </div>
                                        </label>
                                        <input type="file" accept="image/*" name="file" id="file7" class="company-file">
                                        <label for="file8">
                                            <div class="registration-upload" data-target="file8">
                                                <img src="resources/img/myPage/+.png">
                                            </div>
                                        </label>
                                        <input type="file" accept="image/*" name="file" id="file8" class="company-file">
                                        <label for="file9">
                                            <div class="registration-upload" data-target="file9">
                                                <img src="resources/img/myPage/+.png">
                                            </div>
                                        </label>
                                        <input type="file" accept="image/*" name="file" id="file9" class="company-file">
                                    </div>
                                </div>
                                <div>
                                    <p>상품등록</p>
                                    
                                    <div class="product-registration">
                                        <input type="text" class="product-name" placeholder="상품명을 입력하세요.">
                                        <input type="text" class="commodity-price" placeholder="가격을 입력하세요.">
                                        <button class="delete-droduct">
                                            <img class="delete-droductimg"
                                                src="resources/img/bosspage/-.png">
                                        </button>
                                    </div>
                                    <div id="product-registration" style="margin-top: 20px;">
                                        <button id="add-product">
                                            <img class="add-productimg" src="resources/img/myPage/+.png">
                                        </button>
                                    </div>
                                </div>
                                <div id="upload-location">
                                    <button class="upload-bt">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <%@ include file="../common/footer.jsp" %>
        </body>

        </html>