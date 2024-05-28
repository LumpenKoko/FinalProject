function updateEmailDomain() {
    const emailDomainSelect = document.querySelector('select.boss-email');
    const emailDomainInput = document.getElementById('boss-email');

    if (emailDomainSelect.value === '직접입력') {
        emailDomainInput.value = '';
        emailDomainInput.removeAttribute('readonly');
        emailDomainInput.focus();
    } else {
        emailDomainInput.value = emailDomainSelect.value;
        emailDomainInput.setAttribute('readonly', 'readonly');
    }
}

/*탈퇴시 비밀번호확인 & 탈퇴처리 메세지*/
function toggleRemoveButton() {
    const confirmYes = document.querySelector('input[name="confirm"][value="yes"]');
    const removeButton = document.querySelector('.boss-remove');
    removeButton.disabled = !confirmYes.checked;
}

function checkPassword() {
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
            window.location.href = '<%=request.getContextPath()%>';
        }, 100); // 100ms 딜레이 후에 페이지 이동
    }
}

/* 탈퇴버튼 클릭시 모달창*/
function showRemoveModal() {
    document.getElementById('boss-remove-modal').classList.add('active');
    document.getElementById('modal-overlay').classList.add('active');
}

function hideRemoveModal() {
    document.getElementById('boss-remove-modal').classList.remove('active');
    document.getElementById('modal-overlay').classList.remove('active');
}

function showEmailChange() {
    const changePersonal = document.getElementById('change-personal');
    if (changePersonal.style.display === 'block') {
        changePersonal.style.display = 'none';
    } else {
        changePersonal.style.display = 'block';
    }
}

function showPhoneChange() {
    const changePhoneContainer = document.getElementById('change-phone-container');
    if (changePhoneContainer.style.display === 'inline') {
        changePhoneContainer.style.display = 'none';
    } else {
        changePhoneContainer.style.display = 'inline';
    }
}

function updatePhoneNumber() {
    const phoneInput = document.querySelector('#change-phone-container input');
    const phoneDisplay = document.querySelector('.privacy .change-phone-button').previousElementSibling;

    phoneDisplay.textContent = phoneInput.value;
    showPhoneChange();  // 입력 필드를 숨깁니다.
}

function updateEmail() {
    const emailInput = document.querySelector('#change-personal input[type="email"]');
    const emailDisplay = document.querySelector('.privacy .change-email-button').previousElementSibling;

    emailDisplay.textContent = emailInput.value + '@' + document.querySelector('#change-personal select').value;
    showEmailChange(); // 입력 필드를 숨깁니다.
}