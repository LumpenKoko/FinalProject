<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="resources/css/community/community.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="wrapper">
		<div class="main">
			<div class="writing-area">
				<form action="test.bo">
					<div>
						<div>
							<select id="category" name="category">
								<option value="" selected hidden>카테고리</option>
								<option value="health">건강/병원</option>
								<option value="restrant">식당/카페</option>
								<option value="travel">여행/숙소</option>
								<option value="event">행사/테마파크</option>
								<option value="product">반려용품</option>
								<option value="talk">잡담</option>
								<option value="qna">Q&A</option>
							</select>
						</div>
						<div>
							<input type="text" placeholder="제목을 입력하세요" id="titleInput">
						</div>
						
					</div>
					
					<div id="summernote"></div>
					
					<div class="tmp-box">
						<button>사진이미지</button>
					<button type="submit" class="pink-button">게시글 등록</button>
					</div>
					
				</form>
			
				<script>
				  $('#summernote').summernote({
					placeholder: '내용을 입력하세요',
					height: 500,
					toolbar: [
					['style', ['style']],
					['font', ['bold', 'underline', 'clear']],
					['color', ['color']],
					['para', ['ul', 'ol', 'paragraph']],
					['table', ['table']],
					['insert', ['link', 'picture', 'video']],
					['view', ['fullscreen', 'codeview', 'help']]
					]
				  });
				</script>
			</div>
		</div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>