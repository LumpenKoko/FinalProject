// 댓글 가져오는 함수
$(document).on('click', '[id^="show-reply-btn"]', function () {

    const num = parseInt(this.id.replace('show-reply-btn', ''));
    console.log(num);
    console.log(typeof(num));

    $.ajax({
        url: contextPath + '/loadReply.sh',
        data: {
            num: num
        },
        success: function (response) {
            const replyList = JSON.parse(response);

            if (response === null) {
                const newComment = $('<div class="tmp-box"></div>').text("아직 댓글이 없어요ㅠㅠ");
                $('#comments-list' + num).append(newComment);
            } else {
                for (let i = 0; i < replyList.length; i++) {
                    const newComment = $('<div class="tmp-box"></div>').text(replyList[i].content);
                    $('#comments-list' + num).append(newComment);
                }
            }
        },
        error: function () {
            console.log("댓글 로드 실패");
        }
    });
});


// 댓글 입력하는 함수
$(document).on('click', '[id^="submit-comment"]', function () {

    const loginUserNo = parseInt(userNo);
    const num = parseInt(this.id.replace('submit-comment', ''));
    const commentText = $('#comment-text' + num).val().trim();

    if (loginUserNo === 0) {
        alert("로그인한 회원만 댓글을 작성할 수 있습니다.");
        return;
    }

    if (commentText === "") {
        alert("댓글을 입력하세요.");
        return;
    }
    
    $.ajax({
        url: contextPath +'/addComment.sh',
        data: {
            userNo: loginUserNo,
            num: num,
            comment: commentText
        },
        success: function (response) {
            if (response === null) {
                alert("댓글을 추가하는 데 실패했습니다. 다시 시도해주세요.");
            } else {
                const newComment = $('<div class="tmp-box"></div>').text(response);
                $('#comments-list' + num).append(newComment);
                $('#comment-text' + num).val('');
            }
        },
        error: function () {
            alert("댓글을 추가하는 데 실패했습니다. 다시 시도해주세요.");
        }
    });
    
});

// Ajax로 동영상을 가져와서 동영상 요소 생성
function loadVideo(num) {
    $.ajax({
        url: contextPath + '/getVideo.sh',
        data: {
            videoId: num
        },
        success: function (response) {
            const totalShortsInfo = JSON.parse(response);

            const videoContainer = document.getElementById('video-container' + num);
            videoContainer.innerHTML = `
                        <video controls autoplay muted width="720" height="1080">
                            <source src="` + totalShortsInfo.shortsPath + totalShortsInfo.shortsName + `" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    `;
        },
        error: function () {
            console.log("동영상 로드 실패");
        }
    });
}