function giveCoupon() {
    var modal = document.getElementById('modal');
    var modalBackground = document.getElementById('modal-background');
    modal.style.display = 'block'; // 모달 창 보이기
    modalBackground.style.display = 'block'; // 배경 보이기
}

function closeModal() {
    var modal = document.getElementById('modal');
    var modalBackground = document.getElementById('modal-background');
    modal.style.display = 'none'; // 모달 창 숨기기
    modalBackground.style.display = 'none'; // 배경 숨기기
}

function closeReply() {
    var replyDiv = document.getElementById('reply');
    var replyArea = document.getElementById('replyArea');

    // 답글 입력란 숨기기
    replyDiv.style.display = 'none';
    replyArea.value = '';  // 답글 입력란 내용 지우기

    // "답글 달기" 버튼 숨기기
    document.getElementById('showReplyButton').style.display = 'none';
    // "답글 완료" 메시지 보이기
    document.querySelector('.complete-message').style.display = 'block';

    // 답글 완료 섹션 보이기
    document.getElementById('rpple-complete').style.display = 'flex';
}

function showReply() {
    var replyDiv = document.getElementById('reply');
    var replyArea = document.getElementById('replyArea');

    // 답글 입력란 표시 여부 토글
    if (replyDiv.style.display === 'none' || replyDiv.style.display === '') {
        replyDiv.style.display = 'block';
    } else {
        replyDiv.style.display = 'none';
        replyArea.value = '';  // 답글 입력란 내용 지우기
    }
}

function onDeleteClick() {
    // 답글 완료 섹션 숨기기
    document.getElementById('rpple-complete').style.display = 'none';
    // "답글 달기" 버튼 다시 보이기
    document.getElementById('showReplyButton').style.display = 'block';
    // "답글 완료" 메시지 숨기기
    document.querySelector('.complete-message').style.display = 'none';
}