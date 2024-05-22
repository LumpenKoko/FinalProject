<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="resources/css/community/community.css"/>

</head>
<body>
    <%@ include file="../common/header.jsp"%>
     <div class="wrapper community-wrap">
        <div class="main community-main">

            <div class="community-short-area">

                <div class="title-box flex-box short-title-height">
                    <div class="minibox-title">쇼츠</div>
                    <div>
                        <button class="common-button white-button">더보기</button>
                        <button class="common-button pink-button">쇼츠등록</button>
                    </div>
                </div>

                
                 <div class="short-content">
                     <!--그리드-->
                    <div class="grid-box short-area">
                        <%for(int i=0; i<10; i++){ %>
                         <div class="short-img-div">
                            <div class="short-img" >
                                <img src="resources/img/공간2.png">
                                <div class="img-detail">
                                    <div style="font-weight: bold; font-size:20px;"><%=i%>번째 고객</div><br>
                                    <div>2024-05-21</div>
                                    <div>쇼츠내용내용<br>
                                        쇼츠내용내용<br>
                                        쇼츠내용내용<br>
                                        쇼츠내용내용<br>
                                        쇼츠내용내용<br></div>
                                </div>
                            </div>
                         </div>
                        <%}%>
                    </div>
                    
                <!--페이지 처리 영역-->
                <div class="page-div">
                    <div id="previous-button" class="prv-button">
                        <a href="#" class="page-button">◀</a>
                    </div>
                    
                    <!--페이징 처리(페이징 객체 받아올것)-->
                    <% for (int i=1; i<=10; i++) {%>
                        <div><a href="#" class="number"><%=i%></a></div>
                    <%}%>
                    <div id="previous-button" class="next-button">
                        <a href="#" class="page-button">▶</a>
                    </div>
                </div>


                </div>
            </div>

            <div class="community-board-area">
                    <div class="title-box board-title-height ">
                        <div class="flex-box">
                            <div class="minibox-title">게시판</div>
                            <div>
                                <a href="<%=request.getContextPath()%>/enrollBoard.bo"><button class="common-button pink-button">게시글 등록</button></a>
                            </div>
                        </div>
                        <div class="flex-box">
                           <div><button  class="common-button white-button">전체글</button></div>
                           <div><button  class="common-button white-button">건강/병원</button></div>
                           <div><button  class="common-button white-button">식당/카페</button></div>
                           <div><button  class="common-button white-button">여행/숙소</button></div>
                           <div><button  class="common-button white-button">행사/테마파크</button></div>
                           <div><button  class="common-button white-button">반려용품</button></div>
                           <div><button  class="common-button white-button">잡답</button></div>
                           <div><button  class="common-button white-button">Q&A</button></div>
                        </div>
                    </div> 
                  <!--그리드-->
                  <div class="board-content">
                    <%for(int i=0; i<10; i++){ %>
                    <div class="grid-box board-area">

                        <div class="board-flex-div">
                            <div class="content-box">
                                <div class="profile">
                                    <div class="img-div">
                                        <img src="resources/img/tori.jpg">
                                    </div>
                                    <div>쿠키언니</div>
                                    <div>2024.00.00</div> 
                                </div>
                                <div class="content-title">
                                    <span class="category" style="font-size:18px;
                                    font-weight:bold;">건강/병원</span>&nbsp;&nbsp;
                                    <span class="">강아지 눈곱 이거 괜찮은 건가요</span>
                                </div>
                                <div class="content">
                                   asdfasdfasdfasdfasdfasdfasdf
                                   asdfasdfasdfasdfasdfasdfasdf
                                 
                                </div>
                                <div class="reply-count">
                                    <span><a href="#">조회수45</a></span>&nbsp;&nbsp;
                                    <span><a href="#">댓글 5</a></span>
                                </div>
                            </div>
                             <div class="img-box">
                               <img src="resources/img/tori.jpg">
                            </div>
                        </div>
                    </div>
                  <% }%>

                 <!--페이지 처리 영역-->
				<div class="page-div">
					<div id="previous-button" class="prv-button">
						<a href="#" class="page-button">◀</a>
					</div>
					
					<!--페이징 처리(페이징 객체 받아올것)-->
					<% for (int i=1; i<=10; i++) {%>
						<div><a href="#" class="number"><%=i%></a></div>
					<%}%>
					<div id="previous-button" class="next-button">
						<a href="#" class="page-button">▶</a>
					</div>
				</div>

                </div>
            </div>

            <div class="board-search">
                <div class="category-div">
                    <select  class=" select-box" name="kind" id="kind" class="category-kind">
                        <option value="" aria-readonly="true">==제목+본문==</option>
                        <option value="">여행/숙소</option>
                        <option value="">Q&A</option>
                        <option value="">Java</option>
                    </select>
                </div>
                <div class="search-div">
                    <input class=" input-box" type="text">
                    <button class="search-button" type="button">🔍</button>
                </div>
            </div>

        </div>
    </div>

     <%@ include file="../common/footer.jsp"%>

</body>
</html>