<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common-file.jsp"%>

<link rel="stylesheet" href="resources/css/detail/detail.css"/>
<link rel="stylesheet" href="resources/css/detail/review.css"/>
<link rel="stylesheet" href="resources/css/detail/room.css"/>
<link rel="stylesheet" href="resources/css/detail/review_star.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f595fad336a38c5fdd5a3f12c81c8cdb&libraries=services,clusterer,drawing"></script>

<script src='resources/js/location/ajax/init.js'></script>
<script src='resources/js/location/ajax/pickAjax.js'></script>
<script src='resources/js/location/ajax/reviewAjax.js'></script>
<script src='resources/js/location/pick/pick.js'></script>
<script src='resources/js/location/map/map.js'></script>
<script src='resources/js/location/map/hostpital-map.js'></script>
<script src='resources/js/location/location.js'></script>
<script src='resources/js/location/review/review.js'></script>

</head>
<%@ include file="../common/header.jsp"%>

<body onload="init('<%=contextPath%>',2)">
	

	<div class="wrapper detail-wrapper">
		<!--헤더 이미지-->

		    <c:set var="i" value="0"/>
			<c:set var="k" value="0"/>

			<div id="headerImg" class="header-img" style="background: url('${mainImg.get(i).filePath}${mainImg.get(i).changeName}')  no-repeat center center/cover;">
				
				
				<c:set var="maxSize" value="${mainImg.size()}"/>

				<div class="head-img-pre">
					<button onclick="moveImg('${i=(i==0)?maxSize-1:i-1}','${mainImg.get((i%maxSize)).filePath}${mainImg.get(i).changeName}')">&gt;</button>
					<!-- <input type="text" value="${k=i}" hidden> -->
				</div>
				 <div class="overlay">
					<h1 class="gugi-regular">${location.locationName}</h1>
				</div>
				<div class="head-img-next">
					<button onclick="moveImg('${k=(k==(maxSize-1))?0:k+1}','${mainImg.get((k%maxSize)).filePath}${mainImg.get(k).changeName}')">&lt;</button>
				</div>
				 <input type="text" value="${i=k}" hidden>
			</div>
		



		<!--메인영역-->
		<div class="main detail-main">
			<div class="space-detail">
			     <div class="title">${location.locationName}</div>
				 <div class="good">
					<div><a id="heart" class="pick-heart">♥</a></div>&nbsp;
					<div id="count">46</div>
				</div>
			</div>
			
			<div class="section">
			   <div class="title">소개</div>
			   <div class="content"> ${location.explanation}</div>
			</div>
			
			 <div class="detail-div">
				<div class="section detail-area">
				    <div class="title">상세정보 </div>
					<div class="detail-information detail-content">
					    <div>
							<div class="content">${location.categoryName}</div>
							<div class="content">${location.locationPhone}</div>
							<div class="content">${location.day}</div>
						</div>
						<div>
							<div class="content">${location.kindName}</div>
							<div class="content">${location.address}</div>
							<div class="content">${location.reservationLink}</div>	
						</div>
					</div>
				</div>
				
				<div class="section more-area">
					<span class="title">더 알아보기</span><br>
					<div><button class="common-button white-button" style="width:100%;" onclick="location.href='https://map.kakao.com/link/search/제주특별자치도 제주시 첨단로 242'">지도보기</button></div>
					<div> </div>
				    <div><button class="common-button pink-button" style="width:100%;" onclick ="location.href='chat'">채팅문의</button></div>
				</div>
			 </div>

			
			<div class="section">
				<div class="title">시설 상세</div>
				<div class="img-space">
					<%for (int l =0 ; l<3; l++){ %>
					 <div class="img-div"><img src="resources/img/tori.jpg" alt="Profile Image"></div>
					<% } %>
				</div>
			</div>

            <!-- 장소 종류에따라 처리-->

			<!--상품 정보-->
			<div class="section">
				<div class="title">상품 정보</div>
				<% for(int i=0; i<3; i++){%>
					<div class="content sales">
						<div>${location.goods}</div>
						<div style="width:80%"><hr></div>
						<div>${location.goodPrice}</div>	
					</div>
				<%}%>
			</div>

			 <!--객실 정보-->

			 <div class="section room">
				<div class="title">객실 정보</div>
				<div class="room-section room-information">
					<div class="img-div">
                        <img src="resources/img/tori.jpg"/>
					</div>
					<div class="room-info">
						<div class="title" style="color:var(--main-color);">${location.roomInfo}</div>
						<div class="title price">${location.goodPrice}</div>
						<div style="width:100%"><hr></div>
						<div class="check-in-out">
							${location.day}</span>
						</div>
						<div class="capacity">
							객실기준<span>${location.capacity}</span>명/최대<span>${location.capacity}</span>명
						</div>
						<div class="detail-show">
							<button  type="button" class="common-button white-button btn btn-primary" data-toggle="modal" data-target="#myModal">상세보기</button>
						</div>
					</div>	
				</div>
			</div>

	 <!-- The Modal -->
	 <div class="modal fade wrapper" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
		  <div class="modal-content">
		  
			
			<!-- Modal body -->
			<div class="modal-body room-modal">
				<div class="title">객실 상세</div>
				<div class="img-modal-div">
					<%for (int l =0 ; l<3; l++){ %>
					 <div class="img-modal"><img src="resources/img/tori.jpg" alt="Profile Image"></div>
					<% } %>
				</div>
				 <table>
						<tr>
							<th>객실명</th>
							<td>${location.goods}</td>
						</tr>

						<tr>
							<th>가격</th>
							<td>${location.goodPrice}</td>
						</tr>
						
						<tr>
							<th>시간</th>
							<td>${location.day}</td>
						</tr>
						<tr>
							<th>수용인원</th>
							<td>최대${location.capacity}명</td>
						</tr>
					    <tr>
							<th>상세정보</th>
							<td>${location.roomInfo}</td>
						</tr>
					</table>
				
			</div>
			  <!-- Modal footer -->
			  <div class="modal-footer" style="align-items: center; width:100%;">
				<button type="button" class="common-button pink-button">예약하기</button>
				<button type="button" class="common-button white-button" data-dismiss="modal">닫기</button>
			  </div>
			
			 </div>
		</div>
	 </div>
	  
  



           	<!--위치-->
			<div class="location-div">
				<div class="section location-area">
				    <div class="title">위치정보 </div>
				    <input id="address" type="text" value="제주특별자치도 제주시 첨단로 242" hidden>
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
						<li class="title score">${location.locationStar}</li>
						<li class="avg-star" style="color:#FE8B94;">★★★★★</li>
						<li class="count" style="color:#c2bcbc;">1204건의 리뷰</li>
					</ul>
					<ul class="category-ul">
						<li><a href="#">최신순</a></li>
						<li><a href="#">높은 평점순</a></li>
						<li><a href="#">낮은 평점순</a></li>
					</ul>
				</div>

                <!--내용-->
				<c:forEach var="r" items="${review}">
					<div class="review-section">
					<div class="profile-star">
						<div class="profile">
							<div class="img-div"><img src="resources/img/tori.jpg" alt="Profile Image"></div>
							<div><span class="title">${r.userName}</span><br>
								<span>${r.enrollDate}</span>
							</div>
						</div>

						<div>
						  <span  style="color:#FE8B94;">
							 <c:forEach begin="1" end="${r.reviewStar}">★</c:forEach>
						  </span>
							<span><a href="#">수정</a>|<a href="#">삭제</a></span>
						</div>
				    </div>

					<div class="img-content">
						<c:forEach var="a" items="${r.attachment}">
							<div class="img-div"><img src="${a.filePath}${a.changeName}" alt="Profile Image"></div>
						</c:forEach>
					</div>
					<div class="content">${r.reviewContent}</div>
				</div>

				<!-- 답글이 있을때만 처리-->
				<c:if test="${r.ownerReplyContent != null}">
					<div style="align-items: right;">
						<div class="review-section reply">
						
							<div class="reply-master">
								<div class="title master">사장님</div>
								<div>${r.ownerEnroll}</div>
							</div>
							<div class="content master-reply">${r.ownerReplyContent}</div>
						</div>
				</div>
			 </c:if>
			   </c:forEach>

			<!--test리뷰 내용영역-->
			<c:forEach begin="1" end="2">
				
				<div class="review-section">
					<div class="profile-star">
						<div class="profile">
							<div class="img-div"><img src="resources/img/tori.jpg" alt="Profile Image"></div>
							<div><span class="title">토리형</span><br>
								<span>2024.05.18</span>
							</div>
						</div>

						<div>
							<span  style="color:#FE8B94;">★★★★★</span>
							<span><a href="#">수정</a>|<a href="#">삭제</a></span>
						</div>
				    </div>

					<div class="img-content">
						<c:forEach begin="1" end="3">
							<div class="img-div"><img src="resources/img/tori.jpg" alt="Profile Image"></div>
						</c:forEach>
					</div>

					<div class="content">
					  <c:forEach begin="1" end="50">
						  내용내용내용
					   </c:forEach>
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
			</c:forEach>

				<!--리뷰 작성 영역-->
				<div class="review-section">
					<div class="enroll-div">
						<div class="enroll-profile">
							<div class="img-div">
								<img src="resources/img/tori.jpg" alt="Profile Image">
							</div>
							<div class="star-rating">
								<input type="radio" class="star" name="rating"  value="1">
								<input type="radio" class="star" name="rating"  value="2">
								<input type="radio" class="star" name="rating"  value="3">
								<input type="radio" class="star" name="rating"  value="4">
								<input type="radio" class="star" name="rating"  value="5">
							</div>
						</div>

						<div class="review-enroll">
							<button id="review-submit" class="common-button pink-button" type="button">리뷰 등록</button>
						</div>
					</div>

					<div class="enroll-area">
						<div class="review-section input-review">
							<textarea  id="review-content" class="input-area" placeholder="내용을 입력하세요"></textarea>
						</div>
						<div class="review-section input-img">
							<label id="img-background" for="fileInput" class="upload-label" style="background: url(resources/img/myPage/+.png)  no-repeat center center/cover;">
								<div  id="img-count" style="float:right; margin-top:170px; font-weight: bold; font-size:18px; color:green">0</div>
							</label>
							<input id="fileInput" name="file" type="file" style="display: none;" onchange="fileUpload(this)">
						</div>
					</div>
					<div id="file-list">file-list</div>
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
