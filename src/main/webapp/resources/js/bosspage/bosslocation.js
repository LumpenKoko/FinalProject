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

            console.log(uploadImg)
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
        console.log(inputFile.files.length)

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

// 입력 정보 저장하기
function saveData() {
    var storeName = document.getElementsByName("상호명")[0].value;
    var phone = document.getElementsByName("가게전화번호")[0].value;
    var description = document.querySelector("#storeinfo textarea").value;

    // 데이터를 LocalStorage에 저장
    localStorage.setItem("storeName", storeName);
    localStorage.setItem("phone", phone);
    localStorage.setItem("description", description);

    // 등록 완료 팝업 표시
    alert("사업장 등록 완료하였습니다.");
}

// 페이지 로드 시 저장된 데이터 불러오기
function loadData() {
    if (localStorage.getItem("storeName")) {
        document.getElementsByName("상호명")[0].value = localStorage.getItem("storeName");
    }
    if (localStorage.getItem("phone")) {
        document.getElementsByName("가게전화번호")[0].value = localStorage.getItem("phone");
    }
    if (localStorage.getItem("description")) {
        document.querySelector("#storeinfo textarea").value = localStorage.getItem("description");
    }
}

// 버튼 클릭 이벤트 리스너 추가
document.addEventListener("DOMContentLoaded", function() {
    // '등록' 버튼에 클릭 이벤트 리스너 추가
    document.querySelector(".upload-bt").addEventListener("click", saveData);

    // 페이지 로드 시 저장된 데이터 불러오기
    loadData();
});