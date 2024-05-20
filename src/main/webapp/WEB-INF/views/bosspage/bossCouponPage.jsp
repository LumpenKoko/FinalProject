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
                <div class="privacy-page">
                    <div class="privacy-top">쿠폰 관리</div>

                    <table>
                        
                    </table>
                        <div id="coupon-table-title">
                            <div>쿠폰명</div>
                            <div>유효기간(일)</div>
                            <div>사용/발매</div>
                            <div>관리</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@ include file="../common/footer.jsp" %>





</body>

</html>