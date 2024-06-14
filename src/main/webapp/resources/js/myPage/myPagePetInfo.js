document.getElementById('fileInput').addEventListener('change', function () {
    var file = this.files[0];
    var reader = new FileReader();

    reader.onload = function (e) {
        document.getElementById('profile').style.backgroundImage = "url('" + e.target.result + "')";
    }

    reader.readAsDataURL(file);
});

function updatePet(petNo) {
    var formData = {
        petNo: eval(petNo),
        petName: document.querySelector('.petName[data-index="' + index + '"]').value,
        petBirthday: document.querySelector('.petBirthday[data-index="' + index + '"]').value,
        petSizeNo: document.querySelector('.petSizeNo[data-index="' + index + '"]').value,
        petGender: document.querySelector('input[name="petGender' + index + '"]:checked').value
    };
}

function deletePet(petNo,contextPath) {
    console.log("클릭됨")
    $.ajax({
        url : contextPath+"/deletePet.mp",
        type : 'get',
        data : {petNo:petNo},

        success : function(response){
            console.log(response)
            location.href= contextPath + '/myPagePetInfo.mp';
            alert('반려동물 삭제에 성공하였습니다.');
        },
        error : function(error){
            console.log(error)
            alert('실패');
            location.href='<%=request.getContextPath()%>/myPagePetInfo.mp';
        }                        
    });
}

var petNames = ["반려동물1", "반려동물2", "반려동물3"]; // 실제로는 해당 데이터를 서버로부터 받아와야 합니다.

// 반려동물 이름을 표시할 요소
var petNamesElement = document.getElementById("petNames");

// 각 반려동물의 이름을 동적으로 생성하여 요소에 추가
for (var i = 0; i < petNames.length; i++) {
    var petNameElement = document.createElement("p");
    petNameElement.textContent = petNames[i];
}