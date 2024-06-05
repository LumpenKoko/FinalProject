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