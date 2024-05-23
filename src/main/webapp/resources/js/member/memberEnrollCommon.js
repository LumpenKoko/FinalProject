function init(path){
    let contextPath = path;
    let allButton = document.querySelector("#check-agree-all");
    let agreeButton = document.querySelectorAll(".check-box>input");

    // 전체 동의 선택 시 전체 선택, 취소
    allButton.onchange = function(){
        for (let agree of agreeButton){
            agree.checked = allButton.checked;
        }
    }

    for(let agree of agreeButton){
        // agree.addEventListener('change', agreeCheck)
        agree.onchange = agreeCheck;
    }

    // 네 가지 전부 선택 시 전체 동의
    function agreeCheck(){
        console.log("하나선택")
        let allCheck = true;
        for (let check of agreeButton){
            if (!check.checked){
                allCheck = false;
            }

            allButton.checked = allCheck;
        }
    }
    
    let userId;
    // 아이디 중복 확인
    document.querySelector("#id-check").onclick = function(){
        let userIdInput = document.querySelector("#user-id");
        userId = userIdInput.value;

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
        
    

        // document.querySelector("#user-id").value = userId;
        // let userId = document.querySelector("#user-id");
        // userId.value = 
    }

    // 비밀번호 정규식 검사
    let pwd = document.querySelector("[name='userPwd']");
    pwd.onkeyup = function checkPwd(){
        let pwdMessage = document.getElementById("pwd-message");
        const regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,14}$/;
        if(!regExp.test(pwd.value)){
            if (pwd.value == ""){
                pwdMessage.innerHTML = "";
            } else {
                pwdMessage.innerHTML = "사용할 수 없는 비밀번호입니다."
                pwdMessage.style.color = "red";
            }
        } else {
            pwdMessage.innerHTML = "사용 가능한 비밀번호입니다.";
            pwdMessage.style.color = "black";
        }
    }

    // 비밀번호 확인 일치 검사
    let pwdCheck = document.querySelector("#pwd-check");
    pwdCheck.onkeyup = function checkPwd(){
        let pwdMessage = document.querySelector("#pwd-check-message")
        
        if ((pwd.value == pwdCheck.value && pwdCheck.value != "") || pwdCheck.value == ""){
            pwdMessage.innerHTML = "";
        } else if (pwd.value != pwdCheck.value){
            pwdMessage.innerHTML = "비밀번호가 일치하지 않습니다."
            pwdMessage.style.color = "red";
        }
    }

    // 여자 남자 선택
    let selectF = document.querySelector("#select-f");
    let selectM = document.querySelector("#select-m");
    let radioF = document.querySelector("#radio-f");
    let radioM = document.querySelector("#radio-m");
    
    selectF.onclick = function(){
        radioF.checked = true;
        selectF.style.border = "1px solid var(--main-color)";
        selectF.style.color = "var(--main-color)";
        selectM.style.border = "1px solid var(--border-color)";
        selectM.style.color = "black";
    }

    selectM.onclick = function(){
        radioM.checked = true;
        selectM.style.border = "1px solid var(--main-color)";
        selectM.style.color = "var(--main-color)";
        selectF.style.border = "1px solid var(--border-color)";
        selectF.style.color = "black";
    }

    // 모든 항목 기입 시 버튼 활성화




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
}