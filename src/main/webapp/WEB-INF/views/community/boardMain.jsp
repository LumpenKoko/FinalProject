<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/community.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
    <div class="community-wrapper">
        <div class="tmp-box contents-box">
            <div class="tmp-box row-box" style="background-color: gray;">
                <div class="tmp-box">쇼츠</div>
                <div class="tmp-box">더보기</div>
                <div class="tmp-box">등록</div>
            </div>
            <div class="flex-box">
                <div class="row-box">
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                </div>
                <div class="row-box">
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                    <div class="tmp-box">썸네일</div>
                </div>
            </div>
        </div>
        <div class="tmp-box contents-box">
            <div class="tmp-box row-box" style="background-color: gray;">
                <div class="tmp-box">게시판</div>
                <div class="tmp-box">게시글 등록</div>
            </div>
            <div class="tmp-box row-box">
                <div class="tmp-box">전체글</div>
                <div class="tmp-box">건강병원</div>
                <div class="tmp-box">식당카페</div>
                <div class="tmp-box">여행숙소</div>
                <div class="tmp-box">행사테마파크</div>
                <div class="tmp-box">반려용품</div>
                <div class="tmp-box">잡담</div>
                <div class="tmp-box">Q&A</div>
            </div>
            <div>
                <div>
                    <div class="row-box">
                        <div>
                            <div class="row-box">
                                <div class="tmp-box">프사</div>
                                <div class="tmp-box">닉네임</div>
                                <div class="tmp-box">날짜</div>
                            </div>
                            <div class="row-box">
                                <div contenteditable="tmp-box">말머리</div>
                                <div class="tmp-box">제목</div>
                            </div>
                        </div>
                        <div class="tmp-box">사진</div>
                    </div>
                    <div class="flex-box tmp-box">내용 미리보기</div>
                    <div>조회수 / 댓글</div>
                    <div class="tmp-box flex-box">1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 다음</div>
                </div>
            </div>
        </div>
        <div class="tmp-box contents-box">
            <select name="showFilter">
                <option value="nameAndContent" selected>제목 + 본문</option>
                <option value="nickname">닉네임</option>
            </select>
            <input type="text" placeholder="게시글 혹은 쇼츠를 검색하세요">
            <button>검색</button>
        </div>
    </div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>

