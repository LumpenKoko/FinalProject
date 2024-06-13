// 스크립트 파일을 실행할 때 우선 스크립트 함수 제목만 쭉 기억함

// ###공통 회원가입###
// 전체 동의 선택 시 전체 선택, 취소
function clickAllAgree(){
    let allButton = document.querySelector("#check-agree-all");
    let agreeButton = document.querySelectorAll(".check-box>input");

    for (let agree of agreeButton){
        agree.checked = allButton.checked;
    }
}

// 네 가지 동의 누를 때마다 전체 선택 검사
function clickAgree(){
    let allButton = document.querySelector("#check-agree-all");
    let agreeButton = document.querySelectorAll(".check-box>input");

    let allCheck = true;
    
    for (let check of agreeButton){
        if (!check.checked){
            allCheck = false;
        }

        allButton.checked = allCheck;
    }
};

// 아이디 중복 확인
function checkDoubleId(){
    let userIdInput = document.querySelector("#user-id");
    ajaxSelectDoubleId({userId : userIdInput.value}, checkIdSuccess);
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
        let idCheck = document.querySelector('[name="userId"]');
        idCheck.dataset.check = 'true';
    }
    
}

// 아이디 정규식 검사
function checkId(){
    let id = document.querySelector("[name='userId']");
    let idMessage = document.querySelector("#id-message");
    let idCheck = document.querySelector('#id-check')
    const regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+~\-={}[\]:;"'<>,.?/|\\`]{8,14}$/;
    if(!regExp.test(id.value)){
        if (id.value == ""){
            idMessage.innerHTML = "";
        } else {
            idMessage.innerHTML = "사용할 수 없는 형식의 아이디입니다."
            idMessage.style.color = "red";
        }
    } else {
        idMessage.innerHTML = "사용 가능한 형식의 아이디입니다.";
        idMessage.style.color = "black";
        idCheck.disabled = false;
        idCheck.style.color = 'black';
        idCheck.style.cursor = 'pointer';
    }
}



// 비밀번호 정규식 검사
function checkPwd(){
    let pwd = document.querySelector("[name='userPwd']");
    let pwdMessage = document.querySelector("#pwd-message");
    const regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+~\-={}[\]:;"'<>,.?/|\\`]{8,14}$/;
    if(!regExp.test(pwd.value)){
        if (pwd.value == ""){
            pwdMessage.innerHTML = "";
        } else {
            pwdMessage.innerHTML = "사용할 수 없는 형식의 비밀번호입니다."
            pwdMessage.style.color = "red";
        }
    } else {
        pwdMessage.innerHTML = "사용 가능한 비밀번호입니다.";
        pwdMessage.style.color = "black";
    }
}


// 비밀번호 확인 일치 검사
function checkPwdCorrect(){
    let pwd = document.querySelector("[name='userPwd']");
    let pwdCheck = document.querySelector("#pwd-check");
    let pwdMessage = document.querySelector("#pwd-check-message")
    
    if ((pwd.value == pwdCheck.value && pwdCheck.value != "") || pwdCheck.value == ""){
        pwdMessage.innerHTML = "";
    } else if (pwd.value != pwdCheck.value){
        pwdMessage.innerHTML = "비밀번호가 일치하지 않습니다."
        pwdMessage.style.color = "red";
    }
}

// 여자 남자 선택
function selectGender(gender){
    let selectF = document.querySelector("#select-f");
    let selectM = document.querySelector("#select-m");
    let radioF = document.querySelector("#radio-f");
    let radioM = document.querySelector("#radio-m");

    if (gender == "F"){
        selectFemail(radioF, selectF, selectM);
    } else if (gender == "M"){
        selectMale(radioM, selectF, selectM);
    }

}

function selectFemail(radioF, selectF, selectM){
    radioF.checked = true;
    selectF.style.border = "1px solid var(--main-color)";
    selectF.style.color = "var(--main-color)";
    selectM.style.border = "1px solid var(--border-color)";
    selectM.style.color = "black";
}

function selectMale(radioM, selectF, selectM){
    radioM.checked = true;
    selectM.style.border = "1px solid var(--main-color)";
    selectM.style.color = "var(--main-color)";
    selectF.style.border = "1px solid var(--border-color)";
    selectF.style.color = "black";
}


// 이메일 select 박스 선택 시 input 창 값 변경 및 활성화 여부
function selectPostEmail(){
    let selectInput = document.querySelector("#email-select-box");
    let postInput = document.querySelector("#email-post");

    postInput.value = selectInput.value;

    if (selectInput.value == "직접입력"){
        postInput.disabled = false;
    } else {
        postInput.disabled = true;
    }

    changeEmail();
}

// 이메일 select 박스, input 바뀌는 value로 서버에 넘길 input value 실시간 수정
function changeEmail(){
    let preInput = document.querySelector("#email-pre");
    let postInput = document.querySelector("#email-post");
    let userEmail = document.querySelector("[name='userEmail']");
    userEmail.value = preInput.value + "@" + postInput.value;
}

// 모든 항목 기입 시 버튼 활성화
function activeEnroll(userInfo, userId, enroll){
    let checkDisable = false;
    let result = 1;
    console.log(userInfo)
    for (let info of userInfo){
        if (info.value == "" || info.value == null){
            result = result * 0;
        }
    }

    if (userId.dataset.check == 'false'){
        result = result * 0;
    }

    let agree = document.querySelector("#check-agree-all");
    if (!agree.checked){
        result = result * 0;
    }

    if (result == 0){
        checkDisable = true;
    }

    enroll.disabled = checkDisable;
    if (!checkDisable){
        enroll.style.background = "var(--main-color)";
        enroll.style.color = "#FFFFFF";
        enroll.style.cursor = "pointer";
    } else {
        enroll.style.background = "inherit";
        enroll.style.color = "var(--border-color)";
    }
}

// 번호 기입 후 약관 전체 동의 시 번호 인증 버튼 활성화
function activeCertifyPhone(){
    let checkDisable = false;
    let result = 1;

    let certifyButton = document.querySelector('#certify-phone-button')

    let userPhone = document.querySelector("[name='userPhone']");
    if (userPhone.value == null){
        result = result * 0;
    }
    
    let agree = document.querySelector("#check-agree-all");
    if (!agree.checked){
        result = result * 0;
    }

    if (result == 0){
        checkDisable = true;
    }

    certifyButton.disabled = checkDisable;
    if (!checkDisable){
        certifyButton.style.background = "white";
        certifyButton.style.cursor = "pointer";
        certifyButton.style.color = "black";
    } else {
        certifyButton.style.background = "inherit";
        certifyButton.style.color = "var(--border-color)";
        certifyButton.style.cursor = "inherit";
    }
}



// function enrollStylePink(enroll){
//     enroll.style.background = "var(--main-color)";
//     enroll.style.color = "#FFFFFF";
// }

// function enrollStyleInit(enroll){
//     enroll.style.background = "inherit";
//     enroll.style.color = "var(--border-color)";
// }


// ###일반 회원가입###

// 일반 회원가입 버튼 활성화 데이터
function activeCommonEnroll(){
    let userId = document.querySelector("[name='userId']");
    let userPwd = document.querySelector("[name='userPwd']");
    let userName = document.querySelector("[name='userName']");
    let userNickname = document.querySelector("[name='userNickname']");
    let userGender = document.querySelector("[name='userGender']");
    let userBirthday = document.querySelector("[name='userBirthday']");
    let userPreEmail = document.querySelector("#email-pre");
    let userPostEmail = document.querySelector("#email-post");
    let userPhone = document.querySelector("[name='userPhone']");
    let enroll = document.querySelector("#enroll-button");

    let userInfo = [userPwd, userName, userNickname, userGender, userBirthday, userPreEmail, userPostEmail, userPhone];

    activeEnroll(userInfo, userId, enroll);
}


// ###사장 회원가입###

// 주소 실시간 수정
function changeAddress(){
    let content = document.querySelector("#address-content");
    let detail = document.querySelector("#address-detail");
    let userAddress = document.querySelector("[name='address']");
    userAddress.value = content.value + " " + detail.value;
}

// 사장 회원가입 버튼 활성화 데이터
function activeBossEnroll(){
    let userId = document.querySelector("[name='userId']");
    let userPwd = document.querySelector("[name='userPwd']");
    let userName = document.querySelector("[name='userName']");
    let userGender = document.querySelector("[name='userGender']");
    let userBirthday = document.querySelector("[name='userBirthday']");
    let userPreEmail = document.querySelector("#email-pre");
    let userPostEmail = document.querySelector("#email-post");
    let userPhone = document.querySelector("[name='userPhone']");

    let businessNo = document.querySelector("[name='businessNo']");
    let locationName = document.querySelector("[name='locationName']");
    let addressContent = document.querySelector("#address-content");
    let addressDetail = document.querySelector("#address-detail");

    let enroll = document.querySelector("#enroll-button");

    let userInfo = [userPwd, userName, userGender, userBirthday, userPreEmail, userPostEmail, userPhone, 
                    businessNo, locationName, addressContent, addressDetail];

    activeEnroll(userInfo, userId, enroll);
}










//---------------------------------

function certifyPhone(){
    let getNum = document.querySelector('[name="userPhone"]').value;

    console.log(getNum)
    ajaxCertifyPhoneNum({getNum: getNum}, drawCertifySuccess);
}

function drawCertifySuccess(result){
    console.log("성공")
    console.log(result)
}