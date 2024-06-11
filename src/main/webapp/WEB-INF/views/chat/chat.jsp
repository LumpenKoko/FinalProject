<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<%@ include file="../common/common-file.jsp"%>
<link rel="stylesheet" href="resources/css/chat/chat.css"/>
<script src='resources/js/chat/chat.js'></script>
</head>
	<%@ include file="../common/header.jsp"%>
<body onload="init('${contextPath}','${masterId}')">
   
   	
	<div class="wrapper chat-wrapper">
		<div class="main chat-main">
			
			<div class="chat-box">
				<div class="chat-list">
					<div class="title t">채팅문의</div>
					<div class="over-flow">
						<%for(int i=0; i<15; i++){%>
							<div class="chat-grid chat-list-area">
								<div class="profile-area">
									<div class="img-div">
										<img src="resources/img/tori.jpg">
									</div>
									<div class="profile-list">
										<div class="title">토리형</div>
										<div class="content">넵 감사합니다.</div>
									</div>
								</div>
								
								<div class="notice">
									<div class="date">오후 12:34</div>
									<div class="notify">1</div>
								</div>
							</div>
						<%}%>
					</div>
				</div>

				<!--채팅영역-->
				<div class="chat-content">
					<div class="profile-box">
						<div class="hide-button">
							<div class="title">&lt;</div>
						</div>
						<div class="img-div">
							<img src="resources/img/tori.jpg">
						</div>
						<div class="title">토리형</div>
					</div>

					<!--#########-->
					<!--채팅내용 (비동기처리)-->
					<div  id="MasterMsg" class="chat-chatting">

						<!--사장님-->
						<div class="send-master">
							<div class="master-profile">
								<div class="img-div">
									<img src="resources/img/tori.jpg">
								</div>
								<div class="master-name title">사장님</div>
							</div>
							<div  class="content master-content master-color">
								<div><%for (int i=1; i<10; i++) {%>
										내용내용	내용내용	내용내용	내용내용
							    <%}%></div>
								<div class="time">20:16</div>
							</div>
						</div>


						<!--유저-->
						<div class="send-user">
							<div class="content  user-content user-color">
								<div>내용내용내용</div>
							 <div class="time">20:16</div>
							</div>
						</div>


						<!--유저-->
						<div class="send-user">
							<div class="content  user-content user-color">
								<div>
									<%for(int i=1; i<20; i++){%>
									내용내용	내용내용	내용내용	내용내용
									<%}%>
								</div>
								<div class="time">20:16</div>
							</div>
							
						</div>




						<!--사장님-->
						<div class="send-master">
							<div class="master-profile">
								<div class="img-div">
									<img src="resources/img/tori.jpg">
								</div>
								<div class="master-name title">사장님</div>
							</div>
							<div class="content master-color">
								<div>내용내용	내용내용	내용내용	내용내용</div>
								<div class="time">20:16</div>
							</div>
						</div>
           
						
					</div>
					<!--#########-->



					<!--채팅 입력창-->
					<div class="input-chatting">
						<div class="img">
							<label for="file" class="img-button">
								<img src="resources/img/img-icon.png">
							</label>
							<input id="file" type="file" style="display:none;">
						</div>
						<div class="input">
							<input  name="msg" type="text">
						</div>
						<div class="submit">
							<button id="send-button" type="button">
								<img src="resources/img/send-img.png">
							</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
   	 
	<%@ include file="../common/footer.jsp"%>
  
</body>

</html>