
// 정렬 기준 박스 토글
function showOrderBox(){
    let orderBox = document.querySelector("#order-by-box");
    orderBox.classList.toggle('display-block');
}

// 장소 div 선택 시 detail 페이지로 넘어감
function moveToLocationDetail(contextPath, locNo){
    location.href = contextPath + "/detail?locationNo=" + locNo;
}
    
// 영업시간 출력
function operationTime(){

}

// 찜 함수
function pickCheckLogin(loginUserNo, locNo, userPick){
    if (loginUserNo != ""){
        ajaxSelectLikeInfo({
            loginUserNo : loginUserNo,
            locNo : locNo,
            userPick : userPick
        }, drawPickStatus);
    } else {
        alert("로그인을 먼저 해주세요")
    }
}

function drawPickStatus(result){
    console.log("찜 성공")
}


// 필터링 박스 선택 시
function searchFilter(keyword, loginUserNo){
    console.log("들어옴~")
    let pets = document.querySelectorAll('.filter-pet');
    let locs = document.querySelectorAll('.filter-location');
    let order = document.querySelectorAll('[name="order"]');
    let cpage = 1;

    let petList = [];
    for (let p of pets){
        if (!p.checked){
            petList.push(p.value)
        }
    }

    if (petList.length === 0) {
        console.log("배열0")
        petList.push(100)
    } else if (petList.length === 4){
        console.log("배열4")
        petList = [];
        petList.push(100)
    }

    let locList = [];
    for (let l of locs){
        if (!l.checked){
            locList.push(l.value)
        }
    }

    if (locList.length === 0) {
        console.log("배열0")
        locList.push(100)
    } else if (locList.length === 7){
        console.log("배열4")
        locList = [];
        locList.push(100)
    }


    getLocationData({
        keyword : keyword,
        petList : petList.toString(),
        locList : locList.toString(),
        order : order.value,
        cpage : cpage,
        loginUserNo : loginUserNo
    }, drawSearchPage)
}


// 페이지네이션 클릭 시
function searchFilterPage(keyword, loginUserNo, cpage){
    console.log("들어옴~")
    let pets = document.querySelectorAll('.filter-pet');
    let locs = document.querySelectorAll('.filter-location');
    let order = document.querySelectorAll('[name="order"]');

    let petList = [];
    for (let p of pets){
        if (!p.checked){
            petList.push(p.value)
        }
    }

    if (petList.length === 0) {
        console.log("배열0")
        petList.push(100)
    } else if (petList.length === 4){
        console.log("배열4")
        petList = [];
        petList.push(100)
    }

    let locList = [];
    for (let l of locs){
        if (!l.checked){
            locList.push(l.value)
        }
    }

    if (locList === 0 || locList.length === locs.length) {
        locList.push(100)
    }

    getLocationData({
        keyword : keyword,
        petList : petList.toString(),
        locList : locList.toString(),
        order : order.value,
        cpage : cpage, 
        loginUserNo : loginUserNo
    }, drawSearchPage)
}

// ajax 성공 시 화면 그리기
function drawSearchPage(locationInfo){
    console.log("성공했어요~")

    let searchResultBox = document.querySelector("#search-result-box");
    searchResultBox.innerHTML = "";

    let searchTitleBox = document.createElement('div');
    searchTitleBox.id = 'search-title-box';

    searchResultBox.append(searchTitleBox)

    searchTitleBox.innerHTML += '<div id="search-title-text">"'+locationInfo.keyword+'" 검색 결과</div>'
    
    let searchOrderBy = document.createElement('div');
    searchOrderBy.id = 'search-order-by';

    searchTitleBox.append(searchOrderBy);

    let orderByTitle = document.createElement('div');
    orderByTitle.id = 'order-by-title';

    searchOrderBy.append(orderByTitle);
    
    orderByTitle.innerHTML += '<span>정렬기준</span><img id="order-by-icon" src="resources/img/searchpage/open-icon.png" alt="">'

    // let orderByTime = document.createElement('input');
    // let orderByStar = document.createElement('input');
    // let orderByPick = document.createElement('input');

    for (let i = 0; i < 3; i++){
        let orderByContent = document.createElement('input');
        orderByContent.name = 'order';
        orderByContent.type = 'radio';
        // orderByContent.style.display = 'none';
        orderByContent.value = i+1;

        if (i == 0){
            orderByContent.id = 'order-by-time';
        } else if (i == 1) {
            orderByContent.id = 'order-by-star';
            orderByContent.checked = true;
        } else if (i == 2){
            orderByContent.id = 'order-by-pick';
        }
        searchOrderBy.append(orderByContent);
    }

    let orderByTime = document.querySelector('#order-by-time');
    orderByTime.onclick = function(){
     searchFilter(locationInfo.keyword, locationInfo.loginUserNo)
    };

    let orderByBox = document.createElement('div');
    orderByBox.id = 'order-by-box';

    searchOrderBy.append(orderByBox);

    orderByBox.innerHTML += '<label class="order-by-list" for="order-by-time">최신순</label>'
                            + '<label class="order-by-list" for="order-by-star">별점순</label>'
                            + '<label id="order-by-last" class="order-by-list" for="order-by-pick">찜개수순</label></div>'
    orderByTitle.onclick = showOrderBox;


    // searchOrderBy.innerHTML += '<div id="order-by-title" onclick="showOrderBox()">'
    //                             + '<span>정렬기준</span><img src="resources/img/searchpage/open-icon.png" alt=""></div>'
                                
    //                             + '<div id="order-by-box">'
    //                                 + '<label class="order-by-list" for="order-by-time">최신순</label>'
    //                                 + '<label class="order-by-list" for="order-by-star">별점순</label>'
    //                                 + '<label id="order-by-last" class="order-by-list" for="order-by-pick">찜개수순</label></div>'

    //                                 + '<input type="radio" name="order" id="order-by-time" value="1"'
    //                                     + 'onchange="searchFilter(`${locationInfo.keyword}`, `locationInfo.loginUserNo`)" style="display: none;">'
    //                                 + '<input type="radio" name="order" id="order-by-star" value="2"'
    //                                     + 'onchange="searchFilter(`${locationInfo.keyword}`, `locationInfo.loginUserNo`)" checked="true" style="display: none;">'
    //                                 + '<input type="radio" name="order" id="order-by-pick" value="3"'
    //                                     + 'onchange="searchFilter(`${locationInfo.keyword}`, `locationInfo.loginUserNo`)" style="display: none;"'
    //                             + '</div></div>';
    // let input = document.createElement('input');

    for(let loc of locationInfo.locationList){
        let searchContentBox = document.createElement('div');
        searchContentBox.classList.add('search-content-box', 'gray-round-box');
        searchContentBox.onclick = function (){
            location.href = contextPath + "/detail?locationNo=" + loc.locationNo;
        }
        searchResultBox.append(searchContentBox)

        searchContentBox.innerHTML = '<img src="'+ loc.attachment.filePath + loc.attachment.changeName + '" alt="">';

        let searchContent = document.createElement('div');
        searchContent.className = 'search-content';
    
        searchContentBox.appendChild(searchContent);

        let contentTitle = document.createElement('div');
        contentTitle.className = 'content-title';

        searchContent.appendChild(contentTitle);

        contentTitle.innerHTML = '<span>'+loc.locationName+'</span>';

        let likeBox = document.createElement('div');
        likeBox.className = 'pick-box';
        contentTitle.append(likeBox);

        // 찜 함수
        likeBox.onclick = function(){
            pickCheckLogin(locationInfo.loginUserNo, loc.locationNo, loc.userPick)
        };
        
        if (loc.userPick > 0){
            likeBox.innerHTML += '<img src="resources/img/searchpage/like-after.png" alt=""></img>'
        } else {
            likeBox.innerHTML += '<img src="resources/img/searchpage/like-pre.png" alt=""></img>'
        }
        likeBox.innerHTML += '<span>'+loc.pickCount+'</span></div>'

        // Upper
        let upperBox = document.createElement('div');
        upperBox.className = 'content-upper-box';
        searchContent.append(upperBox);

        // 장소 카테고리
        upperBox.innerHTML += '<div><span class="font-bold">분류</span>'
                                + '<span>'+loc.locationCategoryNo+'</span></div>'
        
        // 평점
        let star = "";
        for (i = 0; i < Math.round(loc.locationStar); i++){
            star += '<img src="resources/img/searchpage/rating-star.png" alt=""> '
        }
        console.log(star)
        upperBox.innerHTML += '<div><span class="font-bold">평점</span>'
                                    + '<span>'+loc.locationStar+'</span>'
                                    + '<div>' + star + '</div></div>';

        // 반려동물 사이즈
        let sizeList = "";
        for (let size of loc.enterList){
            sizeList += size.petSizeNo + ' ';
        }
        upperBox.innerHTML += '<div><span class="font-bold">종류</span><span>'
                                + sizeList + '</span></div>';

        searchContent.innerHTML += '<hr>';

        // Lower
        let lowerBox = document.createElement('div')
        lowerBox.className = 'content-lower-box';

        searchContent.append(lowerBox);

        lowerBox.innerHTML += '<div><img src="resources/img/searchpage/location.png" alt="">'
                                    + '<span>'+loc.address+'</span></div>';
        
        lowerBox.innerHTML += '<div><img src="resources/img/searchpage/phone.png" alt="">'
                                    + '<span>'+loc.locationPhone+'</span></div>'
        
        lowerBox.innerHTML += '<div><img src="resources/img/searchpage/time.png" alt="">'
                                + '<span>영업 중 22:00 종료</span></div>'
        
        
        //                         if (){

        // } else {

        // }
        
        // '<span>'영업 중 22:00 종료'</span>'
        //                             <span class="close-red">영업 종료</span>
        //                         </div>'
                                

    }

    let pagingBar = document.createElement('div');
    pagingBar.id = 'paging-bar';

    searchResultBox.append(pagingBar);

    if (locationInfo.pi.currentPage != locationInfo.pi.startPage){
        let leftBtn = document.createElement('button');
        leftBtn.onclick = function(){
            searchFilterPage(locationInfo.keyword, locationInfo.loginUserNo, (locationInfo.pi.currentPage - 1))
        };

        pagingBar.append(leftBtn);
        leftBtn.innerHTML = "&lt;";
    }

    for (let i = locationInfo.pi.startPage; i < locationInfo.pi.endPage; i++){
        let pagingBtn = document.createElement('button');
        pagingBtn.onclick = function(){
            searchFilterPage(locationInfo.keyword, locationInfo.loginUserNo, i)
        };

        pagingBar.append(pagingBtn);
        pagingBtn.innerHTML = i;
    }

    if (locationInfo.pi.currentPage != locationInfo.pi.maxPage){
        let rightBtn = document.createElement('button');
        rightBtn.onclick = function(){
            searchFilterPage(locationInfo.keyword, locationInfo.loginUserNo, (locationInfo.pi.currentPage + 1))
        };

        pagingBar.append(rightBtn);
        rightBtn.innerHTML = "&gt;";
    }


    
}







// // 강아지 선택 시 강아지 사이즈 전체 선택, 취소
// function clickAllAgree(){
//     let allButton = document.querySelector("#check-agree-all");
//     let agreeButton = document.querySelectorAll(".check-box>input");

//     for (let agree of agreeButton){
//         agree.checked = allButton.checked;
//     }
// }

// // 강아지 사이즈 누를 때마다 전체 선택 검사
// function clickAgree(){
//     let allButton = document.querySelector("#check-agree-all");
//     let agreeButton = document.querySelectorAll(".check-box>input");

//     let allCheck = true;
    
//     for (let check of agreeButton){
//         if (!check.checked){
//             allCheck = false;
//         }

//         allButton.checked = allCheck;
//     }
// }




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

// function selectOrder(orderNum){
//     switch(orderNum){
//         case 1 :
//             document.querySelector('#order-by-time').checked = true;
//             break;
//         case 2 :
//             document.querySelector('#order-by-star').checked = true;
//             break;
//         case 3 :
//             document.querySelector('#order-by-pick').checked = true;
//             break;
//     }
// }
