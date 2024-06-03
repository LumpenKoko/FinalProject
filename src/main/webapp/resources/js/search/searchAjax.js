let contextPath;
let loginUser;

// body onload 시 실행되는 초기 함수
function init(path, user){
    contextPath = path;
    loginUser = user;
    // drawSearchPage();
    // document.querySelector('.like-btn').click();
}

function ajaxSelectLikeInfo(userNo, locationNo){
    console.log('들어옴')
    console.log(userNo)
    if (userNo != ""){
        console.log("여기는?")
        ajaxGetData(contextPath + "/selectLikeInfo.pl", 
        {
            userNo : userNo,
            locationNo : locationNo
        },
        function(result){console.log(result)});
    }
}

// function ajaxSelectLocation(keyword, cpage){
//     ajaxGetData(contextPath + "/searchKeyword.pl", 
//     {keyword: keyword},

//     function(result){drawPlaceTop(result)});
// }

function drawSearchPage(locationList){
    let searchResultBox = document.querySelector("#search-result-box");

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

// function drawSearchPlace(){

// }

// ajax 기본 함수
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