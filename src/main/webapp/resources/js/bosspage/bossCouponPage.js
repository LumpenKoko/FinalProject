// document.addEventListener('DOMContentLoaded', (event) => {
//     const couponContentElements = document.querySelectorAll('.registed-coupon');
//     if (couponContentElements.length > 1) {
//         document.getElementById('coupon-none').style.display = 'none';
//     }
// });

let newCouponNum = 0;

// 쿠폰 추가 버튼 클릭 시 추가 폼 생성
function showNewCouponForm() {
    if(document.getElementById('coupon-none') != null){
        document.getElementById('coupon-none').style.display = 'none';
    }

    const newCouponFormTemplate = document.querySelector('.new-coupon-form');
    newCouponFormTemplate.style.display = "table-row";
    
    // const newCouponFormTemplate = document.querySelector('.new-coupon-form').cloneNode(true);
    // newCouponFormTemplate.style.display = 'table-row';
    // newCouponFormTemplate.id = 'new-coupon-regist'
    document.querySelector('#coupon-regist').style.display = 'none';
    
    // newCouponFormTemplate.querySelector('.white-button').setAttribute('onclick', 'removeCouponForm(this)');
    // document.getElementById('coupon-regist').before(newCouponFormTemplate); 
}

// 쿠폰 추가 등록 취소 선택 시 추가 폼 삭제
function removeCouponForm(button) {
    const newCouponFormTemplate = document.querySelector('.new-coupon-form');
    newCouponFormTemplate.style.display = "none";
    // const row = button.closest('tr');
    // row.parentNode.removeChild(row);

    document.querySelector('#coupon-regist').style.display = 'table-row';

    const couponContentElements = document.querySelectorAll('.registed-coupon');
    if (couponContentElements.length < 1) {
        let couponNone = createElement('tr');
        couponNone.id = 'coupon-none';

        row.parentNode.append(couponNone);

        couponNone += '<td colspan="4">등록된 쿠폰이 없습니다.</td>'
    } 
}

// 쿠폰 수정 선택 시 수정 폼으로 변경
function editCouponForm(button) {
    const row = button.closest('tr');
    // const couponTitle = row.querySelector('.coupon-title').innerText.trim();
    // const couponExpiration = row.querySelector('.coupon-expiration').innerText.trim();
    
    let couponContent = row.querySelector('.coupon-title').innerText
    let couponPeriod = row.querySelector('.coupon-expiration').innerText
    let couponCount = row.querySelector('.coupon-count').innerText
    let couponNo = row.querySelector('.coupon-no').innerText

    console.log(couponNo)

    const editForm = document.createElement('tr');
    editForm.classList.add('coupon-content');
    editForm.innerHTML = `
        <td class="coupon-title">
            <input type="text" name="couponContent" value="` + couponContent + `" class="minibox-input" placeholder="쿠폰명을 입력하세요">
        </td>
        <td class="coupon-no" style="display: none;">`+couponNo+`</td>
        <td class="coupon-expiration">
            <input type="number" name="couponExpirationPeriod" value="` + couponPeriod + `") {
                + " class="minibox-input" placeholder="ex)14">
        </td>
        <td class="coupon-count">` + couponCount +`</td>
        <td class="coupon-admin">
            <button class="common-button pink-button" onclick="updateCoupon(this)">확인</button>
            <button class="common-button white-button" onclick="cancelEditCouponForm(this, '`+couponContent+`', '`+couponPeriod+`', '`+couponNo+`')">취소</button>
        </td>
    `;
    row.parentNode.replaceChild(editForm, row);
}

// 쿠폰 수정 취소 시 기존 쿠폰 폼으로 변경
function cancelEditCouponForm(button, originalTitle, originalExpiration, couponNo) {
    const row = button.closest('tr');
    const originalRow = document.createElement('tr');
    originalRow.classList.add('coupon-content');
    originalRow.innerHTML = `
        <td class="coupon-title">`+originalTitle+`</td>
        <td class="coupon-no" style="display: none;">`+couponNo+`</td>
        <td class="coupon-expiration">`+originalExpiration+`</td>
        <td class="coupon-count">`+row.querySelector('.coupon-count').innerText+`</td>
        <td class="coupon-admin">
            <button class="common-button pink-button" onclick="editCouponForm(this)">수정</button>
            <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
        </td>
    `;
    row.parentNode.replaceChild(originalRow, row);
}

// 쿠폰 수정 폼에서 확인 버튼 클릭 시 업데이트 ajax 함수 실행하는 함수
function updateCoupon(button){
    const row = button.closest('tr');

    let newCouponContent = row.querySelector('[name="couponContent"]').value
    let newCouponPeriod = row.querySelector('[name="couponExpirationPeriod"]').value
    let couponNo = row.querySelector('.coupon-no').innerText

    ajaxUpdateCoupon({
        couponContent : newCouponContent,
        couponExpirationPeriod : newCouponPeriod,
        couponNo : couponNo
    }, saveCouponForm);
}

// 업데이트 ajax 성공 시 쿠폰 폼 새로 그려주는 함수
function saveCouponForm(coupon) {
    alert("쿠폰 수정에 성공했습니다.")

    let couponNoList = document.querySelectorAll('.coupon-no');
    let couponNoBox;
    for (let c of couponNoList){
        if (c.innerText == coupon.couponNo){
            couponNoBox = c;
        }
    }

    const row = couponNoBox.parentNode;

    // const newTitle = row.querySelector('.coupon-title input').value.trim();
    // const newExpiration = row.querySelector('.coupon-expiration input').value.trim();

    const originalRow = document.createElement('tr');
    originalRow.classList.add('coupon-content');
    originalRow.innerHTML = `
        <td class="coupon-title">`+coupon.couponContent+`</td>
        <td class="coupon-no" style="display: none;">`+coupon.couponNo+`</td>
        <td class="coupon-expiration">`+coupon.couponExpirationPeriod+`</td>
        <td class="coupon-count">`+coupon.usedCount+` / `+coupon.count+`</td>
        <td class="coupon-admin">
            <button class="common-button pink-button" onclick="editCouponForm(this)">수정</button>
            <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
        </td>
    `;
    row.parentNode.replaceChild(originalRow, row);
}

// 쿠폰 삭제 버튼 클릭 시 모달창에 쿠폰명 띄우고 쿠폰 PK 넘기는 함수
function showCouponTitle(button){
    const row = button.closest('tr');
    let couponContent = row.querySelector('.coupon-title').innerText
    let deleteCoupon = document.querySelector('#delete-coupon-text');
    deleteCoupon.innerText = couponContent;

    let couponNo = row.querySelector('.coupon-no').innerText;
    let couponNoBox = document.querySelector('#delete-coupon-no');
    couponNoBox.value = couponNo
}

// 쿠폰 PK 넘겨서 쿠폰 삭제하는 함수
function deleteCoupon(uno){
    let couponNo = document.querySelector('#delete-coupon-no').value;
    location.href = contextPath + '/deleteCoupon.bc?cno=' + couponNo + '&uno=' + uno;
}   