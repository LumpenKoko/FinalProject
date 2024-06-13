// 쿠폰 추가 등록
function ajaxInsertCoupon(data, callback){
    console.log("가랏")
    $.ajax({
        url: contextPath + "/insertCoupon.bc", 
        data: data,
        success: function (result) {
            callback(result);
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
    })
}