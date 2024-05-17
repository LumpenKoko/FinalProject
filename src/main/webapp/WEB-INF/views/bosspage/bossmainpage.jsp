<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bosspage/bosspage.css" />

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

    </head>

    <body>
        <%@ include file="../common/header.jsp" %>


            <form id="bossmainpage" action="">
                <table>
                    <tr>
                        <%@ include file="../bosspage/bossmanubar.jsp" %>
                        <tr id="privacy-page">
                            <div id="privacy-top">사업자 / 개인 정보</div>
                            <div id="privacy">사업자 정보</div>
                        </tr>
                    </tr>
                        
                </table>
            </form>



            <%@ include file="../common/footer.jsp" %>





    </body>

    </html>