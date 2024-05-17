<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail/detail.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail/review.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f595fad336a38c5fdd5a3f12c81c8cdb&libraries=services,clusterer,drawing"></script>
<script src='<%=request.getContextPath()%>/js/map/map.js'></script>


</head>
<body>
	
	<%@ include file="../common/header.jsp"%>
   
	<div class="wrapper">
		 <div id="header_img">
		 		 <div id="show_name">공간 이름</div>
		        <img src="<%=contextPath%>/resources/img/공간2.png">
		</div>
		<div class="main detail_main">
		
			<div class="space_detail">
			     <div class="title">공간 이름</div>
				 <div class="good">
					<div id="heart">♡</div>&nbsp;
					<div id="count">46</div>
				</div>
			</div>
			
			<div class="section">
			  <div class="title">소개</div>
			  
			  <div class="content"> 
				마당이 있는 넓은 펜션입니다. 마당이 있는 넓은 펜션입니다. 마당이 있는 넓은 펜션입니다. 
				마당이 있는 넓은 펜션입니다. 마당이 있는 넓은 펜션입니다.
				마당이 있는 넓은 펜션입니다. 마당이 있는 넓은 펜션입니다. 마당이 있는 넓은 펜션입니다. 마당이 있는 넓은 펜션입니다. 
			  </div>
				
			</div>
			
			 <div class="detail_div">
				<div class="section detail_area">
				    <div class="title">상세정보 </div>
					<div class="content">
						<% for (int i=0; i<100; i++) { %>
							<%="내용"%>
						<%} %>
					</div>
				</div>
				
				<div class="section more_area">
					
					<span class="title">더 알아보기</span><br>
					<div><button class="common-button white-button" style="width:100%;">지도보기</button></div>
					<div> </div>
				    <div><button class="common-button pink-button" style="width:100%;">채팅문의</button></div>
					
				</div>
			 </div>

			
			<div class="section">
				<div class="title">시설 상세</div>
				<div class="img-space">
					<%for (int l =0 ; l<3; l++){ %>
					 <div class="img-div"><img src="<%=contextPath%>/resources/img/tori.jpg" alt="Profile Image"></div>
					<% } %>
				</div>
			</div>

			<div class="section">
				<div class="title">상품 정보</div>
				<div class="content">내용</div>
			</div>

			<div class="location_div">
				<div class="section location_area">
				    <div class="title">위치정보 </div>
					<div class="content">
						<div id="location_map" style="width:100%; height:500px;"></div>
					</div>
				</div>
				
				<div class="section hospital_area">
					<div class="title">동물병원</div>
					<div class="content">
						<div id="hostpial_map" style="width:80%;height:80%;"></div>
				    </div>
				</div>
			 </div>
			

			<div class="section review">
				<div class="title">리뷰</div>
				<div class="review-detail">
				     <ul class="detail-ul">
						<li class="title score">4.3</li>
						<li class="star" style="color:#FE8B94;">★★★★★★</li>
						<li class="count" style="color:#c2bcbc;">1204건의 리뷰</li>
						
					</ul>
					<ul class="category-ul">
						<li><a href="#">최신순</a></li>
						<li><a href="#">높은 평점순</a></li>
						<li><a href="#">낮은 평점순</a></li>
					</ul>
				</div>

				<!--리뷰 내용영역-->
				<%for(int i=0; i<10; i++){ %>

				<div class="review-section">
					<div class="profile-star">
						<div class="profile">
							<div class="img-div"><img src="<%=contextPath%>/resources/img/tori.jpg" alt="Profile Image"></div>
							<div><span class="title">토리형</span><br>
								<span>2024.05.18</span>
							</div>
						</div>

						<div>
							<span class="star" style="color:#FE8B94;">★★★★★★</span>
							<span><a href="#">수정</a>|<a href="#">삭제</a></span>
						</div>
				    </div>

					<div class="img-content">
						<%for (int l =0 ; l<3; l++){ %>
						<div class="img-div"><img src="<%=contextPath%>/resources/img/tori.jpg" alt="Profile Image"></div>
						<% } %>
					</div>

					<div class="content">
                      <%for(int k=0 ; k<50; k++){%>
						 내용내용내용
					  <%}%>
					</div>

	         	</div> 

				 <!--답글 영역-->
				 <!-- 답글이 있을때만 처리 -->

				 <div style="align-items: right;">
					<div class="review-section reply">
					
						<div class="reply-master">
							<div class="title master">사장님</div>
							<div>2024-05-17</div>
						</div>

						<div class="content master-reply">
								<%for(int k=0 ; k<30; k++){%>
									답글내용내용내용
								<%}%>
						</div>
					</div>
			    </div>
				<%}%>

				<!--리뷰 작성 영역-->
				<div class="review-section">
					<div class="enroll-div">
						<div class="enroll-profile">
							<div class="img-div">
								<img src="<%=contextPath%>/resources/img/tori.jpg" alt="Profile Image">
							</div>
							<div class="star">☆☆☆☆☆</div>
						</div>

						<div class="review-enroll">
							<button class="common-button pink-button">리뷰 등록</button>
						</div>
					</div>

					<div class="enroll-area">
						<div class="review-section input-review">
							<textarea  class="input-area" placeholder="내용을 입력하세요"></textarea>

						</div>
						<div class="review-section input-img">
							<input type="file" placeholder="파일을 첨부하세요">
						</div>
					</div>

				</div>
			</div>
			
		</div>
	
	
	</div>
	<%@ include file="../common/footer.jsp"%>

</body>

</html>
