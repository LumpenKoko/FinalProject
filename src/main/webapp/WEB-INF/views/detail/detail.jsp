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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail/room.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f595fad336a38c5fdd5a3f12c81c8cdb&libraries=services,clusterer,drawing"></script>
<script src='<%=request.getContextPath()%>/js/map/map.js'></script>
<script src='<%=request.getContextPath()%>/js/map/hostpital-map.js'></script>


</head>
<body>
	
	<%@ include file="../common/header.jsp"%>
   
	<div class="wrapper detail-wrapper">
		<div class="header-img">
		 	<div class="show-name">공간 이름</div>
		    <img src="<%=contextPath%>/resources/img/공간2.png">
		</div>
		<div class="main detail-main">
			<div class="space-detail">
			     <div class="title">공간 이름</div>
				 <div class="good">
					<div id="heart"><a href="#">♡</a></div>&nbsp;
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
			
			 <div class="detail-div">
				<div class="section detail-area">
				    <div class="title">상세정보 </div>
					<div class="detail-information detail-content">
					    <div>
							<div class="content">숙소</div>
							<div class="content">02-1234-5678</div>
							<div class="content">체크인 15:00/체크아웃 11:00</div>
						</div>
						<div>
							<div class="content">소형견,중형견,고양이</div>
							<div class="content">부산광역시 해운대 극성로</div>
							<div class="content">https://place-site.yanolja.com</div>	
						</div>
					</div>
				</div>
				
				<div class="section more-area">
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

            <!-- 장소 종류에따라 처리-->

			<!--상품 정보-->
			<div class="section">
				<div class="title">상품 정보</div>
				<% for(int i=0; i<3; i++){%>
					<div class="content sales">
						<div>등심돈까스</div>
						<div style="width:80%"><hr></div>
						<div>12000원</div>	
					</div>
				<%}%>
			</div>

			 <!--객실 정보-->

			 <div class="section room">
				<div class="title">객실 정보</div>
				<div class="room-section room-information">
					<div class="img-div">
                        <img src="<%=contextPath%>/resources/img/tori.jpg"/>
					</div>
					<div class="room-info">
						<div class="title" style="color:var(--main-color);">스탠다드 트윈(OTT 시청가능)</div>
						<div class="title price">6800원</div>
						<div style="width:100%"><hr></div>
						<div class="check-in-out">
							체크인:<span>15:00</span>/체크아웃<span>11:00</span>
						</div>
						<div class="capacity">
							객실기준<span>2</span>명/최대<span>2</span>명
						</div>
						<div class="detail-show">
							<button class="common-button white-button">상세보기</button>
						</div>
					</div>	
				</div>
			</div>

           	<!--위치-->
			<div class="location-div">
				<div class="section location-area">
				    <div class="title">위치정보 </div>
					<div class="content">
						<div id="location-map" style="width:100%; height:500px;"></div>
					</div>
				</div>
				
				<div class="section hospital-area">
					<div class="title">동물병원</div>
					<div class="content">
						<div id="hostpial_map" style="width:150px;height:500px;"></div>
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
							<label for="fileInput" class="upload-label " style="font-size: 120px; font-weight:bold;">+</label>
							<input id="fileInput" name="file" type="file" style="display: none;">
						</div>
					</div>

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
	
	
	</div>
	<%@ include file="../common/footer.jsp"%>

</body>

</html>
