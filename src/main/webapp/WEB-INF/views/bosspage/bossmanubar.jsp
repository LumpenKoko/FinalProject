<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/bosspage.css" />
    
    <head>
        <meta charset="UTF-8">
        <title>사장님메뉴</title>
        
    <body>
        <div id="bossmanubar">
            <div style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
                <a href="<%=request.getContextPath()%>/bossMainPage.bm">사업자 / 개인 정보</a>
            </div>
            <div>
                <a href="<%=request.getContextPath()%>/bossLocation.bl">장소 정보</a>
            </div>
            <div>쿠폰 / 리뷰관리</div>
            <div>
                <a href="">쿠폰 관리</a>
            </div>
            <div style="border-bottom-left-radius:15px; border-bottom-right-radius: 15px;">
                <a href="">리뷰 관리</a>
            </div>
            <div class="chatlist">
                <a href="">채팅 관리</a>
            </div>
        </div>
        

    </body>


    </html>