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

