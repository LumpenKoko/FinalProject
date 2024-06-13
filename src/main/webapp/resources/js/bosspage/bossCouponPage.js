// document.addEventListener('DOMContentLoaded', (event) => {
//     const couponContentElements = document.querySelectorAll('.registed-coupon');
//     if (couponContentElements.length > 1) {
//         document.getElementById('coupon-none').style.display = 'none';
//     }
// });

let newCouponNum = 0;

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

function editCouponForm(button, coupon) {
    const row = button.closest('tr');
    const couponTitle = row.querySelector('.coupon-title').innerText.trim();
    const couponExpiration = row.querySelector('.coupon-expiration').innerText.trim();
    
    const editForm = document.createElement('tr');
    editForm.classList.add('coupon-content');
    editForm.innerHTML = `
    <form>
        <td class="coupon-title">
            <input type="text" value="` + coupon.couponContent + `" class="minibox-input" placeholder="쿠폰명을 입력하세요">
        </td>
        <td class="coupon-expiration">
            <input type="number" value="` + coupon.couponExpirationPeriod + `" class="minibox-input" placeholder="ex)14">
        </td>
        <td class="coupon-count">` + row.querySelector('.coupon-count').innerText +`</td>
        <td class="coupon-admin">
            <button class="common-button pink-button" onclick="saveCouponForm(this)">확인</button>
            <button class="common-button white-button" onclick="cancelEditCouponForm(this, '`+coupon.couponTitle+`', '`+coupon.couponExpiration+`')">취소</button>
        </td>
        </form>
    `;
    row.parentNode.replaceChild(editForm, row);
}

function cancelEditCouponForm(button, originalTitle, originalExpiration) {
    const row = button.closest('tr');
    const originalRow = document.createElement('tr');
    originalRow.classList.add('coupon-content');
    originalRow.innerHTML = `
        <td class="coupon-title">${originalTitle}</td>
        <td class="coupon-expiration">${originalExpiration}</td>
        <td class="coupon-count">${row.querySelector('.coupon-count').innerText}</td>
        <td class="coupon-admin">
            <button class="common-button pink-button" onclick="editCouponForm(this)">수정</button>
            <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
        </td>
    `;
    row.parentNode.replaceChild(originalRow, row);
}
// onclick="insertCoupon('${loginUser.userNo}')"
// function insertCoupon(userNo){
//     let newCouponRegist = document.querySelector('#new-coupon-regist');
//     let newCouponTitle = newCouponRegist.querySelector('.coupon-title-input').value;
//     let newCouponExpiration = newCouponRegist.querySelector('.coupon-expiration-input').value;

//     console.log(newCouponTitle)
//     ajaxInsertCoupon({
//         couponContent : newCouponTitle,
//         couponExpirationPeriod : newCouponExpiration,
//         loginUserNo : userNo
//     }, saveCouponForm);



//     // const couponTitle = document.querySelectorAll('.coupon-title-input');
//     // const couponExpirationPeriod = document.querySelector('name="couponExpirationPeriod"')

//     // ajaxInsertCoupon({
//     //     couponTitle : couponTitle,
//     //     couponExpirationPeriod : couponExpirationPeriod
//     // }, saveCouponForm);
// }

function saveCouponForm(button) {
    console.log("성공")
    // const row = button.closest('tr');
    // const newTitle = row.querySelector('.coupon-title input').value.trim();
    // const newExpiration = row.querySelector('.coupon-expiration input').value.trim();

    // const originalRow = document.createElement('tr');
    // originalRow.classList.add('coupon-content');
    // originalRow.innerHTML = `
    //     <td class="coupon-title">${newTitle}</td>
    //     <td class="coupon-expiration">${newExpiration}</td>
    //     <td class="coupon-count">${row.querySelector('.coupon-count').innerText}</td>
    //     <td class="coupon-admin">
    //         <button class="common-button pink-button" onclick="editCouponForm(this)">수정</button>
    //         <button class="common-button pink-button" data-toggle="modal" data-target="#delete-coupon">삭제</button>
    //     </td>
    // `;
    // row.parentNode.replaceChild(originalRow, row);
}
