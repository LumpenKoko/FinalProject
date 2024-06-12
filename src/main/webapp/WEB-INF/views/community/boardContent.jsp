<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="resources/css/community/community.css"/>
	<link rel="stylesheet" href="resources/css/community/boardContent.css"/>
    <script src='resources/js/boardShow/init.js'></script>
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
                            <span id="board-title-text">${board.boardTitle}</span>
                            <span id="board-category-text">${board.categoryName}</span>
                        </div>
                        <div class="change-button-box">
                            <img src="resources/community/threeCircle.png" alt="">
                            <div class="change-box">
                                <div class="change-box-list" onclick="location.href='#'">수정하기</div>
                                <div class="change-box-list change-box-last" data-toggle="modal" data-target="#delete-content">삭제하기</div>
                            </div>
                        </div>
                    </div>
                    <div id="board-header-info">
                        <div>
                            <img src="${board.userProfile.filePath}${board.userProfile.changeName}" alt="">
                            <span>${board.userNickName}</span>
                        </div>
                        <span>조회수 ${board.count}</span>
                        <span>등록일 ${board.createDate}</span>
                    </div>
                </div>

                <!-- 글 내용 및 사진 영역 -->
                <div id="board-content-box">
                    <div id="board-content-text">
                        <img src="resources/community/userProfile.jpg" alt="">
                        <div>${board.boardContent}</div>
                    </div>
                    <div id="board-communication-box">
                        <div class="board-communication-info">
                            <!-- 좋아요 여부에 따라 처리 필요 -->
                            <img src="resources/community/like-after.png" alt="">
                            <span>좋아요 ${board.goodCount}</span>
                        </div>
                        <div class="board-communication-info">
                            <img src="resources/community/reply.png" alt="">
                            <span>댓글 ${board.replyCount}</span>
                        </div>
                    </div>
                </div>

                <!-- 댓글 리스트 -->
                <div id="board-reply-title">댓글</div>
                 

                        <div id="board-reply-list">
                            <c:forEach   var="r"  items="${board.replys}">

                            <!-- 로그인한 유저가 작성한 본인 댓글 -->
                                    <div class="board-reply-box">
                                        <div class="board-reply-profile">
                                            <img src="${r.replyUserProfile.filePath}${r.replyUserProfile.changeName}"alt="">
                                        </div>
                                        
                                        <div class="board-reply-content">
                                            <div class="reply-title-box">
                                                <div>
                                                    <span class="reply-user">${r.userNickName}</span>
                                                    <span class="reply-date">${r.createDate}</span>
                                                    <button onclick="replyInsert('${r.replyNo}')">답글 달기</button>
                                                </div>
                                                
                                                <div class="change-button-box">
                                                    <img src="resources/community/threeCircle.png" alt="">
                                                    <div class="change-box">
                                                        <div class=""><a>수정하기</a></div>
                                                        <div class="" data-toggle="modal" data-target="#delete-content"><a>삭제하기</a></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="reply-content">${r.content}</div>
                                        </div>

                                    </div>


                                <!-- 대댓글 형식 -->
                                    <c:forEach   var="rr"  items="${r.replyReply}">
                                        <div class="board-reply-box re-reply-width">
                                                <div class="board-reply-profile"><img src="${rr.replyUserProfile.filePath}${rr.replyUserProfile.changeName}" alt=""></div>
                                                <div class="board-reply-content">
                                                    <div class="reply-title-box">
                                                        <div>
                                                            <span class="reply-user">${rr.userNickName}</span>
                                                            <span class="reply-date">${rr.createDate}</span>
                                                            <!-- <button onclick="replyInsert('${r}')" >답글 달기</button> -->
                                                        </div>
                                                        <div class="change-box">
                                                            <div class=""><a>수정하기</a></div>
                                                            <div class="" data-toggle="modal" data-target="#delete-content"><a>삭제하기</a></div>
                                                        </div>
                                                    </div>
                                                    <div class="reply-content">${rr.content}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                   


                                <!-- 답글 달기 클릭 시 나오는 input 창 -->
                                    <div id="reply-content${r.replyNo}" style="display:none;" class="re-reply-width board-reply-box">
                                        <form action="">
                                            <div class="reply-regist-info">
                                                <div>
                                                    <img src="resources/community/userProfile.jpg" alt="">
                                                    <span>강아지왕</span>
                                                </div>
                                                <div class="replybutton-div"><button class="common-button pink-button">답글 등록</button></div>
                                            </div>
                                            <div class="input-reply-div">
                                                <div class="replytext-div"><textarea name="" id="replyText" class="reply-textarea gray-round-box" placeholder="댓글을 입력하세요."></textarea></div>
                                            </div>
                                        </form>
                                    </div>
                              

                         </c:forEach>

                        </div>
               

                <!-- 리뷰 등록란 -->
                <div id="board-reply-regist">
                    <form action="">
                        <div class="reply-regist-info">
                            <div>
                                <img src="${board.userProfile.filePath}${board.userProfile.changeName}" alt="">
                                <span>${r.userNickeName}</span>
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