<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    $(document).ready(function () {
        // userId 입력값이 변경될 때마다 호출되는 함수
        $("#userId").on("input", function () {
            var userId = $(this).val().trim(); // 입력된 아이디 (양쪽 공백 제거)

            // 정규식을 사용하여 아이디가 숫자와 영어로만 이루어져 있고, 숫자와 영어가 무조건 1개 이상씩 들어가고, 8글자 이상 15글자 이하인지 확인
            var regex = /^(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]{8,15}$/;
            if (regex.test(userId)) { // 조건을 만족하지 않을 경우
                $("#hiddenId").hide(); // 경고 메시지 표시하기
                return; // 추가된 부분
            }

            // Ajax 요청을 통해 서버에 아이디를 전송하고 검증 결과를 받음
            $.ajax({
                url: "/checkUserId",
                method: "POST",
                data: { userId: userId },
                success: function (data) {
                    if (data.exists) { // 아이디가 존재할 경우
                        $("#hiddenId").show(); // 경고 메시지 표시하기
                    } else { // 아이디가 존재하지 않을 경우
                        $("#hiddenId").hide(); // 경고 메시지 숨기기
                    }
                },
                error: function () {
                    console.error("서버와의 통신 중 오류가 발생했습니다.");
                }
            });
        });
    });

    // 팝업 창을 보여주는 함수
    function showConfirmation() {
        var modal = document.getElementById("confirmationModal");
        modal.style.display = "block";
        modal.style.background = "white";

        // 배경을 어둡게 만듭니다.
        var parentElement = document.getElementById("mainWrapper"); // 모달창의 부모 요소로 설정
        var darkOverlay = document.createElement("div");
        darkOverlay.id = "darkOverlay";
        darkOverlay.style.position = "fixed";
        darkOverlay.style.top = "0";
        darkOverlay.style.left = "0";
        darkOverlay.style.width = "100%";
        darkOverlay.style.height = "100%";
        darkOverlay.style.backgroundColor = "rgba(0, 0, 0, 0.7)";
        darkOverlay.style.zIndex = "999"; // 모달보다 낮은 z-index로 설정
        parentElement.appendChild(darkOverlay);

        // 배경을 클릭했을 때 모달이 닫히지 않도록 설정
        darkOverlay.addEventListener("click", function (event) {
            event.stopPropagation();
        });

        // 모달이 닫힐 때 배경도 함께 사라지도록 설정
        modal.addEventListener("click", hideConfirmation);
    }

    // 팝업 창을 숨기는 함수
    function hideConfirmation() {
        var modal = document.getElementById("confirmationModal");
        modal.style.display = "none";

        // 배경을 제거합니다.
        var darkOverlay = document.getElementById("darkOverlay");
        if (darkOverlay) {
            darkOverlay.parentNode.removeChild(darkOverlay);
        }
    }

    // 확인 버튼 클릭 시 회원 삭제 요청을 보내는 함수
    function deleteMember(userNo, contextPath) {
        // 여기에 확인 버튼을 눌렀을 때 회원 삭제 요청을 보내는 코드를 추가
        // 예를 들어, AJAX를 사용하여 deleteMember.mp로 요청을 보낼 수 있습니다.
        var userNo = '${loginUser.userNo}';
        $.ajax({
            url: contextPath+"/deleteMember.mp",
            method: "GET",
            data: userNo,
            success: function (response) {
                // 회원 삭제에 성공했을 때 처리할 내용
                console.log("회원 삭제에 성공했습니다.");
                if(response === 'NNNNY'){
                location.href = contextPath + '/logout.me';
                alert("회원 탈퇴에 성공했습니다.");
                }
            },
            error: function (error) {
                // 회원 삭제에 실패했을 때 처리할 내용
                console.error("회원 삭제에 실패했습니다.");
                // 에러 메시지를 보여줄 수도 있습니다.
            }
        });

        // 팝업 창을 숨깁니다.
        hideConfirmation();
    }