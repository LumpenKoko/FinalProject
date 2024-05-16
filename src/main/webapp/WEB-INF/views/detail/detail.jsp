<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail/detail.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f595fad336a38c5fdd5a3f12c81c8cdb&libraries=services,clusterer,drawing"></script>


</head>
<body>
    
    <%@ include file="../common/header.jsp"%>
	
	<div class="wrapper">
		 <div id="header_img">
		 		 <div id="show_name">공간 이름</div>
		        <img src="<%=contextPath%>/img/공간2.png">
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
				  <% for (int i=0; i<200; i++) { %>
				      <%="소개"%>
				  <%} %>
			  </div>
				
			</div>
			
			 <div class="detail_div">
				<div class="section detail_area">
				    <div class="title">상세정보 </div>
					<div class="content">
						<% for (int i=0; i<200; i++) { %>
							<%="내용"%>
						<%} %>
					</div>
				</div>
				
				<div class="section more_area">
					<div class="title">더 알아보기</div>
					<div class="content">내용	
				    </div>
				</div>
			 </div>

			
			<div class="section">
				<div class="title">시설 상세</div>
				<div class="content">내용</div>
			</div>
			<div class="section">
				<div class="title">상품 정보</div>
				<div class="content">내용</div>
			</div>

			<div class="location_div">
				<div class="section location_area">
				    <div class="title">위치정보 </div>
					<div class="content">
						<div id="location_map" style="width:80%;height:80%;"></div>
					</div>
				</div>
				
				<div class="section hospital_area">
					<div class="title">동물병원</div>
					<div class="content">
						<div id="hostpial_map" style="width:80%;height:80%;"></div>
				    </div>
				</div>
			 </div>
			

			<div class="section">
				<div class="title">리뷰</div>
				
			</div>
			
		</div>
	
	
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>

<script src='<%=request.getContextPath()%>/js/map.js'></script>
</html>