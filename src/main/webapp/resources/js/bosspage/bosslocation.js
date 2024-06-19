/**
 * 페이지 초기화 함수
 * 장소 정보를 로드하고, 운영시간 요소를 추가하며, 이미지 업로드 및 상품 추가/삭제를 초기화합니다.
 */
function initializePage() {
    loadLocationInfo(); // 장소 정보를 로드하는 함수를 호출
    addOperatingHoursElements(); // 요일별 운영시간 요소를 추가
    locationpage('/mng'); // 이미지 업로드 및 상품 추가/삭제 초기화
}

/**
 * AJAX를 사용하여 장소 정보를 저장하는 함수
 */
function saveLocationInfo() {
    const locationPhone = document.getElementById("store-phone").value;
    const explanation = document.getElementById("store-description").value;
    const reservationLink = document.getElementById("reservation-link-input").value;
    const userNo = $("#userNo").val();

    const operationTimes = [];
    document.querySelectorAll('.operating-hours').forEach(element => {
        const day = element.querySelector('p').innerText;
        const startTime = element.querySelector('.open-time').value;
        const endTime = element.querySelector('.close-time').value;
        const restStatus = element.querySelector('input[name="휴무"]').checked;
        operationTimes.push({ day, startTime, endTime, restStatus });
    });

    const petSizes = [];
    document.querySelectorAll('input[name="animal-type"]:checked').forEach(element => {
        petSizes.push(element.value);
    });

    const locationInfo = {
        locationPhone: locationPhone,
        explanation: explanation,
        reservationLink: reservationLink,
        userNo: userNo,
        operationTimes: operationTimes,
        petSizes: petSizes // petSizes를 추가하여 전송
    };

    $.ajax({
        url: contextPath + '/saveLocationInfo.bm',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(locationInfo),
        success: function(response) {
            if (response.success) {
                alert("장소정보 업데이트가 완료되었습니다.");
            } else {
                alert("장소정보 업데이트에 실패했습니다: " + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert("장소정보 업데이트에 실패했습니다: " + error);
        }
    });
}

/**
 * AJAX를 사용하여 장소 정보를 로드하는 함수
 */
function loadLocationInfo() {
    $.ajax({
        url: contextPath + '/getLocationInfo.bm',
        method: 'GET',
        success: function(response) {
            if (response.locationPhone) {
                document.getElementById("store-phone").value = response.locationPhone;
            }
            if (response.explanation) {
                document.getElementById("store-description").value = response.explanation;
            }
            if (response.reservationLink) {
                document.getElementById("reservation-link-input").value = response.reservationLink;
            }
            if (response.animalTypes) {
                response.animalTypes.forEach(type => {
                    document.querySelector(`input[name="animal-type"][value="${type}"]`).checked = true;
                });
            }
            if (response.operationTimes) {
                response.operationTimes.forEach(time => {
                    const element = document.querySelector(`.operating-hours p:contains('${time.day}')`).parentElement;
                    element.querySelector('.open-time').value = time.startTime;
                    element.querySelector('.close-time').value = time.endTime;
                    element.querySelector('input[name="휴무"]').checked = time.restStatus;
                });
            }
        },
        error: function(xhr, status, error) {
            alert("장소정보 로드에 실패했습니다: " + error);
        }
    });
}

/**
 * 요일별 운영시간 HTML 요소를 생성하는 함수
 * @param {string} day - 요일 이름
 * @returns {string} - HTML 문자열
 */
function createOperatingHoursElement(day) {
    return `
        <div class="operating-hours">
            <p>${day}</p>
            <p>휴무</p>
            <input type="checkbox" name="휴무">
            <select class="open-time">
                ${[...Array(24).keys()].map(hour => `<option value="${String(hour).padStart(2, '0')}:00">${String(hour).padStart(2, '0')}:00</option>`).join('')}
            </select>
            <p style="margin-right: 0;margin-left: 20px;">~</p>
            <select class="close-time">
                ${[...Array(24).keys()].map(hour => `<option value="${String(hour).padStart(2, '0')}:00">${String(hour).padStart(2, '0')}:00</option>`).join('')}
            </select>
        </div>
    `;
}

/**
 * 각 요일의 운영시간 요소를 추가합니다.
 */
document.addEventListener('DOMContentLoaded', function() {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    const container = document.getElementById('operating-hours-container');
    days.forEach(day => {
        container.innerHTML += createOperatingHoursElement(day);
    });
});

/**
 * 이미지 업로드 및 기타 초기화 작업을 수행하는 함수
 * @param {string} path - 기본 경로
 */
function locationpage(path){
    const registrationupload = document.querySelectorAll('.registration-upload');

    for (let uploadImg of registrationupload) {
        uploadImg.onclick = (ev) => {
            ev.stopPropagation();
            ev.preventDefault();

            const companyImg = document.getElementById(uploadImg.dataset.target);
            companyImg.onchange = (ev) => {
                loadImg(ev.target, uploadImg.dataset.target);
            }
            companyImg.click();
        }; 
    }

    /**
     * 이미지를 미리보기로 로드하는 함수
     * @param {HTMLElement} inputFile - 파일 입력 요소
     * @param {string} id - 입력 요소의 ID
     */
    function loadImg(inputFile, id){
        if (inputFile.files.length == 1){
            const reader = new FileReader();
            reader.readAsDataURL(inputFile.files[0]);
            reader.onload = function(ev){
                const companyImg = document.querySelector(`label[for=${id}] img`);
                companyImg.src = ev.target.result;
            }
        } else {
            const companyImg = document.querySelector(`label[for=${id}] img`);
            companyImg.src = path + "/resources/img/myPage/+.png";
        }
    }
}

$(document).ready(function() {
    $("#add-product").on("click", function() {
        var newProductForm = $("<div class='product-registration'>" +
            "<input type='text' class='product-name' placeholder='상품명을 입력하세요.'>" +
            "<input type='text' class='commodity-price' placeholder='가격을 입력하세요.'>" +
            "<button class='delete-product'>" +
            "<img class='delete-productimg' src='resources/img/bosspage/-.png'>" +
            "</button>" +
            "</div>");
        $("#product-registration").before(newProductForm);
    });

    $(document).on("click", ".delete-product", function() {
        $(this).closest(".product-registration").remove();
    });

    $(".upload-bt").click(function() {
        // 등록 로직 수행
    });
});
