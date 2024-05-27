let contextPath;
function init(path){
    contextPath = path;

    selectPlaceTop();
}


function selectPlaceTop(){
    ajaxGetData(contextPath + "/topPlace.ma", 
    {userId: userIdInput.value}, 
    function(result){checkIdSuccess(result)});
}

function ajaxGetData(url, data, callback){
    $.ajax({
        url: url,
        data: data,
        success: function (result) {
            callback(result)
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
    })
}
