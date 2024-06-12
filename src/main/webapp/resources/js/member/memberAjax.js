// 아이디 중복 확인
function ajaxSelectDoubleId(data, callback){
    $.ajax({
        url: contextPath + "/checkId.me", 
        data: data,
        success: function (result) {
            callback(result);
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
    })
}


// 번호 인증 요청
function ajaxCertifyPhoneNum(data, callback){
    $.ajax({
        url: contextPath + "/certification.me", 
        data:data,
        // headers :{
        //     "Content-Type" :"application/json",
        // },
        type: "post",
        success: function (result) {
            callback(result);
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
    })
}