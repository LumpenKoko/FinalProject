<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/common.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/minibox.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/bosspage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/bossCouponPage.css"/>
<%@ include file="../common/common-file.jsp"%>
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

                <!-- 등록된 쿠폰 있는 경우 -->
                <div class="privacy-page">
                    <div class="privacy-top">쿠폰 관리</div>

                    <!-- 테이블 항목명 -->
                    <table>
                        <tr id="coupon-table-title">
                            <th class="coupon-title">쿠폰명</th>
                            <th class="coupon-expiration">유효기간(일)</th>
                            <th class="coupon-count">사용 / 발매</th>
                            <th class="coupon-admin">관리</th>
                        </tr>

                        <!-- 등록된 쿠폰 없을 시 -->
                        <tr id="coupon-none">
                            <td colspan="4">등록된 쿠폰이 없습니다.</td>
                        </tr>
                        
                        <!-- 쿠폰 종류 기본 형식 -->
                        <tr class="coupon-content">
                            <td class="coupon-title">멍냥가이드회원감사쿠폰이천원멍냥가이드회원감사쿠폰이천원멍냥</td>
                            <td class="coupon-expiration">14</td>
                            <td class="coupon-count">1 / 3</td>
                            <td class="coupon-admin">
                                <button class="common-button pink-button">수정</button>
                                <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
                            </td>
                        </tr>

                        <!-- 쿠폰 수정 버튼 누를 시 이 형식대로 바뀌어야 함 -->
                        <tr class="coupon-content">
                            <td class="coupon-title">
                                <input type="text" value="멍냥가이드회원감사쿠폰2000원" class="minibox-input" placeholder="쿠폰명을 입력하세요">
                            </td>
                            <td class="coupon-expiration">
                                <input type="text" value="14" class="minibox-input" placeholder="ex)14">
                            </td>
                            <td class="coupon-count">1 / 3</td>
                            <td class="coupon-admin">
                                <button class="common-button pink-button">확인</button>
                                <button class="common-button white-button">취소</button>
                            </td>
                        </tr>

                        <!-- 예시 -->
                        <tr class="coupon-content">
                            <td class="coupon-title">3000원 할인권</td>
                            <td class="coupon-expiration">14</td>
                            <td class="coupon-count">1 / 3</td>
                            <td class="coupon-admin">
                                <button class="common-button pink-button">수정</button>
                                <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
                            </td>
                        </tr>
                        <tr class="coupon-content">
                            <td class="coupon-title">고객감사할인</td>
                            <td class="coupon-expiration">14</td>
                            <td class="coupon-count">1 / 3</td>
                            <td class="coupon-admin">
                                <button class="common-button pink-button">수정</button>
                                <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
                            </td>
                        </tr>

                        <!-- 쿠폰 추가 등록 -->
                        <tr class="coupon-content">
                            <!-- 쿠폰명 30글자 제한 필요 -->
                            <td class="coupon-title">
                                <input type="text" class="minibox-input" placeholder="쿠폰명을 입력하세요">
                            </td>
                            <td class="coupon-expiration">
                                <input type="text" class="minibox-input" placeholder="ex)14">
                            </td>
                            <td class="coupon-count">0 / 0</td>
                            <td class="coupon-admin">
                                <button class="common-button pink-button">확인</button>
                                <button class="common-button white-button">취소</button>
                            </td>
                        </tr>

                        <tr id="coupon-regist">
                            <td colspan="4">
                                <button class="common-button"><img src="<%=contextPath%>/resources/bosspage/plus.png" alt=""></button>
                            </td>
                        </tr>
                    </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 쿠폰 삭제 클릭 시 나오는 모달 -->
        <div class="modal size" id="delete-coupon">
            <div class="modal-dialog size">
                <div class="modal-content size">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="minibox-title" id="delete-coupon-title">
                            쿠폰 삭제
                        </div>
                        <div id="delete-coupon-text">
                            '멍냥가이드회원감사쿠폰2000원' <!-- 데이터 가져와서 집어넣어야 함 -->
                        </div>
                        <div class="minibox-text" id="delete-coupon-content">
                            삭제 시 해당 쿠폰의 수정과 <br>
                            사용/발매 내역 조회가 불가능합니다. <br><br>
                            해당 쿠폰을 삭제하시겠습니까?
                        </div>
                        
                        <button class="common-button pink-button" onclick="location.href='#'">삭제</button>
                        <button class="common-button white-button" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../common/footer.jsp" %>

</body>

</html>