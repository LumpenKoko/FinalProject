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
            <div style="width: 40%; height: 100%; border: 1px solid black;">숏츠나 봐라...~</div>
            `;
            return item;
        }

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