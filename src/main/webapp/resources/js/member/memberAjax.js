let contextPath;
function init(path){
    contextPath = path;
}


// 아이디 중복 확인
function checkDoubleId(){
    let userIdInput = document.querySelector("#user-id");
    console.log(contextPath)
    ajaxGetData(contextPath + "/checkId.me", 
        {userId: userIdInput.value}, 
        function(result){checkIdSuccess(result)});
}

// 아이디 중복 확인 성공 시 실행
function checkIdSuccess(result) {
    let idMessage = document.querySelector("#id-message");
    if (result == "NNNNY"){
        idMessage.innerHTML = "사용할 수 없는 아이디입니다.";
        idMessage.style.color = "red";
    } else {
        idMessage.innerHTML = "사용할 수 있는 아이디입니다.";
        idMessage.style.color = "black";
    }
    
}

function ajaxGetData(url, data, callback){
    $.ajax({
        url: url,
        data: data,
        success: function (result) {
            callback(result);
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
    })
}