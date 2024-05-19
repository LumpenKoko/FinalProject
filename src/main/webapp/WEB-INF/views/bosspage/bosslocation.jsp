<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/bosspage.css" />
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
                        

                    </div>
                </div>
            </div>


            <%@ include file="../common/footer.jsp" %>





    </body>

    </html>