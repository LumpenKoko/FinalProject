// 댓글 가져오는 함수
$(document).on('click', '[id^="show-reply-btn"]', function () {

    const num = parseInt(this.id.replace('show-reply-btn', ''));

    $.ajax({
        url: contextPath + '/loadReply.sh',
        data: {
            num: num
        },
        dataType : "json",
        success: function (response) {
            const replyList = response;
            console.log(replyList);

            if (replyList.length === 0) {
                const newComment = $('<div class="tmp-box no-reply"></div>').text("아직 댓글이 없어요ㅠㅠ");
                $('#comments-list' + num).append(newComment);
            } else {
                $('#comments-list' + num).empty();
                for (let i = 0; i < replyList.length; i++) {
                    const newCommentContainer = $('<div class="comment-container"></div>');

                    // 프로필 사진을 담는 div
                    const profilePicDiv = $('<div class="profile-pic"></div>');
                    const profilePicImg = $('<img class="profile-img">');
                    profilePicImg.attr('src', replyList[i].profileFilePath + replyList[i].profileChangeName);
                    profilePicDiv.append(profilePicImg);
                    newCommentContainer.append(profilePicDiv);

                    // 사용자 정보와 댓글 내용을 담는 div
                    const commentInfoDiv = $('<div class="comment-info"></div>').text(replyList[i].userNickname + " : " + replyList[i].replyContent + " - " + replyList[i].enrollDate);
                    newCommentContainer.append(commentInfoDiv);

                    $('#comments-list' + num).append(newCommentContainer);
                    /*
                    예전 코드 백업
                    const newComment = $('<div class="tmp-box"></div>').text(replyList[i].userNickname + " : " + replyList[i].replyContent + " - " + replyList[i].enrollDate);
                    $('#comments-list' + num).append(newComment);
                    */
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

    console.log(loginUserNo);
    console.log(num);
    console.log(commentText);

    if (loginUserNo === 0) {
        alert("로그인한 회원만 댓글을 작성할 수 있습니다.");
        return;
    }

    if (commentText === "") {
        alert("댓글 내용을 입력하세요.");
        return;
    }
    
    $.ajax({
        url: contextPath +'/addComment.sh',
        data: {
            userNo: loginUserNo,
            num: num,
            comment: commentText
        },
        dataType : "json",
        success: function (response) {
            const reply = response;
            const newComment = $('<div class="tmp-box"></div>').text(reply.userNickname + " : " + reply.replyContent + " - " + reply.enrollDate);
            
            if ($('#comments-list' + num).find('.no-reply').length > 0) {
                $('#comments-list' + num).empty();
            }

            // $('#comments-list' + num).prepend(newComment); // 이 부분만 이미지 들어가게 수정
            const newCommentContainer = $('<div class="comment-container"></div>');

            // 프로필 사진을 담는 div
            const profilePicDiv = $('<div class="profile-pic"></div>');
            const profilePicImg = $('<img class="profile-img">');
            profilePicImg.attr('src', reply.profileFilePath + reply.profileChangeName);
            profilePicDiv.append(profilePicImg);
            newCommentContainer.append(profilePicDiv);

            // 사용자 정보와 댓글 내용을 담는 div
            const commentInfoDiv = $('<div class="comment-info"></div>').text(reply.userNickname + " : " + reply.replyContent + " - " + reply.enrollDate);
            newCommentContainer.append(commentInfoDiv);

            $('#comments-list' + num).prepend(newCommentContainer);

            $('#comment-text' + num).val('');
          
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
                        <video id="video${num}" controls autoplay muted width="720" height="1080">
                            <source src="` + totalShortsInfo.shortsPath + totalShortsInfo.shortsName + `" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    `;

            const videoElement = document.getElementById('video' + num);
            videoElement.addEventListener('ended', function() {
                videoElement.currentTime = 0;
                videoElement.play();
            });
        },
        error: function () {
            console.log("동영상 로드 실패");
        }
    });
}