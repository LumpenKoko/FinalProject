let contextPath;
let registPetTime = "registPetTime";

// body onload 시 실행되는 초기 함수
function init(path){
    contextPath = path;
    
    document.querySelector("#onload-button").click(); // 반려동물 등록 모달을 위한 트리거 함수 (세션의 유저 정보 넘기기 위함)
    
    selectPlaceTop("", drawPlaceTop); // 추천 장소 ajax

    // 추천 커뮤니티 게시글
    for(i = 1; i <= 3; i++){
        selectBoardDetailTop(i, "", drawBoardDetailTop);
    }

    selectShortsTop("", drawShortsTop); // 추천 쇼츠
}