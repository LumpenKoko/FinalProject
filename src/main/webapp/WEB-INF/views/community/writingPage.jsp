<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<%@ include file="../common/common-file.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/community.css"/>

	<style>
        input::placeholder {
            color: gray;
            font-weight: bold;
            font-size: 24px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="wrapper tmp-box">
		<div class="main tmp-box">
			<div class="tmp-box">

			</div>
			<form action="test.bo">
				<select id="test" name="test">
					<option value="" selected hidden>카테고리</option>
					<option value="health">건강/병원</option>
					<option value="restrant">식당/카페</option>
					<option value="travel">여행/숙소</option>
					<option value="event">행사/테마파크</option>
					<option value="product">반려용품</option>
					<option value="talk">잡담</option>
					<option value="qna">Q&A</option>
				</select>
				<br>
				<input type="text" placeholder="제목을 입력하세요">
		
				<div id="summernote"></div>
				<button>사진이미지</button>
				<button type="submit">게시글 등록</button>
			</form>
		
			<script>
			  $('#summernote').summernote({
				placeholder: '내용을 입력하세요',
				height: 350
			  });
			</script>
		</div>
	</div>
	
    <%@ include file="../common/footer.jsp"%>
</body>
</html>