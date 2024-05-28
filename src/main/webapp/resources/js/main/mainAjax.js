let contextPath;
function init(path){
    contextPath = path;

    selectPlaceTop();
}

// ***장소 추천***
function selectPlaceTop(){
    ajaxGetData(contextPath + "/topPlace.ma", 
    "",
    function(result){drawPlaceTop(result)});
}

function drawPlaceTop(locationList){
    let placeImg = document.querySelector("#place-img");
    placeImg.src = contextPath + "/" + locationList[0].attachment.filePath + locationList[0].attachment.changeName;

    let searchContentsWrap = document.querySelector("#search-contents-wrap");

    for (let loc of locationList){
        let placeContent = document.createElement('div');
        placeContent.classList.add("search-ranking-content", "gray-round-box");

        placeContent.onclick = function(){
            location.href = contextPath + "/detail?locationNo=" + loc.locationNo;
        }

        let place = "";

        // 장소 사진
        place += `<img src="`;
        place += contextPath + "/" + loc.attachment.filePath + loc.attachment.changeName;
        place += `" alt="">`;

        // 텍스트를 감싸는 박스, 장소 이름
        place += `<div>
                    <span id="search-ranking-content-title">`+loc.locationName+`</span>`;

        // 별점
        place += `<div id="search-ranking-rating">
                    <div>`+loc.locationStar+`</div><div>`;
        for (i = 0; i < Math.round(loc.locationStar); i++){
            place += `<img class="ranking-star-img" src="resources/img/main/star.png" alt="">`
        };           
        place += `</div></div><hr>`

        // 주소
        place += `<div id="search-ranking-address">`+loc.address+`</div>`

        // 반려동물 분류
        place += `<div id="search-ranking-category">`
        for (enterGrade of loc.enterList){
            place += enterGrade.petSizeNo + ` `;
        };  
        place += `</div></div>`

        placeContent.innerHTML = place;
        searchContentsWrap.append(placeContent);
    }
}

// ***커뮤니티 글 추천***

// 인기 조회글 ajax
// function selectPlaceTop(){
//     ajaxGetData(contextPath + "/topPlace.ma", 
//     "",
//     function(result){drawPlaceTop(result)});
// }




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




// for(let todo of todoList){
//     const todoLi = document.createElement('li'); // <li><li>
//     todoLi.className = todo.isDone ? "done" : "";
//     todoLi.innerHTML = todo.title; // <li>${todo.title}</li>
//     todoUl.appendChild(todoLi); // todoUl.innerHTML += `<li>${todo.title}
//     // todoUl 뒤에 innerHTML로 넣어줄게

//     const removeBtn = document.createElement('div');
//     removeBtn.className = 'todo-remove-btn';
//     removeBtn.innerHTML = '<i class="fa-solid fa-xmark"></i>'
//     todoLi.appendChild(removeBtn);




    // console.log(locationList);
    // for(let location of locationList){
    //     let ranking = document.createElement('div');
    //     let star = document.createElement('img');
    //     let rankingStar = document.createElement('div');

    //     ranking.class
    //     star.src = "/resources/img/main/star.png";

    //     console.log(locationList);
    //     for (i = 0; i < Math.round(location.locationStar); i++){
    //         // 여기서 오류가 나버리면 이 파일 전체가 로드 되지 않을 수도 있음
    //         star.src = contextPath + "/resources/img/main/star.png";
    //         rankingStar.appendChild(star);
    //     }

    //     ranking.appendChild(rankingStar);
    
    //     let searchRankingContent = document.createElement('div');
    
        
    
    //     searchRankingContent.classList.add('search-ranking-search', 'gray-round-box');
    //     // searchRankingContent.appendChild();
    //     searchContentsWrap.appendChild(searchRankingContent);
    
    //     // console.log("들어오지도 않은 거야?")
    //     // test.innerHTML = '안녕하세요 innerHTML 입니다.'
    //     // console.log(test);
    //     // test.style.background = "red";

    // }

    // function drawPlaceStar(location){
//     let star = "";
//     star += `<div id="search-ranking-rating">
//                 <div>`+Math.round(location.locationStar)+`</div><div>`;
//     for (i = 0; i < Math.round(location.locationStar); i++){
//         star += `<img class="ranking-star-img" src="resources/img/main/KakaoTalk_20240507_002829702_08.png" alt="">`
//     };           
//     star += `</div></div>`
// }

// function 