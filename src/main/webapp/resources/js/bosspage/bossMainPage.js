/* 전화번호 업데이트 함수 */
function updatePhoneNumber(userNo,contextPath) {
    // 'boss-phone-input' 아이디를 가진 HTML 요소에서 전화번호 입력값을 가져옵니다.
    const phoneNumberInput = document.getElementById('boss-phone-input');

    // 전화번호 형식 검증
    // 입력된 전화번호가 비어 있거나, 정규 표현식에 맞지 않으면 오류 메시지를 출력하고 함수를 종료합니다.
    if (!phoneNumberInput.value || !/^\d{2,3}-\d{3,4}-\d{4}$/.test(phoneNumberInput.value)) {
        alert('전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678');
        return;
    }
    
    // AJAX를 이용해 서버에 POST 요청을 보냅니다.
    $.ajax({
        url: contextPath+'/updatePhoneNumber.bm', // 요청할 서버의 URL
        type: 'POST', // HTTP 요청 방식
        data: { 
            phoneNumber: phoneNumberInput.value, // 전달할 데이터: 전화번호
            userNo: userNo // 전달할 데이터: 사용자 고유 번호
         },
        success: function(response) { // 요청이 성공했을 때 실행할 함수
            alert(response) // 서버로부터 받은 응답을 경고창으로 보여줍니다.
            document.getElementById('phone-display').textContent = phoneNumberInput.value // 전화번호를 표시하는 요소의 내용을 업데이트합니다.
            document.getElementById('change-phone-container').style.display = 'none'; // 전화번호 변경 폼을 숨깁니다.
        },
        error: function(error) { // 요청이 실패했을 때 실행할 함수
            alert('전화번호 변경에 실패했습니다.'); // 실패 메시지를 경고창으로 보여줍니다.
        }
    });
}

function showPhoneChange() {
    const changePhoneContainer = document.getElementById('change-phone-container');
    const phoneInput = document.getElementById('boss-phone-input');
    
    // 입력 필드를 초기화
    phoneInput.value = '';
    
    changePhoneContainer.style.display = changePhoneContainer.style.display === 'none' ? 'inline' : 'none';
}

/* 이메일 업데이트 */
function updateEmail(userNo,contextPath) {
    const emailLocalPart = document.getElementById('email-local-part').value;
    const emailDomainPart = document.getElementById('boss-email').value;
    const fullEmail = emailLocalPart + '@' + emailDomainPart;

    if (!emailLocalPart || !emailDomainPart || emailDomainPart === '선택해주세요') {
        alert('이메일을 올바르게 입력해주세요.');
        return;
    }

    $.ajax({
        url: contextPath+'/updateEmail.bm',
        type: 'POST',
        data:{ email: fullEmail,
                userNo: userNo
         },
        success: function(response) {
            alert(response);
            document.getElementById('email-display').textContent = fullEmail;
            document.getElementById('change-personal').style.display = 'none';
        },
        error: function(error) {
            alert('이메일 변경에 실패했습니다.');
        }
    });
}

/* 이메일 도메인 선택 시 동작 */
document.addEventListener('DOMContentLoaded', function() {
    updateEmailDomain();  // 초기 상태 설정
});

function updateEmailDomain() {
    const emailDomainSelect = document.querySelector('select.boss-email');
    const emailDomainInput = document.getElementById('boss-email');

    if (emailDomainSelect.value === '선택해주세요') {
        emailDomainInput.value = '';  // 필드를 비웁니다.
        emailDomainInput.setAttribute('readonly', true);  // 필드를 사용할 수 없도록 합니다.
    } else if (emailDomainSelect.value === '직접입력') {
        emailDomainInput.value = '';  // 필드를 비웁니다.
        emailDomainInput.removeAttribute('readonly');  // readonly 속성을 제거하여 편집 가능하게 합니다.
        emailDomainInput.focus();  // 입력 필드에 자동으로 포커스를 맞춥니다.
    } else {
        emailDomainInput.value = emailDomainSelect.value;  // 선택한 도메인을 input 필드에 설정합니다.
        emailDomainInput.setAttribute('readonly', true);  // 수정하지 못하도록 readonly를 설정합니다.
    }
}

function updateEmailDomainOnLoad() {
    const emailDomainSelect = document.querySelector('select.boss-email');
    const emailDomainInput = document.getElementById('boss-email');

    // 페이지 로드 시 선택된 값에 따라 필드 활성화 상태 결정
    if (emailDomainSelect.value === '직접입력') {
        emailDomainInput.removeAttribute('readonly');
        emailDomainInput.focus();
    } else {
        emailDomainInput.value = emailDomainSelect.value;
        emailDomainInput.setAttribute('readonly', true);
    }
}
function updateEmailDomain() {
    const emailDomainSelect = document.querySelector('select.boss-email');
    const emailDomainInput = document.getElementById('boss-email');

    if (emailDomainSelect.value === '직접입력') {
        emailDomainInput.value = '';
        emailDomainInput.removeAttribute('readonly');
        emailDomainInput.focus();
    } else {
        emailDomainInput.value = emailDomainSelect.value;
        emailDomainInput.setAttribute('readonly', true);
    }
}

/* 이메일 수정 입력 폼 보여주기/숨기기 */
function showEmailChange() {
    const changePersonal = document.getElementById('change-personal');
    const emailLocalPart = document.getElementById('email-local-part');
    const emailDomainPart = document.getElementById('boss-email');
    const emailDomainSelect = document.querySelector('select.boss-email');

    // 입력 필드를 초기화
    emailLocalPart.value = '';
    emailDomainPart.value = '선택해주세요';
    // 선택 옵션을 '선택 하세요'로 초기화
    emailDomainSelect.value = '선택해주세요'; // 항상 '선택 하세요'로 리셋

    changePersonal.style.display = changePersonal.style.display === 'none' ? 'block' : 'none';
}

/* 사장님회원 탈퇴 */
function checkPassword(contextPath) {
    const inputPassword = document.getElementById('password-input').value;

    // AJAX 요청: 서버에 비밀번호 검증 요청
    $.ajax({
        url: contextPath + '/deleteBossUser',  // 서버의 비밀번호 검증 및 회원 탈퇴 API
        type: 'POST',
        data: JSON.stringify({
            password: inputPassword
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            if (response.valid) {
                alert('탈퇴 처리되었습니다.');
                window.location.href = contextPath;  // 성공적 탈퇴 후 홈페이지로 리다이렉션
            } else {
                document.querySelector('.pwd-checkMessage').textContent = '비밀번호가 일치하지 않습니다.';
                document.querySelector('.pwd-checkMessage').style.display = 'block';
            }
        },
        error: function() {
            alert('서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
        }
    });
}

/* 탈퇴 모달창 */
function showRemoveModal() {
    document.getElementById('boss-remove-modal').classList.add('active');
    document.getElementById('modal-overlay').classList.add('active');
}

function hideRemoveModal() {
    document.getElementById('boss-remove-modal').classList.remove('active');
    document.getElementById('modal-overlay').classList.remove('active');
}

/* 비밀번호 변경 모달창 */
function showPasswordModal() {
    document.getElementById('modal-overlay').style.display = 'flex';
    document.querySelector('.minibox-wrap').style.display = 'block';
}

function hidePasswordModal() {
    document.querySelector('.minibox-wrap').style.display = 'none';
    document.getElementById('modal-box-overlay').style.display = 'none';
}

// 배경을 클릭하면 모든 모달창을 숨기는 이벤트 리스너
document.getElementById('modal-overlay').addEventListener('click', function(event) {
    // 이벤트가 오버레이에서 발생했는지 확인
    if (event.target === this) {
        // 모든 모달창을 숨김
        hideModal('boss-remove-modal');
        hideModal('minibox-wrap');
        // 오버레이 자체도 숨김
        this.style.display = 'none';
    }
});

// 모달창 열기 및 닫기 함수
function hideModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.remove('active');
    }
    document.getElementById('modal-overlay').style.display = 'none';
    
}

function hideModal(modalId) {
    document.getElementById(modalId).classList.remove('active');
    document.getElementById('modal-overlay').classList.remove('active');
    
}
/* 비밀번호 업데이트 */
function updatePassword(event, userNo, contextPath) {
    event.preventDefault(); // 폼의 기본 제출 동작 방지

    document.getElementById('boss-pws-div').style.display = 'block';
    document.getElementById('modal-overlay').style.display = 'block';

    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    const mismatchError = document.getElementById('mismatch-error'); // ID를 올바르게 수정

    
    // 비밀번호 입력 확인
    if (!password || !confirmPassword) {
        alert('비밀번호를 입력해주세요.'); // 입력란이 비어있을 경우 경고창 표시
        return false;
    }
    
    // 비밀번호 일치 여부 확인
    if (password !== confirmPassword) {
        mismatchError.style.display = 'block'; // 일치하지 않을 때 에러 메시지 보이기
        return false; // 추가로 폼 제출 방지
    } else {
        mismatchError.style.display = 'none'; // 에러 메시지 숨기기
    }

    $.ajax({
        url: contextPath+'/updatePwd.bm',
        type: 'POST',
        data: {
            bossPwd: password,
            userNo: userNo
        },
        success: function(response){
            document.getElementById('boss-pws-div').style.display = 'none';
            document.getElementById('modal-overlay').style.display = 'none';
            if(response === '비밀번호 변경에 성공였습니다.') {
                location.href = contextPath+'/bossMainPage.bm';
                alert(response)
            }
        },
        error: function(error) {
            alert('비밀번호 변경에 실패했습니다.');
        }
    });
}



