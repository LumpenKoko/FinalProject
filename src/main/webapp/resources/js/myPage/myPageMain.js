document.getElementById('fileInput').addEventListener('change', function () {
    var file = this.files[0];
    var reader = new FileReader();

    reader.onload = function (e) {
        document.getElementById('profile').style.backgroundImage = "url('" + e.target.result + "')";
    }

    reader.readAsDataURL(file);
});

var petNames = ["반려동물1", "반려동물2", "반려동물3"]; // 실제로는 해당 데이터를 서버로부터 받아와야 합니다.

// 반려동물 이름을 표시할 요소
var petNamesElement = document.getElementById("petNames");

// 각 반려동물의 이름을 동적으로 생성하여 요소에 추가
for (var i = 0; i < petNames.length; i++) {
    var petNameElement = document.createElement("p");
    petNameElement.textContent = petNames[i];
    petNamesElement.appendChild(petNameElement);
}

function deleteReview(reviewNo, contextPath) {
    $.ajax({
        url: contextPath + "/deleteReview.mp",
        type: 'POST',
        data: {reviewNo: reviewNo},

        success: function (response) {
            console.log(response);
            if (response === 'NNNNY') {
                alert('리뷰 삭제에 성공하였습니다.');
            } else {
                alert('실패');
            }
            // 리다이렉트는 success 또는 error 핸들러 내에서 처리
            location.href = contextPath + '/myPageMain.mp';
        },
        error: function (error) {
            console.log(error);
            alert('실패');
            // 에러 발생 시도 리다이렉트 처리
            location.href = contextPath + '/myPageMain.mp';
        }
    });
}