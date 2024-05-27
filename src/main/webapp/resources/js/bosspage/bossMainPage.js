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
    
    function showModal() {
        document.getElementById('myModal').style.display = 'block';
        document.getElementById('modal-iframe').src = 'memberChangePwd.jsp';
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById('myModal').style.display = 'none';
        document.getElementById('modal-iframe').src = '';
    }

    // 모달 외부 클릭 시 닫기
    window.onclick = function(event) {
        const modal = document.getElementById('myModal');
        if (event.target === modal) {
            closeModal();
        }
    }
}