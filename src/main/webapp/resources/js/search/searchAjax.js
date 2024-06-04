let contextPath;
let loginUser;

// body onload 시 실행되는 초기 함수
function init(path, user){
    contextPath = path;
    loginUser = user;
    // drawSearchPage();
    // document.querySelector('.like-btn').click();
}

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

function getLocationData(data, callback){
    $.ajax({
        url: contextPath + "/searchPage.pl",
        data: data,
        success: function (result) {
            callback(result)
        },
        error: function () {
            console.log("정보를 불러오는데 실패 했습니다.");
        }
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

// 좋아요
// function ajaxSelectLikeInfo(userNo, locationNo){
//     console.log('들어옴')
//     console.log(userNo)
//     if (userNo != ""){
//         console.log("여기는?")
//         ajaxGetData(contextPath + "/selectLikeInfo.pl", 
//         {
//             userNo : userNo,
//             locationNo : locationNo
//         },
//         function(result){console.log(result)});
//     }
// }

// function drawSearchPlace(){

// }