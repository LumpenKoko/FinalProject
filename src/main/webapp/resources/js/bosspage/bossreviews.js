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

function showReply() {
    var replyDiv = document.getElementById('reply');
    replyDiv.style.display = 'block'; // reply div 보이기
}

function closeReply() {
    var replyDiv = document.getElementById('reply');
    var replyArea = document.getElementById('replyArea');

    replyDiv.style.display = 'none';
    replyArea.value = '';  // 답글 입력란 내용 지우기

    // 답글 영역을 보여줍니다.
    document.getElementById('rpple-complete').style.display = 'block';
    // 답글 입력창을 숨깁니다.
    document.getElementById('reply').style.display = 'none';

}

function showReply() {
    var replyDiv = document.getElementById('reply');
    var replyArea = document.getElementById('replyArea');
    
    // 답글 입력란이 보이는지 확인
    if (replyDiv.style.display === 'none' || replyDiv.style.display === '') {
        replyDiv.style.display = 'block';
    } else {
        replyDiv.style.display = 'none';
        replyArea.value = '';  // 답글 입력란 내용 지우기
    }
}

