<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../common/common-file.jsp" %>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/minibox.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mainpage/mainpage.css" />
</head>

<body>
    <%@ include file="../common/header.jsp" %>

    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#regist-pet-alarm">
        Open modal
    </button>
    <!-- The Modal -->
    <div class="modal" id="regist-pet-alarm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        아직 반려동물 등록이 안 되어 있으시네요!
                    </div>
                    <div>
                        동행하고 있는 반려동물을 등록하면 <br>
                        좀 더 편리한 서비스 사용이 가능합니다.
                    </div>
                    <div>
                        반려동물을 등록하시겠습니까?
                    </div>

                    <button class="common-button pink-button">지금 등록하기</button>
                    <button class="common-button white-button">나중에 하기</button>

                    <div>
                        <div>
                            <input type="checkbox" id="check-alarm" class="checkbox-color-pink">
                            <label for="check-alarm">3일 동안 보지 않기</label>
                        </div>
                        <div>
                            <img src="" alt="">
                            <span>닫기</span>
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>

</html>