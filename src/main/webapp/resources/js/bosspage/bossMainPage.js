// 전화번호 업데이트
function updatePhoneNumber(userNo,contextPath) {
    const phoneNumberInput = document.getElementById('boss-phone-input');

    if (!phoneNumberInput.value || !/^\d{2,3}-\d{3,4}-\d{4}$/.test(phoneNumberInput.value)) {
        alert('전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678');
        return;
    }
    console.log(phoneNumberInput.value)
    $.ajax({
        url: contextPath+'/updatePhoneNumber.bm',
        type: 'POST',
        data: { 
            phoneNumber: phoneNumberInput.value,
            userNo: userNo
         },
        success: function(response) {
            alert(response)
            document.getElementById('phone-display').textContent = phoneNumberInput.value
            document.getElementById('change-phone-container').style.display = 'none';
        },
        error: function(error) {
            alert('전화번호 변경에 실패했습니다.');
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

/* 탈퇴시 비밀번호 확인 */
function toggleRemoveButton() {
    const confirmYes = document.querySelector('input[name="confirm"][value="yes"]');
    const removeButton = document.querySelector('.boss-remove');
    removeButton.disabled = !confirmYes.checked;
}

function checkPassword(contextPath) {
    const correctPassword = '1234'; // 실제 비밀번호로 교체해야 함
    const inputPassword = document.getElementById('password-input').value;
    const message = document.querySelector('.pwd-checkMessage');

    if (inputPassword !== correctPassword) {
        message.style.display = 'block';
    } else {
        message.style.display = 'none';
        // 탈퇴 처리 로직 추가
        alert('탈퇴 처리되었습니다.');
        setTimeout(() => {
            window.location.href =contextPath;
        }, 100); // 100ms 딜레이 후에 페이지 이동
    }
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