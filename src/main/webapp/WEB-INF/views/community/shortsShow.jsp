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
    <div class="headerbar">
        <%@ include file="../common/header.jsp"%>
    </div>
    <div class="wrapper">
        <div class="main">
            <div style="height: 100px;"></div>
            <div id="container"></div>
            <div id="loader">Loading...</div>
        </div>
    </div>

    <script>
        const container = document.getElementById('container'); 
        const loader = document.getElementById('loader');

        let currentDivIndex = 0;
        let isScrolling = false;

        // 더미 데이터 생성 함수 (동영상 Ajax로 가져옴)
        function createItem(num) {
            const item = document.createElement('div');
            item.className = 'shorts-view makeCenter';
            item.innerHTML = `
            <div class="shorts-content" id="shorts-content`+ num + `">
                <div id="video-container` + num + `">
                    Loading video...
                </div>
                <div class="text-overlay">
                    <div>
                        <button class="comment-button" data-index="`+ num + `" data-toggle="true" id="show-reply-btn"`+ num +`>댓글보기</button>
                    </div>
                </div>
            </div>
            <div id="shorts-comment`+ num + `" class="shorts-comment tmp-box flex-box">
                <div style="width: 100%; height: 100%">
                    <div class="row-box" style="height: 10%">
                        <h1>댓글</h1>
                        <div style="color: var(--border-color)">56</div>
                    </div>
                    <div id="comments-list`+ num +`" style="height: 80%">
                        댓글 들어가는 곳..
                    </div>  
                    <div style="height: 10%">
                        <textarea id="comment-text`+ num +`" placeholder="댓글을 입력하세요"></textarea>
                        <button id="submit-comment`+ num +`">댓글달기</button>
                    </div>
                </div>
            </div>
            `;
            loadVideo(num);  // 1부터 시작함
            return item;
        }

        // Ajax로 동영상을 가져와서 동영상 요소 생성
        function loadVideo(num) {
            $.ajax({
                url: '<%=request.getContextPath()%>/getVideo.sh', // 일단 임시로 영상 url만 가져옴(추후 변경 필요)
                data: {
                    videoId: num
                },
                success: function(response) {
                    const totalShortsInfo = JSON.parse(response);

                    const videoContainer = document.getElementById('video-container' + num);
                    videoContainer.innerHTML = `
                        <video controls autoplay muted width="720" height="1080">
                            <source src="` + totalShortsInfo.shortsPath + totalShortsInfo.shortsName + `" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    `;
                },
                error: function() {
                    alert("동영상을 로드하는 데 실패했습니다.");
                }
            });
        }

        // 댓글 관련 함수들
        $(document).ready(function(){
            let isVisible = false;

            $(document).on('click', '.comment-button', function(ev){
                const btn = ev.target;
                const index = btn.dataset.index;
                btn.dataset.toggle = btn.dataset.toggle === "true" ? "false" : "true";
                const toggle = btn.dataset.toggle;

                if (toggle === "true") {
                    $("#shorts-comment" + index).animate({right: '30%'}, 'slow');
                    $("#shorts-content" + index).animate({left: '30%'}, 'slow');
                    loadReply();
                } else {
                    $("#shorts-comment" + index).animate({right: '10%'}, 'slow');
                    $("#shorts-content" + index).animate({left: '10%'}, 'slow');
                }
            });

            // 댓글 로드하는 함수
            /*
            function loadReply(){
                $.ajax({
                    url: '<%=request.getContextPath()%>/loadReply.sh',
                    data: {
                        num: num
                    },
                    success: function(response) {
                        const replyList = JSON.parse(response);

                        if(response === null) {
                            const newComment = $('<div class="tmp-box"></div>').text("아직 댓글이 없어요ㅠㅠ");
                            $('#comments-list' + num).append(newComment);
                        } else {
                            for (let i = 0; i < replyList.length; i++){
                                const newComment = $('<div class="tmp-box"></div>').text(replyList[i].content);
                                $('#comments-list' + num).append(newComment);
                            }
                        }
                    },
                    error: function() {
                        alert("댓글을 추가하는 데 실패했습니다. 다시 시도해주세요.");
                    }
                });
            }
            */

            // 댓글 가져오는 함수
            $(document).on('click', '[id^="show-reply-btn"]', function() {
                const num = this.id.replace('show-reply-btn', '');

                $.ajax({
                    url: '<%=request.getContextPath()%>/loadReply.sh',
                    data: {
                        num: num
                    },
                    success: function(response) {
                        const replyList = JSON.parse(response);

                        if(response === null) {
                            const newComment = $('<div class="tmp-box"></div>').text("아직 댓글이 없어요ㅠㅠ");
                            $('#comments-list' + num).append(newComment);
                        } else {
                            for (let i = 0; i < replyList.length; i++){
                                const newComment = $('<div class="tmp-box"></div>').text(replyList[i].content);
                                $('#comments-list' + num).append(newComment);
                            }
                        }
                    },
                    error: function() {
                        alert("skrr");
                    }
                });
            });


            

            // 댓글 입력하는 함수
            $(document).on('click', '[id^="submit-comment"]', function() {
                const num = this.id.replace('submit-comment', '');
                const commentText = $('#comment-text' + num).val().trim();

                if (commentText === "") {
                    alert("댓글을 입력하세요.");
                    return;
                }

                $.ajax({
                    url: '<%=request.getContextPath()%>/addComment.sh',
                    data: {
                        num: num,
                        comment: commentText
                    },
                    success: function(response) {
                        if(response === null) {
                            alert("댓글을 추가하는 데 실패했습니다. 다시 시도해주세요.");
                        } else {
                            const newComment = $('<div class="tmp-box"></div>').text(response);
                            $('#comments-list' + num).append(newComment);
                            $('#comment-text' + num).val('');
                        }
                    },
                    error: function() {
                        alert("댓글을 추가하는 데 실패했습니다. 다시 시도해주세요.");
                    }
                });
            });
        });

        // 더미 데이터 로딩 함수
        function loadItems(numItems = 10) {
            let lastItemNum = container.children.length;
            for (let i = 1; i <= numItems; i++) {
                const newItem = createItem(lastItemNum + i);
                container.appendChild(newItem);
            }
            updateDivs(); // 새로 로드된 아이템들로 divs 배열 업데이트
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

        function updateDivs() {
            divs = document.querySelectorAll('.makeCenter');
        }

        function scrollToDiv(index) {
            if (index >= 0 && index < divs.length) {
                const targetDiv = divs[index];
                const headerHeight = document.querySelector('.headerbar').offsetHeight;
                const targetPosition = targetDiv.offsetTop - headerHeight;
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
                currentDivIndex = index;
            }
        }

        window.addEventListener('wheel', (event) => {
            if (isScrolling) return;
            isScrolling = true;

            if (event.deltaY > 0) {
                // 아래로 스크롤
                scrollToDiv(currentDivIndex + 1);
            } else {
                // 위로 스크롤
                scrollToDiv(currentDivIndex - 1);
            }

            // 짧은 시간 내에 여러 번 스크롤하는 것을 방지
            setTimeout(() => {
                isScrolling = false;
            }, 500);  // 필요에 따라 지연 시간을 조정
        });

        // 초기 데이터 로드
        loadItems();
        observer.observe(loader);
        scrollToDiv(0);  // 초기 스크롤 위치 설정
    </script>
</body>
</html>
