// 정렬 기준 박스 토글
function showOrderBox(){
    let orderBox = document.querySelector("#order-by-box");
    orderBox.classList.toggle('display-block');
}
    // orderBox.style.display = (orderBox.style.display = 'none' ? 'block' : 'none')
    // if (orderBox.style.display == 'none'){
    //     console.log("none")
    //     orderBox.style.display = 'block';
    // } else {
    //     console.log("block")
    //     orderBox.style.display = 'none';
    // }

function searchFilter(contextPath, keyword){
    // let petList = document.querySelectorAll('.filter-pet');
    // let locList = document.querySelectorAll('.filter-location');
    // // let order = document.querySelector('.order-by-list');
    // // let cpage;

    // console.log(petList)
    // console.log(locList)

    // let pets = [];
    // for (let p of petList){
    //     console.log(p.value)
    //     if (p.checked){
    //         pets.push({petSizeNo : p.value});
    //     }
    // }

    // let locs = [];
    // for (let l of locList){
    //     console.log(l.value)
    //     if (l.checked){
    //         locs.push({locationCategoryNo : l.value})
    //     }
    // }

    // console.log(pets);
    // console.log(locs);

    // // let pet = JSON.parse(pets)

    // location.href = contextPath + "/searchKeyword.pl"
    //                 + "?keyword=" + "" + keyword
    //                 + "&pets=" + pets
    //                 + "&locs=" + locs;
}

// 강아지 선택 시 강아지 사이즈 전체 선택, 취소
function clickAllAgree(){
    let allButton = document.querySelector("#check-agree-all");
    let agreeButton = document.querySelectorAll(".check-box>input");

    for (let agree of agreeButton){
        agree.checked = allButton.checked;
    }
}

// 강아지 사이즈 누를 때마다 전체 선택 검사
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
}

function moveToLocationDetail(contextPath, locNo){
    location.href = contextPath + "/detail?locationNo=" + locNo;
}