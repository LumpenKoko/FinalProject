document.addEventListener('DOMContentLoaded', function() {
    initializePage();
});

function initializePage() {
    loadLocationInfo();
    addOperatingHoursElements();
    initializeLocationPage();
    setupEventListeners();
}

function setupEventListeners() {
    // 기존 이벤트 리스너 제거 후 재등록
    $(".upload-bt").off('click').on('click', function(event) {
        event.preventDefault(); // 기본 동작 방지
        console.log("Save button clicked");
        $(this).prop('disabled', true); // 버튼 비활성화
        saveLocationInfo();
    });

    $("#add-product").off('click').on('click', function() {
        var newProductForm = $("<div class='product-registration'>" +
            "<input type='text' class='product-name' placeholder='상품명을 입력하세요.'>" +
            "<input type='text' class='commodity-price' placeholder='가격을 입력하세요.'>" +
            "<button class='delete-product'>" +
            "<img class='delete-productimg' src='resources/img/bosspage/-.png'>" +
            "</button>" +
            "</div>");
        $("#product-registration").before(newProductForm);
    });

    $(document).off('click', '.delete-product').on('click', '.delete-product', function() {
        $(this).closest(".product-registration").remove();
    });
}

function saveLocationInfo() {
    console.log("saveLocationInfo called");
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
        petSizes: petSizes
    };

    // AJAX 요청 보내기
    $.ajax({
        url: contextPath + '/saveLocationInfo.bm',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(locationInfo),
        success: function(response) {
            console.log("AJAX request successful");
            if (response.success) {
                uploadImages(userNo);
            } else {
                alert("장소정보 업데이트에 실패했습니다: " + response.message);
                $('.upload-bt').prop('disabled', false); // 버튼 다시 활성화
            }
        },
        error: function(xhr, status, error) {
            alert("장소정보 업데이트에 실패했습니다: " + error);
            $('.upload-bt').prop('disabled', false); // 버튼 다시 활성화
        }
    });
}

function uploadImages(locationNo) {
    console.log("uploadImages called");
    const imageInputs = document.querySelectorAll('.company-file');
    let uploadSuccess = true;

    imageInputs.forEach(input => {
        if (input.files.length === 1) {
            const file = input.files[0];
            console.log("업로드할 파일:", file);
            const formData = new FormData();
            formData.append("file", file);
            formData.append("locationNo", locationNo);

            $.ajax({
                url: contextPath + '/uploadImage',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    console.log("파일 업로드 성공:", response);
                },
                error: function(xhr, status, error) {
                    console.error("파일 업로드 실패:", error);
                    uploadSuccess = false;
                }
            });
        }
    });

    if (uploadSuccess) {
        alert("장소정보 업데이트가 완료되었습니다.");
        $('.upload-bt').prop('disabled', false); // 버튼 다시 활성화
    } else {
        alert("이미지 업로드 중 일부 파일에 실패했습니다.");
        $('.upload-bt').prop('disabled', false); // 버튼 다시 활성화
    }
}

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

function addOperatingHoursElements() {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    const container = document.getElementById('operating-hours-container');
    container.innerHTML = '';
    days.forEach(day => {
        container.innerHTML += createOperatingHoursElement(day);
    });
}

function initializeLocationPage() {
    const imageInputs = document.querySelectorAll('.company-file');
    
    imageInputs.forEach(input => {
        input.addEventListener('change', (ev) => {
            loadImg(ev.target);
        });
    });
}

function loadImg(inputFile) {
    if (inputFile.files.length === 1) {
        const reader = new FileReader();
        reader.readAsDataURL(inputFile.files[0]);
        reader.onload = function(ev) {
            const companyImg = document.querySelector(`label[for=${inputFile.id}] img`);
            companyImg.src = ev.target.result;
            companyImg.style.display = 'block';
        };
    } else {
        const companyImg = document.querySelector(`label[for=${inputFile.id}] img`);
        companyImg.src = "resources/img/myPage/+.png";
    }
}

$(document).ready(function() {
    setupEventListeners();
});
