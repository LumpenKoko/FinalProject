<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="resources/css/common/minibox.css"/>
<link rel="stylesheet" href="resources/css/search/searchPage.css"/>
<script src="resources/js/search/search.js"></script>
<script src="resources/js/search/searchAjax.js"></script>
</head>
<body onload="init('<%=request.getContextPath()%>')">
	<%@ include file="../common/header.jsp"%>
    <div class="wrapper">
		<div class="main">
            <!-- 검색 필터링 -->
            <div id="category-box">
                <!-- 동물 필터링 -->
                <div class="category-box gray-round-box">
                    <!-- category-box-content div 클릭 시 박스 체크 되도록 js 만들어야 함 -->
                    <div class="category-box-content category-big">
                        <label for="filter-dog">강아지</label>
                        <input type="checkbox" id="filter-dog" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-dog-small">소형견</label>
                        <input type="checkbox" id="filter-dog-small" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-dog-middle">중형견</label>
                        <input type="checkbox" id="filter-dog-middle" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-dog-big">대형견</label>
                        <input type="checkbox" id="filter-dog-big" class="checkbox-color-pink">
                    </div>
                    <div id="category-cat" class="category-box-content category-border-none">
                        <label for="filter-cat">고양이</label>
                        <input type="checkbox" id="filter-cat" class="checkbox-color-pink category-border-none">
                    </div>
                </div>

                <!-- 장소 필터링 -->
                <div class="category-box gray-round-box">
                    <!-- category-box-content div 클릭 시 박스 체크 되도록 js 만들어야 함 -->
                    <div class="category-box-content category-big">
                        <span for="filter-place" style="margin: auto 0px;">장소 카테고리</span>
                    </div>
                    <div class="category-box-content">
                        <label for="filter-restaurant">식당</label>
                        <input type="checkbox" id="filter-restaurant" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-cafe">카페</label>
                        <input type="checkbox" id="filter-cafe" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-hotel">숙소</label>
                        <input type="checkbox" id="filter-hotel" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-event">행사</label>
                        <input type="checkbox" id="filter-event" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-park">테마파크</label>
                        <input type="checkbox" id="filter-park" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content">
                        <label for="filter-hospital">병원</label>
                        <input type="checkbox" id="filter-hospital" class="checkbox-color-pink">
                    </div>
                    <div class="category-box-content category-border-none">
                        <label for="filter-etc">기타</label>
                        <input type="checkbox" id="filter-etc" class="checkbox-color-pink category-border-none">
                    </div>
                </div>
            </div>

            <!-- 검색 결과 컨텐츠 -->
            <div id="search-result-box" class="gray-round-box">
                <!-- 검색 결과 타이틀 / 정렬기준 -->
                <div id="search-title-box">
                    <div id="search-title-text">검색 결과</div>
                    <div id="search-order-by">
                        <div id="order-by-title" onclick="showOrderBox()">
                            <span>정렬기준</span>
                            <img src="resources/img/searchpage/open-icon.png" alt="">
                        </div>
                        <div id="order-by-box">
                            <div class="order-by-list">최신순</div>
                            <div class="order-by-list">별점순</div>
                            <div id="order-by-last" class="order-by-list">찜개수순</div>
                        </div>
                    </div>
                </div>

                <c:forEach var="loc" items="${locationList}">
                    <div class="search-content-box gray-round-box" onclick="moveToLocationDetail('<%=contextPath%>', '${loc.locationNo}')">
                        <img src="${loc.attachment.filePath}${loc.attachment.changeName}" alt="">
                        <div class="search-content">
                            <div class="content-title">
                                <span>${loc.locationName}</span>
                                <div>
                                    <img src="resources/img/searchpage/like-pre.png" alt="">
                                    <span>45</span>
                                </div>
                            </div>
                            <div class="content-upper-box">
                                <div>
                                    <span class="font-bold">분류</span>
                                    <span>${loc.locationCategoryNo}</span>
                                </div>
                                <div>
                                    <span class="font-bold">평점</span>
                                    <span>${loc.locationStar}</span>
                                    <div>
                                        <img src="resources/img/searchpage/rating-star.png" alt="">
                                        <img src="resources/img/searchpage/rating-star.png" alt="">
                                        <img src="resources/img/searchpage/rating-star.png" alt="">
                                        <img src="resources/img/searchpage/rating-star.png" alt="">
                                    </div>
                                </div>
                                <div>
                                    <span class="font-bold">종류</span>
                                    <span>
                                        <c:forEach var="size" items="${loc.enterList}">
                                            ${size.petSizeNo} 
                                        </c:forEach>
                                    </span>
                                </div>
                            </div>
                            <hr>
                            <div class="content-lower-box">
                                <div>
                                    <img src="resources/img/searchpage/location.png" alt="">
                                    <span>${loc.address}</span>
                                </div>
                                <div>
                                    <img src="resources/img/searchpage/phone.png" alt="">
                                    <span>${loc.locationPhone}</span>
                                </div>
                                <div>
                                    <img src="resources/img/searchpage/time.png" alt="">
                                    <span>영업 중 22:00 종료</span>
                                    <span class="close-red">영업 종료</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

        
                <!-- 페이징 바 -->
                <div id="paging-bar">
                    <img src="resources/img/searchpage/paging-left.png" alt="">
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>6</button>
                    <button>7</button>
                    <button>8</button>
                    <button>9</button>
                    <button>10</button>
                    <img src="resources/img/searchpage/paging-right.png" alt="">
                </div>

            </div>
        </div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
	
</body>
</html>