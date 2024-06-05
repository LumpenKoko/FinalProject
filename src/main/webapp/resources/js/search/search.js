function searchFilter(contextPath, keyword){
    console.log("들어옴~")
    let pets = document.querySelectorAll('.filter-pet');
    let locs = document.querySelectorAll('.filter-location');
    let order = document.querySelectorAll('[name="order"]');
    // let order = document.querySelector('.order-by-list');
    // let cpage;

    let petList = [];
    for (let p of pets){
        if (p.checked){
            petList.push(p.value)
        }
    }

    let locList = [];
    for (let l of locs){
        if (l.checked){
            locList.push(l.value)
        }
    }

    let cpage = 1;

    getLocationData({
        keyword : keyword,
        petList : petList.toString(),
        locList : locList.toString(),
        order : order.value,
        cpage : cpage
    }, function(res){
        console.log(res)
    })
}

function drawSearchPage(locationList){
    console.log("성공했어요~")
    let searchResultBox = document.querySelector("#search-result-box");

    searchResultBox.innerHTML = "";
    // for(let loc of locationList){
    //     let searchContentBox = document.createElement('div');
    //     searchContentBox.classList.add('search-content-box', 'gray-round-box');
        
    //     searchContentBox.innerHTML = '<img src="'+loc.attachment.filePath+loc.attachment.changeName+'" alt="">';

    //     let searchContent = document.createElement('div');
    //     searchContent.className = 'search-content';
    
    //     searchContentBox.appendChild(searchContent);

    //     let contentTitle = document.createElement('div');
    //     contentTitle.className = 'content-title';

    //     searchContent.appendChild(contentTitle);

    //     contentTitle.innerHTML = '<span>'+loc.locationName+'</span>';

    //     let likeBox = document.createElement('div');
    //     contentTitle.append(likeBox);

    //     likeBox.innerHTML += <img src="resources/img/searchpage/like-pre.png" alt=""></img>

    //     searchContentBox.onclick = function (){
    //         location.href = contextPath + "/detail?locationNo=" + locNo;
    //     }
    // }
    
}

// 정렬 기준 박스 토글
function showOrderBox(){
    let orderBox = document.querySelector("#order-by-box");
    orderBox.classList.toggle('display-block');
}

function selectOrder(orderNum){
    switch(orderNum){
        case 1 :
            document.querySelector('#order-by-time').checked = true;
            break;
        case 2 :
            document.querySelector('#order-by-star').checked = true;
            break;
        case 3 :
            document.querySelector('#order-by-pick').checked = true;
            break;
    }
}

// 장소 div 선택 시 detail 페이지로 넘어감
function moveToLocationDetail(contextPath, locNo){
    location.href = contextPath + "/detail?locationNo=" + locNo;
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




// orderBox.style.display = (orderBox.style.display = 'none' ? 'block' : 'none')
    // if (orderBox.style.display == 'none'){
    //     console.log("none")
    //     orderBox.style.display = 'block';
    // } else {
    //     console.log("block")
    //     orderBox.style.display = 'none';
    // }

// function searchFilter(contextPath, keyword){
//     let petList = document.querySelectorAll('.filter-pet');
//     let locList = document.querySelectorAll('.filter-location');
//     // let order = document.querySelector('.order-by-list');
//     // let cpage;

//     let pets = [];
//     for (let p of petList){
//         if (p.checked){
//             pets.push({petSizeNo : p.value});
//         }
//     }

//     let locs = [];
//     for (let l of locList){
//         if (l.checked){
//             locs.push({locationCategoryNo : l.value})
//         }
//     }
//     // let pet = JSON.parse(pets)

//     location.href = contextPath + "/searchKeyword.pl"
//                     + "?keyword=" + "" + keyword
//                     + "&pets=" + pets
//                     + "&locs=" + locs;
// }