let contextPath;
let loginUser;
function init(path, user){
    contextPath = path;
    loginUser = user;

    selectPlaceTop();

    for(i = 1; i <= 3; i++){
        selectBoardDetailTop(i);
    }

    selectShortsTop();

    // if (loginUser !== null){
    //     selectRegistPetModal(loginUser);
    // }

}

// function selectRegistPetModal(loginUser){
//     console.log("들어왔어요")
//     let button = document.querySelector("#regist-pet-button");
//     button.click;
// }


// function sendToPage(url){
//     location.href = contextPath + url;
// }

// ***장소 추천***
function selectPlaceTop(){
    
    ajaxGetData(contextPath + "/topPlace.ma", 
    "",
    function(result){drawPlaceTop(result)});
}

function drawPlaceTop(locationList){
    let placeImg = document.querySelector("#place-img");
    placeImg.src = locationList[0].attachment.filePath + locationList[0].attachment.changeName;

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
        place += loc.attachment.filePath + loc.attachment.changeName;
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

// 인기 조회글 ajax
function selectBoardDetailTop(type){
    ajaxGetData(contextPath + "/topBoard.ma?type=" + type,
    "",
    function(result){drawBoardDetailTop(type, result)});
}

function drawBoardDetailTop(type, boardList){
    let boardBox = document.querySelector("#community-ranking>div");

    let communityRankingBox = document.createElement("div");
    communityRankingBox.className = "community-ranking-box";

    let communityTable = document.createElement('table');
    communityTable.className = "community-ranking-table";

    boardBox.append(communityRankingBox);
    communityRankingBox.appendChild(communityTable);

    let board = "";

    board += `<tr><th colspan="2">`;
    switch(type){
        case 1 : 
            board += '인기 조회글';
            break;
        case 2 :
            board += '인기 추천글';
            break;
        case 3 :
            board += '댓글 최다순';
            break;
    }
    board += `</th></tr>`;
    communityTable.innerHTML = board;
    // let communityTable;
    // switch(type){
    //     case 1 : 
    //         communityTable = document.querySelector("#table-count");
    //         break;
    //     case 2 : 
    //         communityTable = document.querySelector("#table-good");
    //         break;
    //     case 3 : 
    //         communityTable = document.querySelector("#table-reply");
    //         break;
    // }
    
    for (i = 0; i < boardList.length; i++){
        board = boardList[i];
        
        let boardRanking = document.createElement('tr');
        boardRanking.className = "community-ranking-box-content";

        boardRanking.onclick = function(board){
            location.href = contextPath + "/detailView.bo?bno=" + board.boardNo;
        }
        communityTable.append(boardRanking);

        let boardDetail = "";

        // 순위
        boardDetail += `<td id="community-ranking-box-ranking">`+ (i + 1) + `</td>`;

        // 내용-제목
        boardDetail += `<td id="community-ranking-box-content">
                            <div class="community-ranking-box-title">
                                <div>`
        boardDetail += boardList[i].boardTitle + `</div>`;

        // 내용-댓글수
        boardDetail += `<span>[`+boardList[i].replyCount+`]</span></div>`;

        // 내용-작성자
        boardDetail += `<div class="community-ranking-box-member">`+boardList[i].userNo+`</div></td>`;
        boardRanking.innerHTML = boardDetail;
        console.log(boardRanking)
    }
    



//         `<tr class="community-ranking-box-content">`
//             `<td id="community-ranking-box-ranking">`5`</td>
//             <td id="community-ranking-box-content">
//                 <div class="community-ranking-box-title">
//                     <div>오늘 한강공원 가는데 돗자리 세트 사서 나눠 가지실 분? 오늘 한강공원 가는데 돗자리</div>
//                     <span>[20]</span>
//                 </div>
//                 <div class="community-ranking-box-member">쿠키언니</div>
//             </td>
//         </tr>

//     </table>
// </div>`
}


// ***쇼츠 추천***
function selectShortsTop(){
    ajaxGetData(contextPath + "/topShorts.ma", 
    "",
    function(result){drawShortsTop(result)});
}

function drawShortsTop(shortsList){
    let shortsRanking = document.querySelector("#shorts-ranking>div");
    
    for(let shorts of shortsList){
        let shortsRankingContent = document.createElement('div');
        shortsRankingContent.className = "shorts-ranking-content";
        shortsRanking.append(shortsRankingContent);

        shortsRankingContent.onclick = function(){
            location.href = contextPath + "/shortsView.bo?sno=" + shorts.shortsNo;
        }

        shortsBox = "";

        // 썸네일 이미지
        shortsBox += `<div><img src=` + shorts.attachment.filePath + shorts.attachment.changeName + ` alt=""></div>`;

        // 내용
        shortsBox += `<div class="shorts-ranking-text">
                            <div class="shorts-ranking-text-title">
                                <div class="shorts-ranking-text-user">`
        shortsBox += shorts.userNo;
        shortsBox += `</div>
                          <div class="shorts-ranking-text-date">`
        shortsBox += shorts.enrollDate;
        shortsBox += `</div></div>
                          <div class="shorts-ranking-text-content">`
        shortsBox += shorts.shortsContent;
        shortsBox += `</div></div></div>`

        shortsRankingContent.innerHTML = shortsBox;
    }

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