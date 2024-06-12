// 페이지 초기화 함수
function initializePage() {
    loadLocationInfo();
    locationpage('/mng');
}

// AJAX를 사용하여 장소 정보를 저장
function saveLocationInfo() {
    var phoneNumber = document.getElementById("store-phone").value;
    var description = document.getElementById("store-description").value;
    var reservationLink = document.getElementById("reservation-link-input").value;
    var animalTypes = Array.from(document.querySelectorAll('input[name="animal-type"]:checked')).map(checkbox => checkbox.value);
    // 필요한 데이터를 모두 수집합니다.
    
    var data = {
        phone: phoneNumber,
        description: description,
        reservationLink: reservationLink,
        animalTypes: animalTypes
    };

    $.ajax({
        url: contextPath + '/saveLocationInfo.bm', // 서버의 엔드포인트
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            alert("장소정보 업데이트를 완료하였습니다.");
        },
        error: function(xhr, status, error) {
            alert("장소정보 업데이트에 실패했습니다: " + error);
        }
    });
}

// AJAX를 사용하여 저장된 장소 정보 로드
function loadLocationInfo() {
    $.ajax({
        url: contextPath + '/getLocationInfo.bm', // 서버의 엔드포인트
        method: 'GET',
        success: function(response) {
            if(response.phone) {
                document.getElementById("store-phone").value = response.phone;
            }
            if(response.description) {
                document.getElementById("store-description").value = response.description;
            }
            if(response.reservationLink) {
                document.getElementById("reservation-link-input").value = response.reservationLink;
            }
            if(response.animalTypes) {
                response.animalTypes.forEach(type => {
                    document.querySelector(`input[name="animal-type"][value="${type}"]`).checked = true;
                });
            }
        },
        error: function(xhr, status, error) {
            alert("장소정보 로드에 실패했습니다: " + error);
        }
    });
}

// 요일별 운영시간 HTML 요소를 생성하는 함수
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

// 각 요일의 운영시간 요소를 추가합니다.
document.addEventListener('DOMContentLoaded', function() {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    const container = document.getElementById('operating-hours-container');
    days.forEach(day => {
        container.innerHTML += createOperatingHoursElement(day);
    });
});

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

    function loadImg(inputFile, id){
        //inputFile : 현재 변화가 생긴 input type=file 요소객체
        //id : 현재 선택된 input id
        
        //inputFile.files[0] => 선택된 파일이 담겨있다.
        //inputFile.files.length -> 1

        if (inputFile.files.length == 1){//파일을 하나 선택했다. => 미리보기
            //파일을 읽어들일 FileReader객체생성
            const reader = new FileReader();

            //파일을 읽어들이는 메소드
            //해당파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
            reader.readAsDataURL(inputFile.files[0]);

            //파일 읽어들이기 완료했을 때 실행할 함수 정의
            reader.onload = function(ev){
                // console.log(ev.target.result) => 읽어들인 파일의 고유한 url
                const companyImg = document.querySelector(`label[for=${id}] img`);
                companyImg.src = ev.target.result;
            }
        } else { // 선택된 파일을 취소한 경우 => 미리보기 지워준다.
            const companyImg = document.querySelector(`label[for=${id}] img`);
            companyImg.src = path + "/resources/img/myPage/+.png";
        }
    }
    // companyfile.addEventListener('change', getImageFiles);

    /* (+) 버튼 클릭시 상품 추가 */
    $(document).ready(function() {
        // "Add Product" 버튼 클릭 시
        $("#add-product").click(function() {
            // 새로운 상품 등록 폼 생성
            var newProductForm = $("<div class='product-registration'>" +
                "<input type='text' class='product-name' placeholder='상품명을 입력하세요.'>" +
                "<input type='text' class='commodity-price' placeholder='가격을 입력하세요.'>" +
                "<button class='delete-droduct'>" +
                "<img class='delete-product-img' src='resources/img/bosspage/-.png'>" +
                "</button>" +
                "</div>");
    
            // 생성한 상품 등록 폼을 #product-registration 요소 이전에 추가
            $("#product-registration").before(newProductForm);
        });
    
        // 동적으로 생성된 요소에 대한 이벤트 처리
        $(document).on("click", ".delete-droduct", function() {
            // 삭제 버튼 클릭 시 해당 상품 등록 폼 제거
            $(this).closest(".product-registration").remove();
        });
    
        // 등록 버튼 클릭 시
        $(".upload-bt").click(function() {
            // 등록 로직 수행
            // 이 부분에 등록 로직을 추가하면 됩니다.
        });
    });
}
