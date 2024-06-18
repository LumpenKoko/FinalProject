function checkPhoneNumber(){
    let phone = document.querySelector('[name="userPhone"]');
    ajaxCheckPhoneNumber({userPhone:phone}, drawDoublePhoneResult)
}

function drawDoublePhoneResult(result){
    let phone = document.querySelector('[name="userPhone"]');
    let message = document.querySelector('#check-number');

    console.log(result)
    // 중복 되는 번호 있음
    if (result == "NNNNY"){
        message.innerHTML = "";
        ajaxCertifyPhoneNum({getNum:phone}, drawGetCertifySuccess)
    } else if (result == "NNNNN"){
        message.innerHTML = "가입 되어 있는 번호가 아닙니다.";
    }
}

function drawGetCertifySuccess(result){
    console.log('성공')
    // 시간 관련한 함수들
}