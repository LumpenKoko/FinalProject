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
            <div id="container"></div>
            <div id="loader">Loading...</div>
        </div>
    </div>

    <script>
        const container = document.getElementById('container');
        const loader = document.getElementById('loader');

        // 더미 데이터 생성 함수
        function createItem(num) {
            const item = document.createElement('div');
            item.className = 'shorts-view tmp-box';
            item.innerHTML = `
            <div class="shorts-content" id="shorts-content`+ num + `">
                <img style="width: 100%; height: 100%;" src="resources/img/review.jpg" alt="숏츠이미지">
                <div class="text-overlay">
                    <b>썸네일 설명들</b>
                    <button class="comment-button" data-index="`+ num + `" data-toggle="true">댓글보기</button>
                </div>
            </div>
            <div id="shorts-comment`+ num + `" class="shorts-comment tmp-box flex-box">댓글들..~</div>
            `;
            return item;
        }

        // 댓글 오른쪽으로 나오게 하는 함수
        $(document).ready(function(){
            let isVisible = false;

            $('.comment-button').click(function(ev){
               
                const btn = ev.target;
                const index = btn.dataset.index;
                btn.dataset.toggle = btn.dataset.toggle === "true" ? "false" : "true";
                const toggle = btn.dataset.toggle;
             
            
               
                if (toggle === "true") {
                    $("#shorts-comment" + index).animate({right: '30%'}, 'slow');
                    $("#shorts-content" + index).animate({left: '30%'}, 'slow');
                } else {
                    $("#shorts-comment" + index).animate({right: '10%'}, 'slow');
                    $("#shorts-content" + index).animate({left: '10%'}, 'slow');
                }
                
            });
        });


        // 더미 데이터 로딩 함수
        function loadItems(numItems = 10) {
            let lastItemNum = container.children.length;
            for (let i = 1; i <= numItems; i++) {
                const newItem = createItem(lastItemNum + i);
                container.appendChild(newItem);
            }
        }

        // Intersection Observer 콜백 함수
        function handleIntersect(entries, observer) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    loadItems();
                    observer.unobserve(loader); // 로더가 보이면 일단 관찰 해제
                    observer.observe(loader); // 로더를 다시 관찰하여 무한 스크롤 구현
                }
            });
        }

        // Intersection Observer 설정
        const observer = new IntersectionObserver(handleIntersect, {
            root: null,
            rootMargin: '0px',
            threshold: 1.0
        });

        // 초기 데이터 로드
        loadItems();
        observer.observe(loader);
    </script>
    
</body>
</html>