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
                    <div class="privacy-top">${loginUser.userName} 대표님의 장소정보</div>
                    <div id="location-details">
                        <p>업종</p>
                        <p class="location-category">${location.locationName}</p>
                        <div>
                            <p>상호명</p>
                            <p class="locationName">${location.locationName}</p>
                        <div>
                            <p>가게 전화번호(*필수*)</p>
                            <input type="tel" name="가게전화번호" style="background: white;" placeholder="(ex.지역번호)-0000-0000">
                        </div>
                        <div id="operating">
                            <p>운영시간(*필수*)</p>
                            <div id="operating-hours-container"></div>
                        </div>
                        <div id="storeinfo">
                            <p>상세 설명(필수*)</p>
                            <textarea style="border-radius: 15px;" placeholder="*장소에 대한 설명과 반려동물 풀입 시 도움이 될 만한 정보를 적어주세요. (ex)테이블 밀집도, 케이지 필요 여부 등."></textarea>
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
                                <button class="delete-product">
                                    <img class="delete-productimg" src="resources/img/bosspage/-.png">
                                </button>
                            </div>
                            <div id="product-registration" style="margin-top: 20px;">
                                <button id="add-product">
                                    <img class="add-productimg" src="resources/img/myPage/+.png">
                                </button>
                            </div>
                        </div>
                        <div id="upload-location">
                            <button class="upload-bt" onclick="">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../common/footer.jsp" %>