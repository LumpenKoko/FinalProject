<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/community.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/boardContent.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="wrapper">
        <div class="main">
            <div class="gray-round-box">
                <!-- 타이틀 있는 헤더 -->
                <div>
                    <div id="board-header-title">
                        <div>
                            <span id="board-title-text">강화도 애견 펜션 메이비 / 강화도 공원</span>
                            <span id="board-category-text">여행/숙소</span>
                        </div>
                        <div class="change-button-box">
                            <img src="<%=contextPath%>/resources/community/threeCircle.png" alt="">
                            <div class="change-box">
                                <div class="change-box-list" onclick="location.href='#'">수정하기</div>
                                <div class="change-box-list change-box-last" data-toggle="modal" data-target="#delete-content">삭제하기</div>
                            </div>
                        </div>
                    </div>
                    <div id="board-header-info">
                        <div>
                            <img src="<%=contextPath%>/resources/community/userProfile.jpg" alt="">
                            <span>쿠키언니</span>
                        </div>
                        <span>조회수 45</span>
                        <span>등록일 2024.00.00</span>
                    </div>
                </div>

                <!-- 글 내용 및 사진 영역 -->
                <div id="board-content-box">
                    <div id="board-content-text">
                        <img src="<%=contextPath%>/resources/community/userProfile.jpg" alt="">
                        <div>컨텐츠박스입니다. 예시입니다. 은성님 어디 계세요.</div>
                    </div>
                    <div id="board-communication-box">
                        <div class="board-communication-info">
                            <!-- 좋아요 여부에 따라 처리 필요 -->
                            <img src="<%=contextPath%>/resources/community/like-after.png" alt="">
                            <span>좋아요 8</span>
                        </div>
                        <div class="board-communication-info">
                            <img src="<%=contextPath%>/resources/community/reply.png" alt="">
                            <span>댓글 5</span>
                        </div>
                    </div>
                </div>

                <!-- 댓글 리스트 -->
                <div id="board-reply-list">
                    <div id="board-reply-title">댓글</div>

                    <!-- 로그인한 유저가 작성한 본인 댓글 -->
                    <div class="board-reply-box">
                        <div class="board-reply-profile"><img src="<%=contextPath%>/resources/community/userProfile.jpg" alt=""></div>
                        <div class="board-reply-content">
                            <div class="reply-title-box">
                                <div>
                                    <span class="reply-user">쿠키언니</span>
                                    <span class="reply-date">2024.05.02 17:03</span>
                                </div>
                                
                                <div class="change-button-box">
                                    <img src="<%=contextPath%>/resources/community/threeCircle.png" alt="">
                                    <div class="change-box">
                                        <div class="change-box-list">수정하기</div>
                                        <div class="change-box-list change-box-last" data-toggle="modal" data-target="#delete-content">삭제하기</div>
                                    </div>
                                </div>
                            </div>

                            <div class="reply-content">어디계시나요!</div>
                        </div>
                    </div>

                    <!-- 본인이 작성하지 않은 댓글 -->
                    <div class="board-reply-box">
                        <div class="board-reply-profile"><img src="<%=contextPath%>/resources/community/userProfile.jpg" alt=""></div>
                        <div class="board-reply-content">
                            <div class="reply-title-box">
                                <div>
                                    <span class="reply-user">강아지왕</span>
                                    <span class="reply-date">2024.05.02 17:03</span>
                                    <button>답글 달기</button>
                                </div>
                            </div>
                            <div class="reply-content">병원 가보세요~</div>
                        </div>
                    </div>

                    <!-- 대댓글 형식 -->
                    <div class="board-reply-box re-reply-width">
                        <div class="board-reply-profile"><img src="<%=contextPath%>/resources/community/userProfile.jpg" alt=""></div>
                        <div class="board-reply-content">
                            <div class="reply-title-box">
                                <div>
                                    <span class="reply-user">강아지왕</span>
                                    <span class="reply-date">2024.05.02 17:03</span>
                                    <button>답글 달기</button>
                                </div>
                            </div>
                            <div class="reply-content">병원 가보세요~</div>
                        </div>
                    </div>

                    <!-- 답글 달기 클릭 시 나오는 input 창 -->
                    <div class="board-reply-box re-reply-width">
                        <form action="">
                            <div class="reply-regist-info">
                                <div>
                                    <img src="<%=contextPath%>/resources/community/userProfile.jpg" alt="">
                                    <span>강아지왕</span>
                                </div>
                                <button class="common-button pink-button">댓글 등록</button>
                            </div>
                            <textarea name="" id="" class="reply-textarea gray-round-box" placeholder="댓글을 입력하세요."></textarea>
                        </form>
                    </div>

                    <div class="board-reply-box">
                        <div class="board-reply-profile"><img src="<%=contextPath%>/resources/community/userProfile.jpg" alt=""></div>
                        <div class="board-reply-content">
                            <div class="reply-title-box">
                                <div>
                                    <span class="reply-user">강아지왕</span>
                                    <span class="reply-date">2024.05.02 17:03</span>
                                    <button>답글 달기</button>
                                </div>
                            </div>
                            <div class="reply-content">병원 가보세요~</div>
                        </div>
                    </div>
                </div>
                <!-- 리뷰 등록란 -->
                <div id="board-reply-regist">
                    <form action="">
                        <div class="reply-regist-info">
                            <div>
                                <img src="<%=contextPath%>/resources/community/userProfile.jpg" alt="">
                                <span>강아지왕</span>
                            </div>
                            <button class="common-button pink-button">댓글 등록</button>
                        </div>
                        <textarea name="" id="" class="reply-textarea gray-round-box" placeholder="댓글을 입력하세요."></textarea>
                    </form>
                </div>
            </div>

                

            </div>

            <!-- The Modal -->
            <div class="modal" id="delete-content">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal body -->
                        <div class="modal-body" id="delete-text">
                            <div class="minibox-title">
                                해당 글을 삭제하시겠습니까?
                            </div>
                            
                            <button class="common-button pink-button">삭제</button>
                            <button class="common-button white-button" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box"><h1>제목</h1></div>
                    <div class="tmp-box">말머리</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">조회수</div>
                    <div class="tmp-box">등록일</div>
                </div>
            </div>

            <div class="tmp-box">
                <div class="tmp-box">사진</div>
                <div>글 내용</div>
                <div class="row-box">
                    <div class="tmp-box">좋아요 아이콘</div>
                    <div class="tmp-box">좋아요 n</div>
                    <div class="tmp-box">댓글 아이콘</div>
                    <div class="tmp-box">댓글 n</div>
                </div>
            </div>

            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box">시간</div>
                    <div class="tmp-box">답글달기</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div>댓글 내용</div>
            </div>
            <hr>
            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box">시간</div>
                    <div class="tmp-box">답글달기</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div>댓글 내용</div>
            </div>
            <hr>
            <div class="tmp-box">
                <div class="row-box">
                    <div class="tmp-box">프사</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box">시간</div>
                    <div class="tmp-box">답글달기</div>
                    <div class="tmp-box">⋮</div>
                </div>
                <div>댓글 내용</div>
            </div>
            <hr>
            <div>
                <div class="row-box">
                    <div class="tmp-box">아이콘</div>
                    <div class="tmp-box">닉네임</div>
                    <div class="tmp-box"><button>댓글 등록</button></div>
                </div>
                <input type="text" placeholder="댓글을 작성하세요.">
            </div> -->
        </div>
    </div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>