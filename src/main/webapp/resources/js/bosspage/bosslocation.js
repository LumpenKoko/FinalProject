/**
 * 페이지 초기화 함수
 * 장소 정보를 로드하고, 운영시간 요소를 추가하며, 이미지 업로드 및 상품 추가/삭제를 초기화합니다.
 */
function initializePage() {
    // 장소 정보를 로드하는 함수를 호출
    loadLocationInfo();
    // 요일별 운영시간 요소를 추가
    addOperatingHoursElements();
    // 이미지 업로드 및 상품 추가/삭제 초기화
    locationpage('/mng');
}

/**
 * AJAX를 사용하여 장소 정보를 저장하는 함수
 */
function saveLocationInfo() {
    const locationPhone = document.getElementById("store-phone").value;
    const explanation = document.getElementById("store-description").value;
    const reservationLink = document.getElementById("reservation-link-input").value;
    const userNo = $("#userNo").val(); // userNo 가져오기 (필요 시 추가)

    const operationTimes = [];
    document.querySelectorAll('.operating-hours').forEach(element => {
        const day = element.querySelector('p').innerText;
        const startTime = element.querySelector('.open-time').value;
        const endTime = element.querySelector('.close-time').value;
        const restStatus = element.querySelector('input[name="휴무"]').checked;
        operationTimes.push({ day, startTime, endTime, restStatus });
    });

    const locationInfo = {
        locationPhone: locationPhone,
        explanation: explanation,
        reservationLink: reservationLink,
        userNo: userNo,
        operationTimes: operationTimes
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
        url: contextPath + '/getLocationInfo.bm', // 서버의 로드 URL
        method: 'GET',
        success: function(response) {
            // 서버에서 받은 데이터를 각 필드에 설정합니다.
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
            if (response.products) {
                response.products.forEach(product => {
                    var newProductForm = $("<div class='product-registration'>" +
                        "<input type='text' class='product-name' placeholder='상품명을 입력하세요.' value='" + product.name + "'>" +
                        "<input type='text' class='commodity-price' placeholder='가격을 입력하세요.' value='" + product.price + "'>" +
                        "<button class='delete-product'>" +
                        "<img class='delete-productimg' src='resources/img/bosspage/-.png'>" +
                        "</button>" +
                        "</div>");
                    $("#product-registration").before(newProductForm);
                });
            }
        },
        error: function(xhr, status, error) {
            // 로드에 실패한 경우
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
    /*객실 이미지 업로드*/
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
        if (inputFile.files.length == 1){ // 파일을 하나 선택한 경우
            const reader = new FileReader();
            reader.readAsDataURL(inputFile.files[0]);
            reader.onload = function(ev){
                const companyImg = document.querySelector(`label[for=${id}] img`);
                companyImg.src = ev.target.result;
            }
        } else { // 파일 선택을 취소한 경우
            const companyImg = document.querySelector(`label[for=${id}] img`);
            companyImg.src = path + "/resources/img/myPage/+.png";
        }
    }
}

/* (+) 버튼 클릭시 상품 추가 */
$(document).ready(function() {
    // "Add Product" 버튼 클릭 시
    $("#add-product").on("click", function() {
        // 새로운 상품 등록 폼 생성
        var newProductForm = $("<div class='product-registration'>" +
            "<input type='text' class='product-name' placeholder='상품명을 입력하세요.'>" +
            "<input type='text' class='commodity-price' placeholder='가격을 입력하세요.'>" +
            "<button class='delete-product'>" +
            "<img class='delete-productimg' src='resources/img/bosspage/-.png'>" +
            "</button>" +
            "</div>");

        // 생성한 상품 등록 폼을 #product-registration 요소 이전에 추가
        $("#product-registration").before(newProductForm);
    });

    // 동적으로 생성된 요소에 대한 이벤트 처리
    $(document).on("click", ".delete-product", function() {
        // 삭제 버튼 클릭 시 해당 상품 등록 폼 제거
        $(this).closest(".product-registration").remove();
    });

    // 등록 버튼 클릭 시
    $(".upload-bt").click(function() {
        // 등록 로직 수행
        // 이 부분에 등록 로직을 추가하면 됩니다.
    });
});