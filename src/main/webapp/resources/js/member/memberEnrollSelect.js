window.onload = function(){
    let common = document.querySelector("#kindCommon");
    let boss = document.querySelector("#kindBoss");
    let button = document.querySelector("#member-select-button");
    let contextPath = window.location.origin + "/" + window.location.pathname.split("/")[1] + "/";

    common.onclick = function(){
        let commonInput = document.querySelector("#radio-common");
        commonInput.checked = true;
        // common.style = "border: 1px solid var(--main-color);";
        // document.querySelector("#kindCommon>*").style = 
        //     "color: var(--main-color);" +
        //     "border: 1px solid var(--main-color);" +
        //     "background: var(--main-color);"
    }

    boss.onclick = function(){
        document.querySelector("#radio-boss").checked = true;
    }

    button.onclick = function(){
        let userKind = document.getElementsByName("userKind");
        console.log(userKind[0].value);
        console.log(contextPath + "memberEnrollCommon.me");
        if (userKind[0].checked == true){
            location.href = contextPath + "memberEnrollCommonForm.me";
        } else {
            location.href = contextPath + "memberEnrollAdminForm.me";
        }
    }
}

// kind.onclick = function() {
//     document.querySelector("#radio-common").checked = true;
//     // $("#radio-common").prop("checked", true);
//     // let test = document.querySelector("#radio-common");
//     console.log(test);
// };

// function sendEnrollPage(select){

// }
