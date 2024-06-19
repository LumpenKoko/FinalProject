// function changeColor(id) {
//     var icon = document.getElementById(id);
//     if (icon.style.color !== 'rgb(254, 139, 148)') {
//         icon.style.color = '#FE8B94';
//         icon.innerHTML = '♡';
//     } else {
//         icon.style.color = '';
//         icon.innerHTML = '♥';
//     }
// }

function wishDelete(userNo, locationNo, contextPath) {
    $.ajax({
        type: 'GET',
        url: contextPath + '/wishListDelete',
        data: {userNo: userNo, locationNo: locationNo},
        success: function(response) {
            if(response === 'NNNNY') {
            alert('공감 목록에서 제외합니다.');
            location.href = contextPath + '/myPageWish.mp';
            } else if (response === 'NNNNN') {
                alert('공감 목록에서 제외에 실패하였습니다.');
                location.href = contextPath + '/myPageWish.mp'; 
            }
        },
        error: function(error) {
            alert('공감 목록에서 제외에 실패하였습니다.');
            location.href = contextPath + '/myPageWish.mp'; 
        }
    });
}

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

function uploadProfileImage(contextPath) {
    var fileInput = document.getElementById('fileInput');
    var upfile = fileInput.files[0];
    var formData = new FormData();
    formData.append('profileImage', upfile);

    $.ajax({
        url: contextPath + '/insertProfileImg.mp',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            if(response === "NNNNY") {
                alert('프로필 이미지 업로드 성공');
                location.href = contextPath + '/myPageWish.mp';
            } else {
                alert('프로필 이미지 업로드 실패');
                location.href = contextPath + '/myPageWish.mp';
            }
        },
        error: function() {
            alert('프로필 이미지 업로드 실패');
            location.href = contextPath + '/myPageWish.mp';
        }
    });
}