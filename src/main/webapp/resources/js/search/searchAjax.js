

function getLocationData(data, callback){
    $.ajax({
        url: contextPath + "/searchPage.pl",
        data: data,
        success: function (result) {
            callback(result)
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
    })
}



// 좋아요
// function ajaxSelectLikeInfo(userNo, locationNo){
//     console.log('들어옴')
//     console.log(userNo)
//     if (userNo != ""){
//         console.log("여기는?")
//         ajaxGetData(contextPath + "/selectLikeInfo.pl", 
//         {
//             userNo : userNo,
//             locationNo : locationNo
//         },
//         function(result){console.log(result)});
//     }
// }

// function drawSearchPlace(){

// }