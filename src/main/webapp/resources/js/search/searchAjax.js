let contextPath;

// body onload 시 실행되는 초기 함수
function init(path){
    contextPath = path;
    drawSearchPage();
}

function drawSearchPage(){

}

function drawSearchPlace(){

}

// ajax 기본 함수
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